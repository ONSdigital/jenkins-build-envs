# Jenkins Build Env :: Scala
# 
# Example:
#   $ docker run -it onsdigital/jenkins-slave-scala:2.11.8 scala -version
# 
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the 
# same dockerfile
ARG TOOL_VERSION
ARG BASE_URL=http://downloads.lightbend.com/scala/${TOOL_VERSION}

RUN curl -fsSL -o /tmp/scala-${TOOL_VERSION}.rpm ${BASE_URL}/scala-${TOOL_VERSION}.rpm \
  && yum install -y /tmp/scala-${TOOL_VERSION}.rpm \
  yum clean all