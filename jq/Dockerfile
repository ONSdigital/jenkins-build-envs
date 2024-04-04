ARG PARENT_VERSION
FROM onsdigital/jenkins-base:${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-jq"
LABEL uk.gov.ons.image.description="A Jenkins with JQ"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"


RUN yum install -y wget && \
    yum install -y gpg && \
    yum install -y jq
    