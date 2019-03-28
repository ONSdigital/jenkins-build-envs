# Jenkins Build Env :: Python
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-python:2.7.15 /usr/local/bin/python2.7 -V
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-python"
LABEL uk.gov.ons.image.description="A Jenkins slave with Python"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA
ARG BASE_URL=https://www.python.org/ftp/python/${TOOL_VERSION}/


ENV LD_RUN_PATH /usr/local/lib

RUN yum install -y \
        zip \
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
    && ./configure --with-ensurepip=install --enable-shared \
    && make \
    && make install \
    && python -V

