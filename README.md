# ONS Build Slaves


This repository holds the Dockerfiles for our Jenkins build environments.

## Building Jenkins slave
Let's start from the slave image, because it's most often customized. The build execution is performed on the agent, so it's the agent that needs to have the environment adjusted to the project we would like to build. For example, it may require the Python interpreter if our project is written in Python. The same is applied to any library, tool, testing framework, or anything that is needed by the project.


There are three steps to build and use the custom image:
1. Create a Dockerfile.
2. Build the image.
3. Change the agent configuration on master.

As an example, let's create a slave that serves the Python project. We can build it on top of the `onsdigital/jenkins-slave-base` image for the sake of simplicity. Let's do it using the following three steps:

1. **Dockerfile**: Let's create a new directory inside the Dockerfile with the following content:

        FROM onsdigital/jenkins-slave
        RUN yum update && \
            yum install -y python && \
            yum clean all

2. **Build the image**: We can build the image by executing the following command:

        $ docker build -t onsdigital/jenkins-slave-python .

3. **Configure the master**: The last step is to add `onsdigital/jenkins-slave-python` to the Jenkins master's configuration as a Docker template and label it accordingly.


## docker-compose.yml

**WARNING:** this file is only being used to simplify the build process. It's **not** being used to start or stop services. It's also clear to see from this file what the dependencies are between the images.

To build all images:

        $ docker-compose build

Build a single image:

        $ docker-compose build sbt_0-13-13

### Whats all this "tiers" nonesense?

In the `docker-compose.yml` I have put comments for Tier1/2/3. These are simply visual cues for how the images are constructed. Tier 2 is built on Tier 1, and Tier 3 is built on an image in Tier 2 etc...

## Build Tasks

* `make all` - will build all of the Dockerfiles (as long as they exist in docker-compose.yml)
* `make build-<servicename>` - is a dynamic task for building services defined in `docker-compose.yml` e.g. `make build-jenkins-slave-base`


