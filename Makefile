LOCATION ?= eastus
RESOURCE_GROUP ?= aks-101-rg
AKS_CLUSTER_NAME ?= aks-101-Cluster
NODE_COUNT ?= 3
SUBSCRUBTION_ID ?= 

.PHONY: get-account
get-account:
	az account show

.PHONY: set-account
set-account:
	az account set -s $(SUBSCRUBTION_ID)

.PHONY: create-cluster
create-cluster:
	az group create --name $(RESOURCE_GROUP) --location $(LOCATION)
	az aks create --resource-group $(RESOURCE_GROUP) --name $(AKS_CLUSTER_NAME) --node-count 3

.PHONY: get-credential
get-credential:
	az aks get-credentials --resource-group $(RESOURCE_GROUP) --name $(AKS_CLUSTER_NAME)

.PHONY: get-node
get-node:
	kubectl get nodes

.PHONY: deploy-metricserver
deploy-metricserver:
	git clone https://github.com/kubernetes-incubator/metrics-server.git tmp/metrics-server
	kubectl create -f /tmp/metrics-server/deploy/1.8+/

.PHONY: delete-metricserver
delete-metricserver:
	 kubectl delete -f /tmp/metrics-server/deploy/1.8+/
	 rm -rf tmp/metrics-server

.PHONY: scale-cluster
scale-cluster:
	az aks scale --name $(AKS_CLUSTER_NAME) --resource-group $(RESOURCE_GROUP)  --node-count $(NODE_COUNT)

.PHONY: delete-cluster
delete-cluster:
	az group delete --name $(RESOURCE_GROUP) --yes --no-wait