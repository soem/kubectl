FROM alpine

MAINTAINER ChihChieh, Huang <soem.hcc@gmail.com>

ARG KUBE_VERSION="v1.19.9"
ENV KUBE_VERSION ${KUBE_VERSION}

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

CMD ["kubectl"]
