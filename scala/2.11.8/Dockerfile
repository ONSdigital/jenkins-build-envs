# Jenkins Build Env :: Scala 2.11.8
# 
# Test:
#   $ docker run -it onsdigital/scala_2-11-8 scala -version
# 
FROM onsdigital/jenkins-slave-base
LABEL maintainer="sion.williams@ext.ons.gov.uk"

RUN yum install -y wget && \
	yum clean all

RUN wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm

# Use multi-stage build so that we dont include wget in the final image
FROM onsdigital/jenkins-slave-base

COPY --from=0 scala-2.11.8.rpm .
RUN yum install -y scala-2.11.8.rpm && \
    rm scala-2.11.8.rpm && \
    yum clean all