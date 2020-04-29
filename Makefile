SHELL := /usr/bin/env bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: ova-local
ova-local: ## Build an ova using your local vmware (workstation, player etc) 
	hack/build_local_vmware.sh

.PHONY: ova-vsphere 
ova-vsphere: ## Build an ova on a remote vSphere cluster (requires update to variables in the rke-server.json manifest)
	hack/build_remote_vsphere.sh

.PHONY: qcow2
qcow2: ## Build a qcow2 using a qemu/kvm build system
