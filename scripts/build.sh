GOOS=linux GOARCH=amd64 go build -o leader-election .
docker build -t lucferbux/leader-election .
docker push lucferbux/leader-election