#!/bin/bash

# WSO2 APIM 4.2 Multi-DC Setup Script - TCP Event Hub (No SSL)
# For Docker testbed environments where all containers share a trusted network
# This eliminates SSL handshake complexity for demonstration purposes

echo "Creating WSO2 APIM Multi-DC Configuration with TCP Event Hub..."
echo "This configuration uses plain TCP for Event Hub (suitable for trusted networks)"
echo ""

# Define port mappings for each datacenter
# These must match docker-compose.yml exactly
declare -A CP_HTTPS_PORT=([1]="9443" [2]="20443" [3]="21443" [4]="22443")
declare -A CP_HTTP_PORT=([1]="9763" [2]="20763" [3]="21763" [4]="22763")
declare -A GW_HTTP_PORT=([1]="18280" [2]="19280" [3]="20280" [4]="21280")
declare -A GW_HTTPS_PORT=([1]="18243" [2]="19243" [3]="20243" [4]="21243")

# Create directory structure
for dc in 1 2 3 4; do
    echo "Setting up Datacenter $dc..."
    
    # Create directories
    mkdir -p config-templates/cp/dc${dc}/repository/conf
    mkdir -p config-templates/tm/dc${dc}/repository/conf
    mkdir -p config-templates/gw/dc${dc}/repository/conf
    
    # Get port values for this DC
    cp_https=${CP_HTTPS_PORT[$dc]}
    cp_http=${CP_HTTP_PORT[$dc]}
    gw_http=${GW_HTTP_PORT[$dc]}
    gw_https=${GW_HTTPS_PORT[$dc]}
    
    case "${dc}" in
    1|2)
      EVENT_ENDPOINTS='["tcp://wso2apim-cp-dc1:5672", "tcp://wso2apim-cp-dc2:5672"]'
      ;;
    3|4)
      EVENT_ENDPOINTS='["tcp://wso2apim-cp-dc3:5672", "tcp://wso2apim-cp-dc4:5672"]'
      ;;
    esac    

    # ========================================
    # Create Control Plane deployment.toml
    # ========================================
    cat > config-templates/cp/dc${dc}/repository/conf/deployment.toml <<EOF
[server]
hostname = "localhost"
offset = 0
mode = "single"
base_path = "\${carbon.protocol}://\${carbon.host}:\${carbon.management.port}"
server_role = "control-plane"

[user_store]
type = "database_unique_id"

[super_admin]
username = "admin"
password = "admin"
create_admin_account = true

