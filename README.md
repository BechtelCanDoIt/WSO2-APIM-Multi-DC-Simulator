# WSO2 API Manager 4.2 Multi-Datacenter Deployment Local Simulator

Complete Docker-based setup for **4 distributed WSO2 APIM environments** with Control Plane (CP), Traffic Manager (TM), and Gateway (GW) components sharing a common MySQL database.

## Architecture Overview

Each datacenter (DC1-DC4) consists of:
- **Control Plane (CP)**: API lifecycle management, publisher, and developer portal
- **Traffic Manager (TM)**: Throttling policies and rate limiting
- **Gateway (GW)**: API traffic routing and policy enforcement

All instances use **offset=0** (no port offset) since Docker provides network isolation.

## Key Features

✅ **Event Hub Synchronization**: APIs created on any CP broadcast to all others  
✅ **Traffic Manager Clustering**: Throttling policies sync across all TM nodes  
✅ **Shared Database**: All environments use a common MySQL database  
✅ **No Port Offsets**: Clean architecture with Docker network isolation  
✅ **Health Checks**: Automated dependency management with health monitoring  
✅ **Resource Limits**: Memory and logging controls for production use  

## Prerequisites

1. **Docker** and **Docker Compose** installed
2. **MySQL 8.0** database running on `localhost:3306` with:
   - Database: `wso2carbon`
   - Username: `wso2carbon`
   - Password: `wso2carbon`
3. Database tables initialized (run WSO2 APIM database scripts)
4. **WSO2 subscription** with access to `docker.wso2.com`

## Quick Start

### 1. Setup Configuration Files

```bash
chmod +x setup-configs.sh
./setup-configs.sh
```

