FROM rcarmo/alpine:3.6-armhf

RUN apk add --update \
    dumb-init

ADD rootfs /

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

USER nobody

CMD ["/punydns.sh"]
