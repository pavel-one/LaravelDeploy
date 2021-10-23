FROM alpine:latest

RUN  apk update && \
  apk add --no-cache ca-certificates \
  openssh-client \
  sshpass \
  bash


COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]