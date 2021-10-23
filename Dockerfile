FROM alpine:latest

RUN  apk update && \
  apk add --no-cache ca-certificates \
  openssh-client \
  sshpass \
  bash

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]