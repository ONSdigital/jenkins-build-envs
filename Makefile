.PHONY: %.check build sbt

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
	docker run -it onsdigital/jenkins-slave-gradle:4.9 gradle --version
	docker run -it onsdigital/jenkins-slave-cf-cli:latest cf --version
	docker run -it onsdigital/jenkins-slave-maven:3.2.5 mvn --version
	docker run -it onsdigital/jenkins-slave-maven:3.5.4 mvn --version
	docker run -it onsdigital/jenkins-slave-maven:3.6.0 mvn --version
	docker run -it onsdigital/jenkins-slave-node:v6.11.5 node --version
	docker run -it onsdigital/jenkins-slave-node:v9.9.0 node --version
	docker run -it onsdigital/jenkins-slave-scala:2.11.8 scala -version
	docker run -it onsdigital/jenkins-slave-scala:2.12.6 scala -version
	docker run -it onsdigital/jenkins-slave-scala:2.12.7 scala -version
	docker run -it onsdigital/jenkins-slave-sbt:0.13.13 sbt sbtVersion
	docker run -it onsdigital/jenkins-slave-sbt:1.1.6 sbt sbtVersion
	docker run -it onsdigital/jenkins-slave-sbt:1.2.4 sbt sbtVersion
	docker run -it onsdigital/jenkins-slave-python:2.7.15 /usr/local/bin/python2.7 -V
	docker run -it onsdigital/jenkins-slave-python:3.3.0 /usr/local/bin/python3.3 -V
	docker run -it onsdigital/jenkins-slave-python:3.6.0 /usr/local/bin/python3.6 -V
	docker run -it onsdigital/jenkins-slave-python:3.6.1 /usr/local/bin/python3.6 -V
	docker run -it onsdigital/jenkins-slave-python:3.6.3 /usr/local/bin/python3.6 -V
	docker run -it onsdigital/jenkins-slave-jq:1.6 jq --version

sbt:
	docker run -it -v ${HOME}/.sbt:/root/.sbt -v ${HOME}/.ivy2/cache:/root/.ivy2/cache onsdigital/jenkins-slave-sbt:0.13.13 sbt sbtVersion

test: clean all verify

# .check targets just tests for a command to be available on your PATH.
%.check:
	@which $*
