TAG = rvannauker/sassc
VERSION = 3.4.5
FILE_NAME = "sassc.dockerfile"
COMMAND = "--help"
DEBUG_COMMAND = "/bin/sh"
MICROBADGE_HOOK_URL = https://hooks.microbadger.com/images/rvannauker/sassc/tqK5SyLeRWqVU_P2s98QagWuOGg=

.PHONY: default build build_latest push run debug microbadge_hook release

default: build

build:
	docker build \
	       --no-cache \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="$(VERSION)" \
	       --force-rm \
	       --tag "$(TAG):$(VERSION)" \
	       --file "$(FILE_NAME)" \
	       $$PWD

build_latest:
	docker build \
	       --no-cache \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="latest" \
	       --force-rm \
	       --tag "$(TAG):latest" \
	       --file "$(FILE_NAME)" \
	       $$PWD

push:
	docker push $(TAG)

run:
	@docker run \
	       --rm=true \
	       --interactive=true \
           --name "sassc" \
           "$(TAG):$(VERSION)" \
           $(COMMAND)

debug:
	docker run \
	       --rm=true \
	       --interactive=true \
	       --entrypoint=$(DEBUG_COMMAND) \
	       "$(TAG):$(VERSION)"

microbadge_hook:
	curl -X POST $(MICROBADGE_HOOK_URL)

release: build build_latest push microbadge_hook