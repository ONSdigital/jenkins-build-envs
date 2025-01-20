# Jenkins Build Env :: r
#
# Example:
#   $ docker run -it onsdigital/jenkins-r:4.4.1 /opt/R/4.4.1/bin/R --version
#
ARG PARENT_VERSION=2.0.0
FROM onsdigital/jenkins-base:${PARENT_VERSION}


LABEL uk.gov.ons.image.name="r"
LABEL uk.gov.ons.image.description="A Jenkins with r"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile

####################### START r INSTALATION ################################
FROM quay.io/centos/centos:stream9
ARG TOOL_VERSION
RUN curl -O https://cdn.rstudio.com/r/rhel-9/pkgs/R-${TOOL_VERSION}-1-1.x86_64.rpm
RUN dnf --enablerepo=crb install flexiblas-devel -y 
RUN dnf -y install R-${TOOL_VERSION}-1-1.x86_64.rpm
####################### END r INSTALATION ##################################
