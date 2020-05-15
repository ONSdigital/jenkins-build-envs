# Jenkins Build Env :: Node
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-node"
LABEL uk.gov.ons.image.description="A Jenkins slave with NodeJS"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA
ARG BASE_URL=http://nodejs.org/download/release/${TOOL_VERSION}

RUN curl -fsSL -o /tmp/node.tar.gz ${BASE_URL}/node-${TOOL_VERSION}-linux-x64.tar.gz \
  && echo "${SHA}  /tmp/node.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/node.tar.gz -C /usr/local --strip-components=1
