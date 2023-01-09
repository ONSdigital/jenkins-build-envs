# Jenkins Build Env :: GMU
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-gmu pip -V
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-python:${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-gmu"
LABEL uk.gov.ons.image.description="A Jenkins with GMU"

RUN yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN python3.9 -m pip install requests \
        lxml --upgrade \
        colorama

COPY ./gmu-output/gmudownload /opt/gmu 

ENV JAVA_HOME=/etc/alternatives/jre

COPY ./gmu-output/certs /etc/pki/ca-trust/source/anchors/

RUN update-ca-trust extract
