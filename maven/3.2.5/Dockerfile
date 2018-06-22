# Jenkins Build Env :: Maven 3.2.5
# 
# Test:
#   $ docker run -it onsdigital/jenkins-slave-maven:3.2.5 mvn --version
# 
FROM onsdigital/jenkins-slave-base

ARG MAVEN_VERSION=3.2.5
ARG USER_HOME_DIR="/root"
ARG SHA=8c190264bdf591ff9f1268dc0ad940a2726f9e958e367716a09b8aaa7e74a755
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre"
ENV PATH "${JAVA_HOME}/bin:${PATH}"

COPY /files/settings-docker.xml /usr/share/maven/ref/