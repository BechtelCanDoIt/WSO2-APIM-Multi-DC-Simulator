#!/bin/bash
set -e

API_M_HOME=${API_M_HOME:-/home/wso2carbon/wso2am-4.2.0}

PROFILE=${APIM_PROFILE:-cp}
DC=${APIM_DC:-1}

TEMPLATE_ROOT="/config-templates/${PROFILE}/dc${DC}"

echo "Using profile ${PROFILE} datacenter ${DC}"
echo "Template root ${TEMPLATE_ROOT}"

if [ ! -d "${TEMPLATE_ROOT}" ]; then
  echo "ERROR: Template folder not found ${TEMPLATE_ROOT}"
  echo "Available templates:"
  ls -la /config-templates/ || true
  ls -la /config-templates/${PROFILE}/ || true
  exit 1
fi

# 1. Copy deployment.toml if present
if [ -f "${TEMPLATE_ROOT}/repository/conf/deployment.toml" ]; then
  echo "Copying deployment.toml"
  cp -f "${TEMPLATE_ROOT}/repository/conf/deployment.toml" \
        "${API_M_HOME}/repository/conf/deployment.toml"
else
  echo "WARNING: No deployment.toml found at ${TEMPLATE_ROOT}/repository/conf/deployment.toml"
fi

# 2. Copy any jndi files
if [ -d "${TEMPLATE_ROOT}/repository/conf/jndi" ]; then
  echo "Copying jndi configs"
  cp -rf "${TEMPLATE_ROOT}/repository/conf/jndi"/* \
        "${API_M_HOME}/repository/conf/" 2>/dev/null || true
fi

# 3. Copy any event publishers
if [ -d "${TEMPLATE_ROOT}/repository/deployment/server/eventpublishers" ]; then
  echo "Copying event publishers"
  cp -f "${TEMPLATE_ROOT}/repository/deployment/server/eventpublishers/"* \
        "${API_M_HOME}/repository/deployment/server/eventpublishers/" 2>/dev/null || true
fi

echo "Configuration applied successfully"
echo "Starting API Manager runtime..."
exec /bin/sh "${API_M_HOME}/bin/api-manager.sh"
