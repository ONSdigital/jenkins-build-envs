# Jenkins Build Env :: Maven
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-maven:3.2.5 mvn --version
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-maven"
LABEL uk.gov.ons.image.description="A Jenkins slave with Maven"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA

ARG USER_HOME_DIR="/home/jenkins"
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${TOOL_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${TOOL_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
  && yum install -y make

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV JAVA_HOME "/usr"
ENV PATH "${JAVA_HOME}/bin:${PATH}"

COPY /files/settings-docker.xml /usr/share/maven/ref/
