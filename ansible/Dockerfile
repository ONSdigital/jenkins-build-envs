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

# Set Workdir
WORKDIR /ansible

# Define volumes
VOLUME [ "/ansible" ]

# Install ansible
ARG ANSIBLE_VERSION=2.5

RUN yum install -y epel-release \
    && yum install -y python-pip \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN pip install ansible==$ANSIBLE_VERSION
