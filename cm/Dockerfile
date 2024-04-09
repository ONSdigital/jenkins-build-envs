# Jenkins Build Env :: Node
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-node:${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-cypress"
LABEL uk.gov.ons.image.description="A Jenkins with NodeJS, google-chrome and gcc"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

WORKDIR /root

COPY files/centos-stream.repo /etc/yum.repos.d/centos-stream.repo

RUN  yum install -y xorg-x11-server-Xvfb wget \
    && curl -o google-chrome-stable_current_x86_64.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    && yum install google-chrome-stable_current_x86_64.rpm -y \
    && yum install libXScrnSaver -y \
    && npm set progress=false && npm install cypress@${TOOL_VERSION} --save-dev

ENV PATH "/node_modules/.bin:${PATH}"
