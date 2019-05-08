DOCKER=docker run -it
DOCKER_FLAGS=-v $${HOME}/.sbt:/root/.sbt -v $${HOME}/.ivy2/cache:/root/.ivy2/cache
TARGETS=MAVEN SBT SCALA NODE PYTHON
# -----------------------------------------------------------------------------------------------------
# Mark following targets as PHONY to always execute them
.PHONY: all $(TARGETS)

# -----------------------------------------------------------------------------------------------------
all: docker-compose.check
	docker-compose build --force-rm

test: clean all verify

build-%: docker-compose.check
	docker-compose build --force-rm --no-cache $*

clean:  docker.check
	docker system prune --all --force

verify: $(TARGETS)
	$(DOCKER) $(DOCKER_FLAGS) onsdigital/jenkins-slave-jq:1.6 		jq 	 --version
	$(DOCKER) $(DOCKER_FLAGS) onsdigital/jenkins-slave-gradle:4.9 		gradle 	 --version
	$(DOCKER) $(DOCKER_FLAGS) onsdigital/jenkins-slave-cf-cli:latest 	cf 	 --version

# .check targets just tests for a command to be available on your PATH.
%.check:
	@which $*

# -----------------------------------------------------------------------------------------------------
MAVEN_VERIFY_COMMAND:=mvn --version
MAVEN_VERSION_LIST=3.2.5 3.5.4 3.6.0
MAVEN_DOCKER_IMAGE=onsdigital/jenkins-slave-maven
MAVEN:
	$(call run_docker_meta,$@)
# -----------------------------------------------------------------------------------------------------
SBT_VERIFY_COMMAND=sbt sbtVersion
SBT_VERSION_LIST=0.13.13 1.1.6 1.2.4
SBT_DOCKER_IMAGE=onsdigital/jenkins-slave-sbt
SBT:
	$(call run_docker_meta,$@)
# -----------------------------------------------------------------------------------------------------
NODE_VERIFY_COMMAND=node --version
NODE_VERSION_LIST=v6.11.5 v9.9.0
NODE_DOCKER_IMAGE=onsdigital/jenkins-slave-node
NODE:
	$(call run_docker_meta,$@)
# -----------------------------------------------------------------------------------------------------
SCALA_VERIFY_COMMAND=scala -version
SCALA_VERSION_LIST=2.11.8 2.12.6 2.12.7 2.11.8
SCALA_DOCKER_IMAGE=onsdigital/jenkins-slave-scala
SCALA:
	$(call run_docker_meta,$@)
# -----------------------------------------------------------------------------------------------------
PYTHON_VERIFY_COMMAND_OTHER=python_version -V
PYTHON_VERIFY_COMMAND=python3.6 -V
PYTHON_VERSION_LIST=3.6.0 3.6.1 3.6.3
PYTHON_DOCKER_IMAGE=onsdigital/jenkins-slave-python
PYTHON:
	$(DOCKER) $(DOCKER_FLAGS) onsdigital/jenkins-slave-python:2.7.15  ${PYTHON_VERIFY_COMMAND_OTHER:_version=2.7}
	$(DOCKER) $(DOCKER_FLAGS) onsdigital/jenkins-slave-python:3.3.0   ${PYTHON_VERIFY_COMMAND_OTHER:_version=3.3}
	$(call run_docker_meta,$@)
# -----------------------------------------------------------------------------------------------------

# Functions invoked by the individual targets. The following functions do all the work of actually provisioning
# the docker containers and running the version check commands

# This funciton accepts three parameters
# $1 : X_VERSION_LIST, a space delimeted list of docker image versions
# $2 : X_DOCKER_IMAGE, dockerimage name, example: onsdigital/jenkins-slave-scala
# $3 : X_VERIFY_COMMAND, the command executed within a container provisioned using a container $2:$1
# This function iterates through the versions in $1, and for each runs a container and executes the command specified
# by $3
define run_docker
    { \
    	for version in $(1); do \
    		printf "\n\n************************* Checking image $(2):$${version} with command $(3) \n"; \
    		$(DOCKER) $(DOCKER_FLAGS) $(2):$${version} 	$(3) ; \
    	done; \
    }
endef

# The following function uses variable indirection to invoke run_docker function
# run_docker always requires three parameters and since only the PREFIX of these parameters is different,
# it is possible to create this function which sets those three variables based on the name of the target being invoked
# For example: when the MAVEN target is invoked, $@ is set to 'MAVEN', and the sole line in MAVEN recipe is:
# $(call run_docker_meta,$@)
# which becomes
# $(call run_docker_meta,MAVEN)
#
# This function then sets three variables:
# VERSION_LIST=MAVEN_VERSION_LIST etc and then
# invokes run_docker passing in these three variables after resolving them using the $($(x)) syntax for variable indirection
VERSION_LIST=${1}_VERSION_LIST
DOCKER_IMAGE=${1}_DOCKER_IMAGE
VERIFY_COMMAND=${1}_VERIFY_COMMAND
define run_docker_meta
    $(call run_docker,$($(VERSION_LIST)),$($(DOCKER_IMAGE)),$($(VERIFY_COMMAND)))
endef
# -----------------------------------------------------------------------------------------------------
