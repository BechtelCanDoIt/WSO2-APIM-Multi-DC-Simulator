#!/bin/bash
set -e

echo "============================================"
echo "Building WSO2 APIM 4.2 Docker Images"
echo "============================================"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "ERROR: Docker is not running"
    exit 1
fi

# Login to WSO2 Docker registry
echo "Logging into WSO2 Docker registry..."
echo "Please enter your WSO2 credentials:"
docker login docker.wso2.com || {
    echo "ERROR: Failed to login to docker.wso2.com"
    echo "Make sure you have a valid WSO2 subscription"
    exit 1
}

echo ""
echo "Building Control Plane image..."
docker build \
    --build-arg PROFILE_NAME=control-plane \
    -t apim-cp:4.2.0 \
    --progress=plain \
    .

echo ""
echo "Building Traffic Manager image..."
docker build \
    --build-arg PROFILE_NAME=traffic-manager \
    -t apim-tm:4.2.0 \
    --progress=plain \
    .

echo ""
echo "Building Gateway image..."
docker build \
    --build-arg PROFILE_NAME=gateway-worker \
    -t apim-gw:4.2.0 \
    --progress=plain \
    .

echo ""
echo "============================================"
echo "Build Complete!"
echo "============================================"
echo ""
echo "Images created:"
docker images | grep "apim-" | grep "4.2.0"
echo ""
echo "Next step: docker-compose up -d"
echo ""