This creates the directory structure:
```
tree config-templates/
config-templates/
├── cp
│   ├── dc1
│   │   └── repository
│   │       ├── conf
│   │       │   ├── deployment.toml
│   │       │   ├── jndi2-region2.properties
│   │       │   ├── jndi2-region3.properties
│   │       │   ├── jndi2-region4.properties
│   │       │   ├── jndi-region2.properties
│   │       │   ├── jndi-region3.properties
│   │       │   └── jndi-region4.properties
│   │       └── deployment
│   │           └── server
│   │               └── eventpublishers
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region2.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region3.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region4.xml
│   │                   ├── blockingEventJMSPublisherRegion2.xml
│   │                   ├── blockingEventJMSPublisherRegion3.xml
│   │                   ├── blockingEventJMSPublisherRegion4.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion2.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion3.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion4.xml
│   │                   ├── notificationJMSPublisherRegion2.xml
│   │                   ├── notificationJMSPublisherRegion3.xml
│   │                   ├── notificationJMSPublisherRegion4.xml
│   │                   ├── tokenRevocationJMSPublisherRegion2.xml
│   │                   ├── tokenRevocationJMSPublisherRegion3.xml
│   │                   └── tokenRevocationJMSPublisherRegion4.xml
│   ├── dc2
│   │   └── repository
│   │       ├── conf
│   │       │   ├── deployment.toml
│   │       │   ├── jndi2-region1.properties
│   │       │   ├── jndi2-region3.properties
│   │       │   ├── jndi2-region4.properties
│   │       │   ├── jndi-region1.properties
│   │       │   ├── jndi-region3.properties
│   │       │   └── jndi-region4.properties
│   │       └── deployment
│   │           └── server
│   │               └── eventpublishers
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region1.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region3.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region4.xml
│   │                   ├── blockingEventJMSPublisherRegion1.xml
│   │                   ├── blockingEventJMSPublisherRegion3.xml
│   │                   ├── blockingEventJMSPublisherRegion4.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion1.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion3.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion4.xml
│   │                   ├── notificationJMSPublisherRegion1.xml
│   │                   ├── notificationJMSPublisherRegion3.xml
│   │                   ├── notificationJMSPublisherRegion4.xml
│   │                   ├── tokenRevocationJMSPublisherRegion1.xml
│   │                   ├── tokenRevocationJMSPublisherRegion3.xml
│   │                   └── tokenRevocationJMSPublisherRegion4.xml
│   ├── dc3
│   │   └── repository
│   │       ├── conf
│   │       │   ├── deployment.toml
│   │       │   ├── jndi2-region1.properties
│   │       │   ├── jndi2-region2.properties
│   │       │   ├── jndi2-region4.properties
│   │       │   ├── jndi-region1.properties
│   │       │   ├── jndi-region2.properties
│   │       │   └── jndi-region4.properties
│   │       └── deployment
│   │           └── server
│   │               └── eventpublishers
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region1.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region2.xml
│   │                   ├── asyncWebhooksEventPublisher-1.0.0-Region4.xml
│   │                   ├── blockingEventJMSPublisherRegion1.xml
│   │                   ├── blockingEventJMSPublisherRegion2.xml
│   │                   ├── blockingEventJMSPublisherRegion4.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion1.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion2.xml
│   │                   ├── keymgtEventJMSEventPublisherRegion4.xml
│   │                   ├── notificationJMSPublisherRegion1.xml
│   │                   ├── notificationJMSPublisherRegion2.xml
│   │                   ├── notificationJMSPublisherRegion4.xml
│   │                   ├── tokenRevocationJMSPublisherRegion1.xml
│   │                   ├── tokenRevocationJMSPublisherRegion2.xml
│   │                   └── tokenRevocationJMSPublisherRegion4.xml
│   └── dc4
│       └── repository
│           ├── conf
│           │   ├── deployment.toml
│           │   ├── jndi2-region1.properties
│           │   ├── jndi2-region2.properties
│           │   ├── jndi2-region3.properties
│           │   ├── jndi-region1.properties
│           │   ├── jndi-region2.properties
│           │   └── jndi-region3.properties
│           └── deployment
│               └── server
│                   └── eventpublishers
│                       ├── asyncWebhooksEventPublisher-1.0.0-Region1.xml
│                       ├── asyncWebhooksEventPublisher-1.0.0-Region2.xml
│                       ├── asyncWebhooksEventPublisher-1.0.0-Region3.xml
│                       ├── blockingEventJMSPublisherRegion1.xml
│                       ├── blockingEventJMSPublisherRegion2.xml
│                       ├── blockingEventJMSPublisherRegion3.xml
│                       ├── keymgtEventJMSEventPublisherRegion1.xml
│                       ├── keymgtEventJMSEventPublisherRegion2.xml
│                       ├── keymgtEventJMSEventPublisherRegion3.xml
│                       ├── notificationJMSPublisherRegion1.xml
│                       ├── notificationJMSPublisherRegion2.xml
│                       ├── notificationJMSPublisherRegion3.xml
│                       ├── tokenRevocationJMSPublisherRegion1.xml
│                       ├── tokenRevocationJMSPublisherRegion2.xml
│                       └── tokenRevocationJMSPublisherRegion3.xml
├── gw
│   ├── dc1
│   │   └── repository
│   │       └── conf
│   │           └── deployment.toml
│   ├── dc2
│   │   └── repository
│   │       └── conf
│   │           └── deployment.toml
│   ├── dc3
│   │   └── repository
│   │       └── conf
│   │           └── deployment.toml
│   └── dc4
│       └── repository
│           └── conf
│               └── deployment.toml
└── tm
    ├── dc1
    │   └── repository
    │       └── conf
    │           └── deployment.toml
    ├── dc2
    │   └── repository
    │       └── conf
    │           └── deployment.toml
    ├── dc3
    │   └── repository
    │       └── conf
    │           └── deployment.toml
    └── dc4
        └── repository
            └── conf
                └── deployment.toml

```

### 2. Initialize Database

