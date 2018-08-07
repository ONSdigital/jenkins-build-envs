# Jenkins Build Env :: Sbt
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-sbt:0.13.13 sbt -version
#
FROM onsdigital/jenkins-slave-scala:2.11.8

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-sbt"
LABEL uk.gov.ons.image.description="A Jenkins slave with Scala Build Tool"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"


ENV JENKINS_HOME /home/jenkins

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG MAJOR_MINOR_VERSION
ARG BASE_URL=https://sbt.bintray.com/rpm/

RUN curl -fsSL -o /tmp/sbt-${TOOL_VERSION}.rpm ${BASE_URL}/sbt-${TOOL_VERSION}.rpm && \
  yum install -y /tmp/sbt-${TOOL_VERSION}.rpm && \
  yum clean all

# Running sbt version here allows us to cache the results of an sbt boot
# making future executions faster
RUN runuser -l jenkins -c 'sbt clean'
