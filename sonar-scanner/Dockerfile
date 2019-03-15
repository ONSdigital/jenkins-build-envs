# Jenkins Build Env :: SonarQube
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-sonar-scanner:3.2.0 sonar-scanner -Dsonar.projectBaseDir=./src
#
FROM onsdigital/jenkins-slave-base

ARG TOOL_VERSION

LABEL uk.gov.ons.image.name="jenkins-slave-sonar-scanner"
LABEL uk.gov.ons.image.description="A Jenkins slave with SonarScanner CLI"
LABEL uk.gov.ons.image.version="${TOOL_VERSION}"

# build-args are overridden in the docker-compose.yml
# to allow for multiple builds of new versions from the
# same dockerfile
ARG SHA

ARG USER_HOME_DIR="/home/jenkins"
ARG BASE_URL=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/

RUN yum install -y \
        zip \
        unzip \
        bsdtar \
        gcc \
        openssl-devel \
        bzip2-devel \
        tmux \
        htop \
        maven \
        make \
    && yum clean all

WORKDIR /tmp

RUN mkdir -p /usr/share/sonar-scanner \
  && curl -fsSL -o /tmp/sonar-scanner-cli.zip ${BASE_URL}/sonar-scanner-cli-${TOOL_VERSION}-linux.zip \
  && bsdtar --strip-components=1 -xvf /tmp/sonar-scanner-cli.zip -C /usr/share/sonar-scanner \
  && rm -f /tmp/sonar-scanner-cli.zip \
  && ln -s /usr/share/sonar-scanner/bin/sonar-scanner /usr/bin/sonar-scanner

ENV SONAR_RUNNER_HOME /usr/share/sonar-scanner
ENV PATH "${SONAR_RUNNER_HOME}/bin:${PATH}"

