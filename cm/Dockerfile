# Jenkins Build Env :: Node
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-slave-node:v${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-cypress"
LABEL uk.gov.ons.image.description="A Jenkins slave with NodeJS, google-chrome and gcc"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

ARG BINARY_NAME="google-chrome-stable_current_x86_64.rpm"
ARG BASE_DOWNLOAD_URL="https://dl.google.com/linux/direct"

WORKDIR /root

RUN  yum install -y xorg-x11-server-Xvfb wget \
    && wget "${BASE_DOWNLOAD_URL}/${BINARY_NAME}" \
    && yum install "${BINARY_NAME}" -y \
    && yum install libXScrnSaver -y \
    && rm -rf  "${BINARY_NAME}" \
    && rm -rf /var/cache/yum \
    && npm install cypress@${TOOL_VERSION} --save-dev

ENV PATH "/node_modules/.bin:${PATH}"
