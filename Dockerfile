FROM alpine:3.10

RUN apk update && apk add curl git bash

COPY taint-nodes.sh .
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && mv kubectl /usr/local/bin/kubectl
ENTRYPOINT ["/bin/bash","taint-nodes.sh"]