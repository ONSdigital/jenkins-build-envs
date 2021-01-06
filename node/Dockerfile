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
ARG SHA256
ARG SHA512
ARG BASE_URL=http://nodejs.org/download/release/${TOOL_VERSION}
ARG TMP_BINARY_DESTINATION="/tmp/node.tar.gz"

RUN curl -fsSL -o ${TMP_BINARY_DESTINATION} ${BASE_URL}/node-${TOOL_VERSION}-linux-x64.tar.gz \
  && if [[ -n "${SHA256}" ]] ; then printf "\n\n \x1b[48;5;1m Checking SHA256 sum \e[0m \n"; echo "${SHA256} ${TMP_BINARY_DESTINATION}" | sha256sum -c - ; fi \
  && if [[ -n "${SHA512}" ]] ; then printf "\n\n \x1b[48;5;1m Checking SHA512 sum \e[0m \n"; echo "${SHA512} ${TMP_BINARY_DESTINATION}" | sha512sum -c - ; fi \
  && tar -xzf ${TMP_BINARY_DESTINATION} -C /usr/local --strip-components=1
