# Jenkins Build Env :: Python
# 
# Example:
#   $ docker run -it onsdigital/jenkins-slave-python:2.7.15 /usr/local/bin/python2.7 -V
# 
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk" \
      build-tool="python"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the 
# same dockerfile
ARG TOOL_VERSION
ARG SHA
ARG BASE_URL=https://www.python.org/ftp/python/${TOOL_VERSION}/

RUN yum install -y \
        gcc \
        openssl-devel \
        bzip2-devel \
        make \
    && yum clean all

RUN mkdir -p /usr/src/python \
    && curl -fsSL -o /tmp/python.tgz ${BASE_URL}/Python-${TOOL_VERSION}.tgz \
    && tar -xzf /tmp/python.tgz -C /usr/src/python --strip-components=1 \
    && rm -f /tmp/python.tgz \
    && cd /usr/src/python \
    && ./configure --enable-optimizations \
    && make altinstall
