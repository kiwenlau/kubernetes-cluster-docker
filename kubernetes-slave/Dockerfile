FROM ubuntu:14.04

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

RUN apt-get update && apt-get install -y supervisor wget vim

# Install etcd and kubernetes
ADD install-kubernetes.sh /tmp/install-kubernetes.sh
RUN sh /tmp/install-kubernetes.sh

ADD pod-nginx.yaml /root/pod-nginx.yaml
ADD test-kubernetes.sh /root/test-kubernetes.sh

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]