Ensure your MySQL database has the WSO2 APIM tables:

```bash
mysql -u wso2carbon -p wso2carbon < <WSO2_HOME>/dbscripts/mysql.sql
mysql -u wso2carbon -p wso2carbon < <WSO2_HOME>/dbscripts/apimgt/mysql.sql
```

### 3. Build Docker Images

```bash
chmod +x build.sh
./build.sh
```

This will:
- Login to WSO2 Docker registry
- Build 3 optimized images (CP, TM, GW) with profile optimization
- Tag them as `apim-cp:4.2.0`, `apim-tm:4.2.0`, `apim-gw:4.2.0`

### 4. Start All Services

```bash
docker-compose up -d
```

### 5. Monitor Startup

```bash
# Watch all containers
docker-compose logs -f

# Check specific datacenter
docker logs -f wso2apim-cp-dc1

# Check overall status
docker-compose ps
```

## Port Mappings

### Datacenter 1
- **CP**: 19443 (HTTPS), 19763 (HTTP)
- **TM**: 19611 (Binary), 19711 (Binary SSL), 15672 (AMQP)
- **GW**: 18280 (HTTP), 18243 (HTTPS), 19444 (Management)

### Datacenter 2
- **CP**: 20443 (HTTPS), 20763 (HTTP)
- **TM**: 20611 (Binary), 20711 (Binary SSL), 16672 (AMQP)
- **GW**: 19280 (HTTP), 19243 (HTTPS), 20444 (Management)

### Datacenter 3
- **CP**: 21443 (HTTPS), 21763 (HTTP)
- **TM**: 21611 (Binary), 21711 (Binary SSL), 17672 (AMQP)
- **GW**: 20280 (HTTP), 20243 (HTTPS), 21444 (Management)

### Datacenter 4
- **CP**: 22443 (HTTPS), 22763 (HTTP)
- **TM**: 22611 (Binary), 22711 (Binary SSL), 18672 (AMQP)
- **GW**: 21280 (HTTP), 21243 (HTTPS), 22444 (Management)

## Access URLs

- **DC1 Publisher**: https://localhost:19443/publisher
- **DC2 Publisher**: https://localhost:20443/publisher
- **DC3 Publisher**: https://localhost:21443/publisher
- **DC4 Publisher**: https://localhost:22443/publisher

- **DC1 Admin**: https://localhost:19443/admin
- **DC2 Admin**: https://localhost:20443/admin
- **DC3 Admin**: https://localhost:21443/admin
- **DC4 Admin**: https://localhost:22443/admin

**Default credentials**: `admin` / `admin`


## Memory Use

Once running you'll use about 24 Gig plus Databae memory.

```
CONTAINER ID   NAME              CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
b8fc625a1cbd   wso2apim-gw-dc2   1.14%     1.423GiB / 2GiB       71.16%    4.14MB / 3.44MB   4.1kB / 332MB     1059
841f979a4955   wso2apim-gw-dc4   0.88%     1.448GiB / 2GiB       72.40%    4.14MB / 3.45MB   8.19kB / 330MB    1056
b034c942a5ae   wso2apim-gw-dc3   3.19%     1.471GiB / 2GiB       73.55%    4.14MB / 3.44MB   147kB / 243MB     1064
0d116cf528a2   wso2apim-gw-dc1   1.77%     1.547GiB / 2GiB       77.34%    4.11MB / 3.41MB   0B / 331MB        1059
5111a31cbeca   wso2apim-tm-dc4   0.56%     1.393GiB / 2GiB       69.64%    4.93MB / 3.13MB   111kB / 171MB     536
1f42b429fecc   wso2apim-cp-dc2   0.76%     1.637GiB / 2GiB       81.86%    85MB / 64.2MB     139kB / 206MB     417
0a31074e9911   wso2apim-tm-dc1   0.84%     1.524GiB / 2GiB       76.21%    4.92MB / 3.13MB   98.3kB / 174MB    535
ca02d7844e96   wso2apim-tm-dc3   0.93%     1.305GiB / 2GiB       65.24%    4.93MB / 3.13MB   229kB / 115MB     538
c805597ffd92   wso2apim-cp-dc1   4.39%     1.712GiB / 2GiB       85.61%    86.3MB / 68.9MB   201kB / 287MB     520
6b0573c9ef80   wso2apim-cp-dc4   0.65%     1.657GiB / 2GiB       82.83%    85MB / 64.2MB     180kB / 208MB     407
c6a4bf85536d   wso2apim-cp-dc3   1.38%     1.632GiB / 2GiB       81.58%    85.6MB / 64.7MB   197kB / 213MB     516
af9da0d2da2e   wso2apim-tm-dc2   0.74%     1.359GiB / 2GiB       67.94%    4.93MB / 3.13MB   119kB / 176MB     540
b6b6e7b72c3a   mysql_container   0.33%     955.3MiB / 62.56GiB   1.49%     1.13GB / 1.46GB   67.4MB / 2.25GB   71   << external of this project
```

