# Jenkins Build Env :: Node 6.11.5
# 
# Test:
#   $ docker run -it onsdigital/jenkins-slave-node:6.11.5 node --version
# 
FROM onsdigital/jenkins-slave-base as downloader

RUN yum install -y wget && \
	yum clean all

RUN wget http://nodejs.org/dist/v6.11.5/node-v6.11.5-linux-x64.tar.gz

# Use multi-stage build so that we dont include wget in the final image
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk"

COPY --from=downloader node-v6.11.5-linux-x64.tar.gz .
RUN tar --strip-components 1 -xzvf node-v* -C /usr/local