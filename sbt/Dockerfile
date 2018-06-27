# Jenkins Build Env :: Sbt
# 
# Example:
#   $ docker run -it onsdigital/jenkins-slave-sbt:0.13.13 sbt -version
# 
FROM onsdigital/jenkins-slave-scala:2.11.8
LABEL maintainer="sion.williams@ext.ons.gov.uk" \
      build-tool="sbt"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the 
# same dockerfile
ARG TOOL_VERSION
ARG BASE_URL=https://sbt.bintray.com/rpm/

RUN curl -fsSL -o /tmp/sbt-${TOOL_VERSION}.rpm ${BASE_URL}/sbt-${TOOL_VERSION}.rpm \
  && yum install -y /tmp/sbt-${TOOL_VERSION}.rpm \
  yum clean all