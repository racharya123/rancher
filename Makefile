TARGETS := $(shell ls scripts)

.dapper:
	@echo Downloading dapper
	@curl -sL https://releases.rancher.com/dapper/latest/dapper-`uname -s`-`uname -m` > .dapper.tmp
	@@chmod +x .dapper.tmp
	@./.dapper.tmp -v
	@mv .dapper.tmp .dapper

$(TARGETS): .dapper
	@if [ "$@" = "post-release-checks" ] || [ "$@" = "list-gomod-updates" ] || [ "$@" = "check-chart-kdm-source-values" ]; then \
		./.dapper -q --no-out $@; \
	else \
		./.dapper $@; \
	fi

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)

DOCKER_REPO ?= 'staging.docker.akamai.com/abattery-poc-test'
DOCKER_IMAGE ?= 'rancher/rancher:ngab-poc'

tag-and-push:
	@docker images
	@docker tag $(DOCKER_IMAGE) $(DOCKER_REPO)/$(DOCKER_IMAGE)
	@docker push $(DOCKER_REPO)/$(DOCKER_IMAGE)
