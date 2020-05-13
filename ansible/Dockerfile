# Jenkins Build Env :: Ansible
#
# Example:
#   $ docker run --rm ansible-image:local ansible --version
#
FROM onsdigital/jenkins-slave-base


LABEL uk.gov.ons.image.name="jenkins-slave-ansible"
LABEL uk.gov.ons.image.description="A Jenkins slave with ansible"
LABEL uk.gov.ons.image.version="$ANSIBLE_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA


ENV LD_RUN_PATH /usr/local/lib

# Install new packages

RUN yum install -y \
        build-base \
        python-dev \
        py-pip \
        jpeg-dev \
        zlib-dev \
        libffi-dev\
        openssl-dev \
        git \
        openssh-client sshpass \
        python3-pip \
    && yum clean all

# Upgrade pip
RUN pip3 install --upgrade pip

# Change LIBRARY_PATH environment variable because of error in building zlib
ENV LIBRARY_PATH=/lib:/usr/lib

# Set Workdir
WORKDIR /ansible

# Define volumes
VOLUME [ "/ansible" ]

# Install ansible
ARG ANSIBLE_VERSION=2.5

RUN pip install ansible==$ANSIBLE_VERSION