## Testing Event Hub Synchronization

### Test 1: API Synchronization

1. **Create API on DC1**:
   - Login to https://localhost:19443/publisher
   - Create and publish a new API (e.g., PizzaShack API)

2. **Verify on Other DCs**:
   - Login to DC2: https://localhost:20443/publisher
   - Login to DC3: https://localhost:21443/publisher
   - Login to DC4: https://localhost:22443/publisher
   - The API should appear on all CPs within seconds

### Test 2: Throttling Policy Sync

1. **Create throttling policy on DC1**:
   - Login to https://localhost:19443/admin
   - Create an advanced throttling policy

2. **Verify on Other DCs**:
   - Policy should sync to all TM nodes
   - Test API calls through different gateways to verify consistent throttling

## Project Structure

```
.
├── config-templates/        # Configuration templates
│   ├── cp/                 # Control Plane configs
│   │   ├── dc1/
│   │   ├── dc2/
│   │   ├── dc3/
│   │   └── dc4/
│   ├── gw/                 # Gateway configs
│   │   ├── dc1/
│   │   ├── dc2/
│   │   ├── dc3/
│   │   └── dc4/
│   └── tm/                 # Traffic Manager configs
│       ├── dc1/
│       ├── dc2/
│       ├── dc3/
│       └── dc4/
├── docker-compose.yml      # Service orchestration
├── Dockerfile              # Multi-stage image build
├── docker-entrypoint.sh    # Container startup script
├── build.sh                # Image build script
├── setup-configs.sh        # Config generation script
└── README.md               # This file
```

## Configuration Details

### Event Hub (Control Plane Sync)

Each CP broadcasts changes to all other CPs via:
- **Internal Event Hub**: Self-service URL
- **External JNDI**: Connections to other CP nodes

```toml
[apim.event_hub]
enable = true
service_url = "https://wso2apim-cp-dc1:9443/services/"
event_listening_endpoints = ["tcp://wso2apim-cp-dc1:5672"]
```

### Traffic Manager Clustering

All TM nodes form a cluster to sync throttling decisions:

```toml
[[apim.throttling.url_group]]
traffic_manager_urls = ["tcp://wso2apim-tm-dc1:9611"]
traffic_manager_auth_urls = ["ssl://wso2apim-tm-dc1:9711"]
```

### Gateway Configuration

Each Gateway:
- Connects to its corresponding CP for API artifacts
- Connects to all TMs for throttling decisions
- Subscribes to CP's Event Hub for real-time updates

## Troubleshooting

### Containers Won't Start

**Check logs**:
```bash
docker-compose logs wso2apim-cp-dc1
```

**Common issues**:
- Database not accessible: Verify MySQL is running on `localhost:3306`
- Port conflicts: Check if ports are already in use
- Image pull errors: Ensure you're logged into `docker.wso2.com`

