# Jenkins Build Env :: R
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-r:3.5.0-1 R --version
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-r"
LABEL uk.gov.ons.image.description="A Jenkins slave with R lang"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"


RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y R-${TOOL_VERSION} && \
	yum clean all
