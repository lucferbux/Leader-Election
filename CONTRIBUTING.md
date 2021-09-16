## Building

```shell script
GOOS=linux GOARCH=amd64 go build -o leader-election .
docker build -t lucferbux/leader-election .
docker push lucferbux/leader-election
```

## Applying

```shell script
kubectl apply -f kube/
```

## Remove

```shell script
kubectl delete -f kube/
kubectl delete lease leader-election --namespace=leader-election
```