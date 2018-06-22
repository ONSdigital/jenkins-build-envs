.PHONY: %.check build

all: docker-compose.check
	docker-compose build --force-rm

# build-% is a dynamic task for building docker compose service in a clean way
# e.g.  build-maven_3.2.5
build-%: docker-compose.check
	docker-compose build --force-rm --no-cache $*

clean:  docker.check
	docker system prune --all

# .check targets just tests for a command to be available on your PATH.
%.check:
	@which $*
