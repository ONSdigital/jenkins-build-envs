# ONS Build


This repository holds the Dockerfiles for our Jenkins build environments.

## CICD Pipeline 

[Concourse pipeline](https://concourse.cicd-shared.aws.onsdigital.uk/teams/cia/pipelines/jenkins-docker-build) is setup to run at 05:00 every wednesday. 

Each jenkins build is added to a repository in onsdigital dockerhub account. 

Errors are reported to jenkins-builds slack channel in ons-operations slack.

There are two base images RHEL & CENTOS- all the other images are layered on top of either of these.

### Adding a new repository to the pipeline

Create a new resource in the pipeline.yml file. Replace "reponame" with the name of your repository this is the object we are pushing too in dockerhub

```
- name: jenkins-reponame-docker
  type: registry-image
  icon: docker
  source:
    <<: *docker_auth
    repository: ((docker_organisation))/jenkins-reponame
```

Create a new job within the pipeline.yml file. 

Replace:

- software - with the name of the software you are building
- version_number - with the version of software you are building
- folder_where_dockerfile_is_located
- jenkins-reponame-docker - with the name of the resource you created above

```
- name: jenkins-software-version_number
  plan:
  - get: jenkins-git
    passed: [jenkins-base]
  - task: build-image
    privileged: true # oci-build-task must run in a privileged container
    file: jenkins-git/ci/packer_build.yml
    input_mapping:
      repo-name: jenkins-git
    params:
      CONTEXT: repo-name/folder_where_dockerfile_is_located
      BUILD_ARG_PARENT_VERSION: ((jenkins_base_version))
      BUILD_ARG_TOOL_VERSION: version_number
    on_failure:
      put: slack-alert
      params:
        <<: *slack_alert_message
  - put: jenkins-reponame-docker
    params:
      image: image/image.tar
      version: version_number
    on_failure:
      put: slack-alert
      params:
        <<: *slack_alert_message
```


## Build Tasks

* `make all` - will build all of the Dockerfiles (as long as they exist in docker-compose.yml)
* `make build-<servicename>` - is a dynamic task for building services defined in `docker-compose.yml` e.g. `make build-jenkins-slave-base`
* `make clean` - cleans all unused Docker resources
* `make verify` - runs a test for each docker image
* `make test` - composite of clean, all and verify


## Building a Jenkins slave
The build execution is performed on the agent, so it's the agent that needs to have the environment adjusted to the project we would like to build. For example, it may require the Python interpreter if our project is written in Python. The same is applied to any library, tool, testing framework, or anything that is needed by the project.


There are three steps to build and use the custom image:
1. Create a Dockerfile.
2. Build the image.
3. Change the agent configuration on master.

As an example, let's create a slave that serves the Python project. We build it on top of the `onsdigital/jenkins-slave-base` image so we know it will be fit for using as a Jenkins agent. Let's do it using the following three steps:

1. **Dockerfile**: Let's create a new directory inside the Dockerfile with the following content:

        FROM onsdigital/jenkins-slave
        RUN yum update && \
            yum install -y python && \
            yum clean all

2. **Build the image**: We can build the image by executing the following command:

        $ docker build -t onsdigital/jenkins-slave-python .

3. **Configure the master**: The last step is to add `onsdigital/jenkins-slave-python` to the Jenkins master's configuration as a Docker template and label it accordingly.


## docker-compose.yml

**WARNING:** this file is used to simplify the Docker build process. It's **not** being used to start or stop services. It also provides a clear syntax for dependencies between the images.

### Whats all this "tiers" nonesense?

In the `docker-compose.yml` I have put headers for Tier1/2/3. These are simply visual cues for how the images are constructed. Tier 2 is built on Tier 1, and Tier 3 is built on an image in Tier 2 etc...
