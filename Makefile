DEFAULT_ENV_FILE := .env
ifneq ("$(wildcard $(DEFAULT_ENV_FILE))","")
include ${DEFAULT_ENV_FILE}
export $(shell sed 's/=.*//' ${DEFAULT_ENV_FILE})
endif

ENV_FILE := .env.local
ifneq ("$(wildcard $(ENV_FILE))","")
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})
endif

LEADER_ELECTED = $(shell kubectl -n leader-election get pods --field-selector=status.phase=Running -o jsonpath='{.items[0].metadata.name}')

.PHONY: build-push
build-push:
	./scripts/build-push.sh

.PHONY: apply
apply:
	kubectl apply -f kube/

.PHONE: status
status:
	kubectl get all --namespace=leader-election

.PHONE: status-pods
status-pods:
	kubectl get pods --namespace=leader-election

.PHONE: get-leader
get-leader:
	kubectl -n leader-election get pods --field-selector=status.phase=Running

.PHONE: delete-leader
delete-leader:
	kubectl -n leader-election delete pod $(LEADER_ELECTED)

.PHONE: logs-leader
logs-leader:
	kubectl -n leader-election logs $(LEADER_ELECTED)

.PHONY: delete
delete:
	kubectl delete -f kube/ --namespace=leader-election