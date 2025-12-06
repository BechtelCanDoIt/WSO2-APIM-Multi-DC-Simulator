#!/bin/bash

# WSO2 APIM 4.2 Multi-DC Setup Script
# Creates configuration files for 4 datacenters (dc1-dc4)
# All instances use offset=0 (no port offset needed with Docker)

echo "Creating WSO2 APIM Multi-DC Configuration Structure..."

# Define datacenter port mappings
# Format: HTTPS_MGMT:HTTP_MGMT:GW_HTTP:GW_HTTPS:TM_BINARY:TM_BINARY_SSL:AMQP
declare -A DATACENTERS=(
    [1]="19443:19763:18280:18243:19611:19711:15672"
    [2]="20443:20763:19280:19243:20611:20711:16672"
    [3]="21443:21763:20280:20243:21611:21711:17672"
    [4]="22443:22763:21280:21243:22611:22711:18672"
)

# Create directory structure
for dc in 1 2 3 4; do
    echo "Setting up Datacenter $dc..."
    
    # Create directories
    mkdir -p config-templates/cp/dc${dc}/repository/conf
    mkdir -p config-templates/tm/dc${dc}/repository/conf
    mkdir -p config-templates/gw/dc${dc}/repository/conf
    
    # Parse port mappings
    IFS=':' read -r https_mgmt http_mgmt gw_http gw_https tm_binary tm_binary_ssl amqp <<< "${DATACENTERS[$dc]}"
    
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;allowPublicKeyRetrieval=true"
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;llowPublicKeyRetrieval=true"
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

# Event Hub Configuration for CP Sync
[apim.event_hub]
enable = true
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"
event_listening_endpoints = ["tcp://wso2apim-cp-dc${dc}:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc1:5672"]
auth_urls = ["ssl://wso2apim-cp-dc1:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc2:5672"]
auth_urls = ["ssl://wso2apim-cp-dc2:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc3:5672"]
auth_urls = ["ssl://wso2apim-cp-dc3:5672"]

[[apim.event_hub.publish.url_group]]
urls = ["tcp://wso2apim-cp-dc4:5672"]
auth_urls = ["ssl://wso2apim-cp-dc4:5672"]

# Traffic Manager Configuration
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

# Gateway Configuration
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
url = "https://localhost:${https_mgmt}/devportal"

# External JNDI Event Hub Configurations
[[event_listener]]
id = "event_hub_external_dc1"
type = "org.wso2.carbon.apimgt.impl.notification.EventHubEventListener"
name = "event_hub_external_dc1"
order = 10
[event_listener.properties]
notification.event.publisher.type = "external"
notification.event.publisher.event.waiting.time = 5000

[[event_listener.properties.jndi_connection_factories]]
java.naming.factory.initial = "org.wso2.andes.jndi.PropertiesFileInitialContextFactory"
connectionfactory.QueueConnectionFactory = "amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc1:5672'"

[[event_listener]]
id = "event_hub_external_dc2"
type = "org.wso2.carbon.apimgt.impl.notification.EventHubEventListener"
name = "event_hub_external_dc2"
order = 11
[event_listener.properties]
notification.event.publisher.type = "external"
notification.event.publisher.event.waiting.time = 5000

[[event_listener.properties.jndi_connection_factories]]
java.naming.factory.initial = "org.wso2.andes.jndi.PropertiesFileInitialContextFactory"
connectionfactory.QueueConnectionFactory = "amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc2:5672'"

[[event_listener]]
id = "event_hub_external_dc3"
type = "org.wso2.carbon.apimgt.impl.notification.EventHubEventListener"
name = "event_hub_external_dc3"
order = 12
[event_listener.properties]
notification.event.publisher.type = "external"
notification.event.publisher.event.waiting.time = 5000

[[event_listener.properties.jndi_connection_factories]]
java.naming.factory.initial = "org.wso2.andes.jndi.PropertiesFileInitialContextFactory"
connectionfactory.QueueConnectionFactory = "amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc3:5672'"

[[event_listener]]
id = "event_hub_external_dc4"
type = "org.wso2.carbon.apimgt.impl.notification.EventHubEventListener"
name = "event_hub_external_dc4"
order = 13
[event_listener.properties]
notification.event.publisher.type = "external"
notification.event.publisher.event.waiting.time = 5000

[[event_listener.properties.jndi_connection_factories]]
java.naming.factory.initial = "org.wso2.andes.jndi.PropertiesFileInitialContextFactory"
connectionfactory.QueueConnectionFactory = "amqp://admin:admin@clientid/carbon?brokerlist='tcp://wso2apim-cp-dc4:5672'"
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;allowPublicKeyRetrieval=true"
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;allowPublicKeyRetrieval=true"
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

# TM Clustering
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

# Event Publisher Configuration
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;allowPublicKeyRetrieval=true"
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
url = "jdbc:mysql://host.docker.internal:3306/wso2carbon?useSSL=false&amp;allowPublicKeyRetrieval=true"
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

# Traffic Manager Configuration
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

# Event Hub Configuration
[apim.event_hub]
enable = true
username = "\$ref{super_admin.username}"
password = "\$ref{super_admin.password}"
service_url = "https://wso2apim-cp-dc${dc}:9443/services/"
event_listening_endpoints = ["tcp://wso2apim-cp-dc${dc}:5672"]

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

    echo "  ✓ Created configuration files for Datacenter $dc"
done

echo ""
echo "============================================"
echo "Configuration setup complete!"
echo "============================================"
echo ""
echo "Directory structure created:"
echo "  config-templates/"
echo "    ├── cp/{dc1,dc2,dc3,dc4}/repository/conf/"
echo "    ├── tm/{dc1,dc2,dc3,dc4}/repository/conf/"
echo "    └── gw/{dc1,dc2,dc3,dc4}/repository/conf/"
echo ""
echo "All instances use offset=0 (Docker handles port isolation)"
echo ""
echo "Next steps:"
echo "  1. Build Docker images: ./build.sh"
echo "  2. Start services: docker-compose up -d"
echo "  3. Access Control Planes at:"
echo "     - DC1: https://localhost:19443/carbon"
echo "     - DC2: https://localhost:20443/carbon"
echo "     - DC3: https://localhost:21443/carbon"
echo "     - DC4: https://localhost:22443/carbon"
echo ""
