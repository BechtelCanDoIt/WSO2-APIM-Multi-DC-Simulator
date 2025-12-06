ARG BASE_IMAGE=docker.wso2.com/wso2am:4.2.0.179-rocky
############
# builder
############
FROM ${BASE_IMAGE} AS builder
ARG PROFILE_NAME=control-plane
ENV PROFILE_NAME=${PROFILE_NAME}
ENV API_M_HOME=/home/wso2carbon/wso2am-4.2.0
# run profile optimization once
RUN sh ${API_M_HOME}/bin/profileSetup.sh -Dprofile=${PROFILE_NAME}
############
# final image
############
FROM ${BASE_IMAGE}
ENV API_M_HOME=/home/wso2carbon/wso2am-4.2.0
# copy optimized pack from builder
COPY --from=builder ${API_M_HOME} ${API_M_HOME}
# copy all config templates for every profile and dc
COPY config-templates /config-templates
# copy entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
