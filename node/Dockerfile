# Jenkins Build Env :: Node
# 
# Example:
#   $ docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
# 
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the 
# same dockerfile
ARG TOOL_VERSION
ARG SHA
ARG BASE_URL=http://nodejs.org/dist/${TOOL_VERSION}

RUN curl -fsSL -o /tmp/node.tar.gz ${BASE_URL}/node-${TOOL_VERSION}-linux-x64.tar.gz \
  && echo "${SHA}  /tmp/node.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/node.tar.gz -C /usr/local --strip-components=1