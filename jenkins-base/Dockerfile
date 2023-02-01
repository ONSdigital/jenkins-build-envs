FROM centos:7

LABEL uk.gov.ons.image.name="jenkins-base"
LABEL uk.gov.ons.image.description="A Jenkins using JNLP to establish connection based on Centos"

# Install Essentials
RUN yum update -y && \
    yum clean all

# Install Packages
RUN yum install -y git && \
	yum install -y java-1.8.0-openjdk-devel.x86_64 && \
	yum install -y java-11-openjdk && \
	yum install -y sudo && \
	yum clean all

ARG user=jenkins
ARG group=jenkins
ARG uid=525
ARG gid=525

ENV JENKINS_HOME /home/${user}

# Jenkins is run with user `jenkins`, uid = 525
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN chown -R ${user}:${user} /home/${user}

# Add the jenkins user to sudoers
RUN echo "${user}    ALL=(ALL)    ALL" >> etc/sudoers

# Set Name Servers
COPY /files/resolv.conf /etc/resolv.conf
