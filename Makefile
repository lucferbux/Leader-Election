
.PHONY: build
build:
	./scripts/build.sh

.PHONY: apply
apply:
	kubectl apply -f kube/

.PHONE: status
status:
	kubectl get all --namespace=leader-election

.PHONY: delete
delete:
	kubectl delete -f kube/ --namespace=leader-election