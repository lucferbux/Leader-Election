FROM scratch
COPY leader-election /usr/bin/leader-election
ENTRYPOINT ["leader-election"]
