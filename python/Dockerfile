# Jenkins Build Env :: Python
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-python:2.7.15 /usr/local/bin/python2.7 -V
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-base:${PARENT_VERSION}

ARG TOOL_VERSION
ARG SQLLITE

LABEL uk.gov.ons.image.name="jenkins-python"
LABEL uk.gov.ons.image.description="A Jenkins with Python"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA256
ARG SHA512
ARG BASE_URL=https://www.python.org/ftp/python/${TOOL_VERSION}/
ARG ODBCBASE=https://mirror.stream.centos.org/9-stream/CRB/x86_64/os/Packages/
ARG TMP_BINARY_DESTINATION="/tmp/python.tar.gz"

ENV LD_RUN_PATH=/usr/local/lib

RUN yum install -y \
        zip \
        gcc \
        openssl-devel \
        bzip2-devel \
        make \
        gcc-c++ \
        libffi-devel \
        unixODBC \
        zlib-devel \
        krb5-devel

RUN if [[ -n "SQLLITE" ]] ; then yum install -y sqlite-devel ;fi

RUN if [[ -n "SQLLITE" ]] ; then yum install -y sqlite-devel ;fi

RUN ver=`yum list --installed unixODBC | tail -1 | awk -e '{ print $2 }'` \
    && curl -o /tmp/unixODBC-devel.rpm ${ODBCBASE}unixODBC-devel-$ver.x86_64.rpm \
    && yum install -y /tmp/unixODBC-devel.rpm \
    && rm -f /tmp/unixODBC-devel.rpm \
    && yum clean all

RUN mkdir -p /usr/src/python \
    && curl -fsSL -o ${TMP_BINARY_DESTINATION} ${BASE_URL}/Python-${TOOL_VERSION}.tgz \
    && if [[ -n "${SHA256}" ]] ; then printf "\n\n \x1b[48;5;1m Checking SHA256 sum \e[0m \n"; echo "${SHA256} ${TMP_BINARY_DESTINATION}" | sha256sum -c - ; fi \
    && if [[ -n "${SHA512}" ]] ; then printf "\n\n \x1b[48;5;1m Checking SHA512 sum \e[0m \n"; echo "${SHA512} ${TMP_BINARY_DESTINATION}" | sha512sum -c - ; fi \
    && tar -xzf ${TMP_BINARY_DESTINATION} -C /usr/src/python --strip-components=1 \
    && rm -f ${TMP_BINARY_DESTINATION} \
    && cd /usr/src/python \
    && ./configure --with-ensurepip=install --enable-shared \
    && make

RUN cd /usr/src/python \
    && make install \
    && printf "\n\n********* Listing python binaries in PATH " \
    && echo $PATH | tr ":" "\n" | xargs -I % sh -c "printf \"\n\n Searchin in %\"; find % -name \"python*\""