### API Not Syncing Between CPs

**Check Event Hub connectivity**:
```bash
docker logs wso2apim-cp-dc1 | grep -i "event\|jms"
```

**Verify AMQP ports are accessible**:
```bash
docker exec wso2apim-cp-dc1 nc -zv wso2apim-cp-dc2 5672
```

### Throttling Not Consistent

**Check TM clustering**:
```bash
docker logs wso2apim-tm-dc1 | grep -i "throttl\|cluster"
```

**Verify binary ports are accessible**:
```bash
docker exec wso2apim-gw-dc1 nc -zv wso2apim-tm-dc1 9611
```

### Health Check Failures

**Check health status**:
```bash
docker inspect wso2apim-cp-dc1 | grep -A 10 Health
```

**Increase start period if needed** (in docker-compose.yml):
```yaml
healthcheck:
  start_period: 300s  # Increase from 180s
```

## Scaling and Modifications

### Adding Datacenter 5

1. Update `setup-configs.sh` to generate dc5 configs
2. Add dc5 services to `docker-compose.yml`
3. Update all CP configs to include dc5 in Event Hub
4. Update all TM configs to include dc5 in clustering
5. Rebuild images and restart

### Changing Database Connection

Edit all deployment.toml files:
```toml
[database.apim_db]
url = "jdbc:mysql://your-db-host:3306/wso2carbon"
username = "your-username"
password = "your-password"
```

Then recreate configs and restart containers.

### Enabling Analytics

Uncomment in Gateway deployment.toml:
```toml
[apim.analytics]
enable = true
config.type = "elk"
# Add analytics configuration
```

## Resource Management

Each container has resource limits:
- **Memory Limit**: 2GB
- **Memory Reservation**: 1GB
- **Log Size**: 100MB per file, 3 files max

Adjust in `docker-compose.yml` as needed.

## Useful Commands

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs for all services
docker-compose logs -f

# View logs for specific service
docker logs -f wso2apim-cp-dc1

# Restart a specific service
docker-compose restart wso2apim-cp-dc1

# Check service health
docker-compose ps

# Stop and remove everything (including volumes)
docker-compose down -v

# Rebuild images
./build.sh

# Regenerate configs
./setup-configs.sh

# Execute command in container
docker exec -it wso2apim-cp-dc1 bash
```

## Production Considerations

### Security
- Change default admin password
- Use proper SSL certificates (not default self-signed)
- Implement network policies and firewalls
- Use secrets management for passwords

### High Availability
- Deploy each DC in separate physical/cloud locations
- Use load balancers in front of Gateways
- Implement database replication/clustering
- Set up monitoring and alerting

### Performance
- Tune JVM heap sizes for your workload
- Adjust database connection pool sizes
- Configure caching appropriately
- Monitor and optimize based on metrics

## References

- [WSO2 APIM Multi-DC Deployment](https://apim.docs.wso2.com/en/latest/install-and-setup/setup/multi-dc-deployment/configuring-multi-dc-deployment-pattern-1/)
- [Profile Details WSO2 APIM Distributed Deployment](https://apim.docs.wso2.com/en/latest/install-and-setup/setup/distributed-deployment/deploying-wso2-api-m-in-a-distributed-setup/)
- [Securing WSO2 APIM Event Hub](https://apim.docs.wso2.com/en/latest/includes/deploy/enable-jms-ssl-for-eventhub/)
- [WSO2 Docker Images](https://docker.wso2.com)

## Support

For issues specific to this setup:
1. Check container logs
2. Verify database connectivity
3. Ensure all ports are accessible between containers
4. Review WSO2 documentation for configuration details

For WSO2 APIM product issues, refer to [WSO2 Documentation](https://apim.docs.wso2.com/).

## License

This setup uses WSO2 API Manager which requires a WSO2 subscription for production use.
