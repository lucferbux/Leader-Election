FROM alpine:3.14
RUN apk --no-cache add curl
COPY leader-election /usr/bin/leader-election
ENTRYPOINT ["leader-election"]
