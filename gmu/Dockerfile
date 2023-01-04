# Jenkins Build Env :: GMU
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-gmu pip -V
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-base:${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-gmu"
LABEL uk.gov.ons.image.description="A Jenkins with GMU"

RUN sudo dnf install python3

RUN yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN pip install requests \
        lxml --upgrade \
        colorama
