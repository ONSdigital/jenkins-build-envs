# Jenkins Build Env :: Node
#
# Example:
#   $ docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
#
FROM onsdigital/jenkins-slave-node:v12.16.2

LABEL uk.gov.ons.image.name="jenkins-slave-cypress"
LABEL uk.gov.ons.image.description="A Jenkins slave with NodeJS, google-chrome and gcc"

RUN  yum install -y xorg-x11-server-Xvfb gcc-c++ wget \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    && sudo yum install google-chrome-stable_current_x86_64.rpm -y
