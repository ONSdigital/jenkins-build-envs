# Jenkins Build Env :: Scala
#
# Example:
#   $ docker run -it onsdigital/jenkins-scala:2.11.8 scala -version
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-base:${PARENT_VERSION}
ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-scala"
LABEL uk.gov.ons.image.description="A Jenkins with Scala lang"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG BASE_URL=http://downloads.lightbend.com/scala/${TOOL_VERSION}

RUN curl -fsSL -o /tmp/scala-${TOOL_VERSION}.rpm ${BASE_URL}/scala-${TOOL_VERSION}.rpm \
  && yum install -y /tmp/scala-${TOOL_VERSION}.rpm \
  && yum clean all
