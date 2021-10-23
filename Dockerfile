FROM alpine:latest

RUN  apk update && \
  apk add --no-cache ca-certificates \
  openssh-client \
  sshpass \
  bash


COPY entrypoint.sh /
#COPY test.key /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]