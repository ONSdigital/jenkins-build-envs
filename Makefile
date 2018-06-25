.PHONY: %.check build

all: docker-compose.check
	docker-compose build --force-rm

# build-% is a dynamic task for building docker compose service in a clean way
# e.g.  build-maven_3.2.5
build-%: docker-compose.check
	docker-compose build --force-rm --no-cache $*

clean:  docker.check
	docker system prune --all --force

# TODO: this isn't great. Look to improve this...
verify:
	@docker run -it onsdigital/jenkins-slave-maven:3.2.5 mvn --version
	@docker run -it onsdigital/jenkins-slave-maven:3.5.4 mvn --version
	@docker run -it onsdigital/jenkins-slave-node:v6.11.5 node --version
	@docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
	@docker run -it onsdigital/jenkins-slave-scala:2.11.8 scala -version
	@docker run -it onsdigital/jenkins-slave-sbt:0.13.13 sbt -version

test: clean all verify

# .check targets just tests for a command to be available on your PATH.
%.check:
	@which $*
