# Jenkins Build Env :: R
# 
# Example:
#   $ docker run -it onsdigital/jenkins-slave-r:3.5.0-1 R --version
# 
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk" \
      build-tool="r"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the 
# same dockerfile
ARG TOOL_VERSION


RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y R-${TOOL_VERSION} && \
	yum clean all