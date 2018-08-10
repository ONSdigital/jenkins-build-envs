# Jenkins Build Env :: CF CLI
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-cf-cli:latest cf --version
#
FROM onsdigital/jenkins-slave-base

LABEL uk.gov.ons.image.name="jenkins-slave-cf-cli"
LABEL uk.gov.ons.image.description="A Jenkins slave with CF CLI"

# need to use wget here because the curl equivalent didnt work
RUN yum install -y wget && \
    wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo && \
    yum install cf-cli -y
