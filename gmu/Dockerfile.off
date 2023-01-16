# Jenkins Build Env :: GMU
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-gmu pip -V
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-gmu"
LABEL uk.gov.ons.image.description="A Jenkins slave with GMU"

RUN yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN pip install requests \
        lxml --upgrade \
        colorama
