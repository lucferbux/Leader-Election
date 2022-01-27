# Contributing

## First steps

1. Create a new local env  `touch .env.local`
2. Add your custom variables based on *.env*
3. Start to build your image
4. Deploy your build image
5. Change the container image in `kube/deploy.yaml`

## Building

You can build your registry with this command:

```shell
GOOS=linux GOARCH=amd64 go build -o leader-election .
docker build -t [REGISTRY] .
docker push [REGISTRY]
```

Or just by running

```shell
make build-push
```

## Deploying

Just run

```shell script
kubectl apply -f kube/
```

Or with make:

```shell
make  apply
```

## Remove

```shell script
kubectl delete -f kube/
kubectl delete lease leader-election --namespace=leader-election
```
