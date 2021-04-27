# Jenkins Build Env :: R
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-r:3.5.0 /opt/R/${TOOL_VERSION}/bin/R --version
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-r"
LABEL uk.gov.ons.image.description="A Jenkins slave with R lang"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

ARG BINARY_NAME="R-${TOOL_VERSION}-1-1.x86_64.rpm"

RUN yum install -y epel-release && \
    yum update -y && \
    curl -O "https://cdn.rstudio.com/r/centos-7/pkgs/${BINARY_NAME}" && \
    yum install "${BINARY_NAME}" -y && \
    yum clean all && \
    /opt/R/${TOOL_VERSION}/bin/R --version

ENV PATH "/opt/R/${TOOL_VERSION}/bin:${PATH}"

ENTRYPOINT ["/bin/sh", "-c"]
