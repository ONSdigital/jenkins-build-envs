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

ENV JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64"
ENV PATH "${JAVA_HOME}/bin:${PATH}"

RUN curl -fsSL -o /tmp/sbt-${TOOL_VERSION}.rpm ${BASE_URL}/sbt-${TOOL_VERSION}.rpm && \
  yum install -y /tmp/sbt-${TOOL_VERSION}.rpm && \
  yum clean all

# The location of global sbtopts is dependent on the version of SBT (rpm) being installed
# As of 2018/07/24, there are 29 versions of the SBT rpm available on bintray
# 10 versions use /usr/share/sbt-launcher-packaging/conf    (which is symlinked to /etc/sbt-launcher-packaging)
# 19 versions use /usr/share/sbt/conf                       (which is symlinked to /etc/sbt)
# So check for the existence of sbtopts in two locations before appending to it.
# If none of the two locations exists, exit with non-zero exit code so that the build fails.
RUN if [ -f /etc/sbt-launcher-packaging/sbtopts ]; then echo "-Dsbt.override.build.repos=true" >> /etc/sbt-launcher-packaging/sbtopts; \
  elif [ -f /etc/sbt/sbtopts ]; then echo "-Dsbt.override.build.repos=true" >> /etc/sbt/sbtopts; \
  else exit 1; fi