[database.apim_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/apim_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.apim_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[database.shared_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/shared_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.shared_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[keystore.tls]
file_name = "wso2carbon.jks"
type = "JKS"
password = "wso2carbon"
alias = "wso2carbon"
key_password = "wso2carbon"

[truststore]
file_name = "client-truststore.jks"
type = "JKS"
password = "wso2carbon"

# Event Hub Configuration - TCP only (no SSL for simplicity in testbed)
[apim.event_hub]
enable = true
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"
event_listening_endpoints = ${EVENT_ENDPOINTS}

# Cross-DC Event Hub Publishing - All CPs publish to all other CPs
[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc1:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc2:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc3:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc4:5672"]

# Traffic Manager Configuration (CP connects to its local TM)
[apim.throttling]
service_url = "https://wso2apim-tm-dc${dc}:9443/services/"
throttle_decision_endpoints = ["tcp://wso2apim-tm-dc${dc}:5672"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc1:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc1:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc2:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc2:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc3:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc3:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc4:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc4:9711"]

# Gateway Configuration - External URLs use host-mapped ports
[[apim.gateway.environment]]
name = "Production and Sandbox - DC${dc}"
type = "hybrid"
display_in_api_console = true
description = "Gateway environment for datacenter ${dc}"
show_as_token_endpoint_url = true
service_url = "https://wso2apim-gw-dc${dc}:9443/services/"
ws_endpoint = "ws://wso2apim-gw-dc${dc}:9099"
wss_endpoint = "wss://wso2apim-gw-dc${dc}:8099"
http_endpoint = "http://localhost:${gw_http}"
https_endpoint = "https://localhost:${gw_https}"

[apim.key_manager]
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"

[apim.devportal]
url = "https://localhost:${cp_https}/devportal"
EOF

    # ========================================
    # Create Traffic Manager deployment.toml
    # ========================================
    cat > config-templates/tm/dc${dc}/repository/conf/deployment.toml <<EOF
[server]
hostname = "localhost"
offset = 0
mode = "single"
base_path = "\${carbon.protocol}://\${carbon.host}:\${carbon.management.port}"
server_role = "traffic-manager"

[user_store]
type = "database_unique_id"

[super_admin]
username = "admin"
password = "admin"
create_admin_account = true

[database.apim_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/apim_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.apim_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[database.shared_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/shared_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.shared_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[keystore.tls]
file_name = "wso2carbon.jks"
type = "JKS"
password = "wso2carbon"
alias = "wso2carbon"
key_password = "wso2carbon"

[truststore]
file_name = "client-truststore.jks"
type = "JKS"
password = "wso2carbon"

# Event Hub Configuration - TM subscribes to CP Event Hub to receive policy updates
[apim.event_hub]
enable = true
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"
event_listening_endpoints = ${EVENT_ENDPOINTS}

# Traffic Manager Configuration
[apim.throttling]
enable_data_publishing = true
enable_policy_deploy = true
enable_blacklist_condition = true
enable_decision_connection = true
receiver_url = "tcp://wso2apim-tm-dc${dc}:9611"
receiver_auth_url = "ssl://wso2apim-tm-dc${dc}:9711"

[apim.throttling.jms]
start_delay = 0

[apim.throttling.event_sync]
hostName = "0.0.0.0"
port = 11224

# TM Clustering - All TMs know about each other
[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc1:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc1:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc2:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc2:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc3:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc3:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc4:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc4:9711"]

# Event Publisher Configuration for TM clustering
[apim.throttling.event_publisher]
receiver_username = "\$ref{super_admin.username}"
receiver_password = "\$ref{super_admin.password}"

[[apim.throttling.event_publisher.url_group]]
receiver_url_set = ["tcp://wso2apim-tm-dc1:9611"]
auth_url_set = ["ssl://wso2apim-tm-dc1:9711"]

[[apim.throttling.event_publisher.url_group]]
receiver_url_set = ["tcp://wso2apim-tm-dc2:9611"]
auth_url_set = ["ssl://wso2apim-tm-dc2:9711"]

[[apim.throttling.event_publisher.url_group]]
receiver_url_set = ["tcp://wso2apim-tm-dc3:9611"]
auth_url_set = ["ssl://wso2apim-tm-dc3:9711"]

[[apim.throttling.event_publisher.url_group]]
receiver_url_set = ["tcp://wso2apim-tm-dc4:9611"]
auth_url_set = ["ssl://wso2apim-tm-dc4:9711"]
EOF

    # ========================================
    # Create Gateway deployment.toml
    # ========================================
    cat > config-templates/gw/dc${dc}/repository/conf/deployment.toml <<EOF
[server]
hostname = "localhost"
offset = 0
mode = "single"
base_path = "\${carbon.protocol}://\${carbon.host}:\${carbon.management.port}"
server_role = "gateway-worker"

[user_store]
type = "database_unique_id"

[super_admin]
username = "admin"
password = "admin"
create_admin_account = true

[database.apim_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/apim_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.apim_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[database.shared_db]
type = "mysql"
url = "jdbc:mysql://mysql_container:3306/shared_db?useSSL=false&amp;allowPublicKeyRetrieval=true"
username = "wso2carbon"
password = "wso2carbon"
driver = "com.mysql.cj.jdbc.Driver"

[database.shared_db.pool_options]
maxActive = 50
maxWait = 60000
minIdle = 5
testOnBorrow = true
validationQuery = "SELECT 1"
validationInterval = 30000

[keystore.tls]
file_name = "wso2carbon.jks"
type = "JKS"
password = "wso2carbon"
alias = "wso2carbon"
key_password = "wso2carbon"

[truststore]
file_name = "client-truststore.jks"
type = "JKS"
password = "wso2carbon"

# Key Manager Configuration
[apim.key_manager]
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"

# Traffic Manager Configuration - GW connects to its local TM for throttle decisions
[apim.throttling]
service_url = "https://wso2apim-tm-dc${dc}:9443/services/"
throttle_decision_endpoints = ["tcp://wso2apim-tm-dc${dc}:5672"]
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc1:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc1:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc2:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc2:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc3:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc3:9711"]

[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc4:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc4:9711"]

# Event Hub Configuration - GW subscribes to CP Event Hub for API/App updates
[apim.event_hub]
enable = true
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"
event_listening_endpoints = ${EVENT_ENDPOINTS}

# Cache Configuration
[apim.cache.gateway_token]
enable = true
expiry_time = 900

[apim.cache.resource]
enable = true
expiry_time = 900

[apim.cache.jwt_claim]
enable = true
expiry_time = 900

[apim.analytics]
enable = false
EOF

# ----------------------------------------------------------------------
# Cross DC CP to CP JMS event publishers and JNDI configs
# One set of publishers per CP per remote region
# ----------------------------------------------------------------------

for dc in 1 2 3 4; do
  cp_base_dir="config-templates/cp/dc${dc}"
  cp_conf_dir="${cp_base_dir}/repository/conf"
  cp_evpub_dir="${cp_base_dir}/repository/deployment/server/eventpublishers"

  mkdir -p "${cp_conf_dir}"
  mkdir -p "${cp_evpub_dir}"

  for target_dc in 1 2 3 4; do
    # Skip self
    if [ "${target_dc}" = "${dc}" ]; then
      continue
    fi

    jndi_region_file="${cp_conf_dir}/jndi-region${target_dc}.properties"
    jndi2_region_file="${cp_conf_dir}/jndi2-region${target_dc}.properties"

    # JNDI for notification, token revocation, key manager, async webhooks
    cat > "${jndi_region_file}" <<EOF
connectionfactory.TopicConnectionFactory = amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc${target_dc}:5672?retries='5'%26connectdelay='50';'

topic.tokenRevocation = tokenRevocation
topic.keyManager = keyManager
topic.notification = notification
topic.asyncWebhooksData = asyncWebhooksData
EOF

    # JNDI for blocking and async webhooks (throttleData)
    cat > "${jndi2_region_file}" <<EOF
connectionfactory.TopicConnectionFactory = amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc${target_dc}:5672?retries='5'%26connectdelay='50';'

topic.throttleData = throttleData
topic.asyncWebhooksData = asyncWebhooksData
EOF

    # Notifications data publisher
    cat > "${cp_evpub_dir}/notificationJMSPublisherRegion${target_dc}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<eventPublisher name="notificationJMSPublisherRegion${target_dc}" statistics="disable"
trace="disable"
xmlns="http://wso2.org/carbon/eventpublisher">
  <from streamName="org.wso2.apimgt.notification.stream" version="1.0.0"/>
  <mapping customMapping="disable" type="json"/>
  <to eventAdapterType="jms">
    <property name="java.naming.factory.initial">org.wso2.andes.jndi.PropertiesFileInitialContextFactory</property>
    <property name="java.naming.provider.url">repository/conf/jndi-region${target_dc}.properties</property>
    <property name="transport.jms.DestinationType">topic</property>
    <property name="transport.jms.Destination">notification</property>
    <property name="transport.jms.ConcurrentPublishers">allow</property>
    <property name="transport.jms.ConnectionFactoryJNDIName">TopicConnectionFactory</property>
  </to>
</eventPublisher>
EOF

    # Token revocation data publisher
    cat > "${cp_evpub_dir}/tokenRevocationJMSPublisherRegion${target_dc}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<eventPublisher name="tokenRevocationJMSPublisherRegion${target_dc}" statistics="disable"
trace="disable"
xmlns="http://wso2.org/carbon/eventpublisher">
  <from streamName="org.wso2.apimgt.token.revocation.stream" version="1.0.0"/>
  <mapping customMapping="disable" type="json"/>
  <to eventAdapterType="jms">
    <property name="java.naming.factory.initial">org.wso2.andes.jndi.PropertiesFileInitialContextFactory</property>
    <property name="java.naming.provider.url">repository/conf/jndi-region${target_dc}.properties</property>
    <property name="transport.jms.DestinationType">topic</property>
    <property name="transport.jms.Destination">tokenRevocation</property>
    <property name="transport.jms.ConcurrentPublishers">allow</property>
    <property name="transport.jms.ConnectionFactoryJNDIName">TopicConnectionFactory</property>
  </to>
</eventPublisher>
EOF

    # Key management data publisher
    cat > "${cp_evpub_dir}/keymgtEventJMSEventPublisherRegion${target_dc}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<eventPublisher name="keymgtEventJMSEventPublisherRegion${target_dc}" statistics="disable"
trace="disable"
xmlns="http://wso2.org/carbon/eventpublisher">
  <from streamName="org.wso2.apimgt.keymgt.stream" version="1.0.0"/>
  <mapping customMapping="disable" type="json"/>
  <to eventAdapterType="jms">
    <property name="java.naming.factory.initial">org.wso2.andes.jndi.PropertiesFileInitialContextFactory</property>
    <property name="java.naming.provider.url">repository/conf/jndi-region${target_dc}.properties</property>
    <property name="transport.jms.DestinationType">topic</property>
    <property name="transport.jms.Destination">keyManager</property>
    <property name="transport.jms.ConcurrentPublishers">allow</property>
    <property name="transport.jms.ConnectionFactoryJNDIName">TopicConnectionFactory</property>
  </to>
</eventPublisher>
EOF

    # Async webhooks data publisher
    cat > "${cp_evpub_dir}/asyncWebhooksEventPublisher-1.0.0-Region${target_dc}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<eventPublisher name="asyncWebhooksEventPublisher-1.0.0-Region${target_dc}" statistics="disable" processing="disable"
trace="disable"
xmlns="http://wso2.org/carbon/eventpublisher">
  <from streamName="org.wso2.apimgt.webhooks.request.stream" version="1.0.0"/>
  <mapping customMapping="disable" type="json"/>
  <to eventAdapterType="jms">
    <property name="java.naming.factory.initial">org.wso2.andes.jndi.PropertiesFileInitialContextFactory</property>
    <property name="java.naming.provider.url">repository/conf/jndi2-region${target_dc}.properties</property>
    <property name="transport.jms.DestinationType">topic</property>
    <property name="transport.jms.Destination">asyncWebhooksData</property>
    <property name="transport.jms.ConcurrentPublishers">allow</property>
    <property name="transport.jms.ConnectionFactoryJNDIName">TopicConnectionFactory</property>
  </to>
</eventPublisher>
EOF

    # Blocking event data publisher
    cat > "${cp_evpub_dir}/blockingEventJMSPublisherRegion${target_dc}.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<eventPublisher name="blockingEventJMSPublisherRegion${target_dc}" statistics="disable"
trace="disable"
xmlns="http://wso2.org/carbon/eventpublisher">
  <from streamName="org.wso2.blocking.request.stream" version="1.0.0"/>
  <mapping customMapping="disable" type="json"/>
  <to eventAdapterType="jms">
    <property name="java.naming.factory.initial">org.wso2.andes.jndi.PropertiesFileInitialContextFactory</property>
    <property name="java.naming.provider.url">repository/conf/jndi2-region${target_dc}.properties</property>
    <property name="transport.jms.DestinationType">topic</property>
    <property name="transport.jms.Destination">throttleData</property>
    <property name="transport.jms.ConcurrentPublishers">allow</property>
    <property name="transport.jms.ConnectionFactoryJNDIName">TopicConnectionFactory</property>
  </to>
</eventPublisher>
EOF

  done
done

    echo "  ✓ Created configuration files for Datacenter $dc"
done

echo ""
echo "============================================"
echo "Configuration setup complete!"
echo "============================================"
echo ""
echo "📋 Event Hub Configuration (TCP - No SSL):"
echo "   - Each CP runs Event Hub broker on port 5672"
echo "   - All CPs publish events to all other CPs (cross-DC sync)"
echo "   - TMs subscribe to their local CP's Event Hub for policy updates"
echo "   - GWs subscribe to their local CP's Event Hub for API/App updates"
echo ""
echo "📋 Traffic Manager Configuration:"
echo "   - Each TM runs JMS broker on port 5672 for throttle decisions"
echo "   - Binary receiver on port 9611 (TCP) for event publishing"
echo "   - Binary auth on port 9711 (SSL)"
echo "   - All TMs form a cluster for throttling sync"
echo ""
echo "Directory structure created:"
echo "  config-templates/"
echo "    ├── cp/{dc1,dc2,dc3,dc4}/repository/conf/deployment.toml"
echo "    ├── tm/{dc1,dc2,dc3,dc4}/repository/conf/deployment.toml"
echo "    └── gw/{dc1,dc2,dc3,dc4}/repository/conf/deployment.toml"
echo ""
echo "Next steps:"
echo "  1. Build Docker images: ./build.sh"
echo "  2. Start services: docker-compose up -d"
echo "  3. Wait for all containers to be healthy"
echo "  4. Test Event Hub sync: Create API in DC1, verify in DC2/3/4"
echo ""
