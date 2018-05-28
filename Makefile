VERSION_MAJOR ?= 0
VERSION_MINOR ?= 1
VERSION_BUILD ?= 0
VERSION ?= v$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_BUILD)

ORG := github.com
OWNER := kairen
REPOPATH ?= $(ORG)/$(OWNER)/gpu-prometheus-exporter

.PHONY: build
build:
	go build

.PHONY: build_image
build_image:
	docker build -t $(OWNER)/gpu-prometheus-exporter:$(VERSION) .
