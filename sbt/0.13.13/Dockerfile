# Jenkins Build Env :: Sbt 0.13.13
# 
# Test:
#   $ docker run -it onsdigital/jenkins-slave-sbt:0.13.13 sbt -version
# 
FROM onsdigital/jenkins-slave-scala:2.11.8 as downloader

RUN yum install -y wget && \
	yum clean all

RUN wget https://sbt.bintray.com/rpm/sbt-0.13.13.rpm

# Use multi-stage build so that we dont include wget in the final image
FROM onsdigital/jenkins-slave-scala:2.11.8
LABEL maintainer="sion.williams@ext.ons.gov.uk"

COPY --from=downloader sbt-0.13.13.rpm .
RUN yum install -y sbt-0.13.13.rpm && \
    rm sbt-0.13.13.rpm && \
    yum clean all