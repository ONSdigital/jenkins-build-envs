# Jenkins Build Env :: Gradle
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-gradle:4.9 gradle --version
#
ARG PARENT_VERSION
FROM onsdigital/jenkins-base:${PARENT_VERSION}

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-gradle"
LABEL uk.gov.ons.image.description="A Jenkins with Gradle"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

ARG BASE_URL=https://services.gradle.org/distributions

RUN yum install -y unzip && \
	yum clean all

RUN mkdir -p /opt/gradle \
  && curl -fsSL -o /tmp/gradle-${TOOL_VERSION} ${BASE_URL}/gradle-${TOOL_VERSION}-bin.zip \
  && unzip -d /opt/gradle /tmp/gradle-${TOOL_VERSION}

RUN yum remove -y unzip

ENV JAVA_HOME "/usr"
ENV PATH "${JAVA_HOME}:${PATH}:/opt/gradle/gradle-${TOOL_VERSION}/bin"
