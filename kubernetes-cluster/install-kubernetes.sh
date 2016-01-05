#!/bin/bash

cd /tmp

# Install ectd v2.2.3
wget --no-check-certificate  https://github.com/coreos/etcd/releases/download/v2.2.3/etcd-v2.2.3-linux-amd64.tar.gz
tar xzvf etcd-v2.2.3-linux-amd64.tar.gz
cp etcd-v2.2.3-linux-amd64/etcd* /usr/local/bin
rm -rf etcd-v2.2.3-linux-amd64.tar.gz etcd-v2.2.3-linux-amd64

# Install Kubernetes 1.0.7
wget https://github.com/kubernetes/kubernetes/releases/download/v1.0.7/kubernetes.tar.gz
tar -xzvf kubernetes.tar.gz
tar -xzvf kubernetes/server/kubernetes-server-linux-amd64.tar.gz

cp kubernetes/server/bin/hyperkube /usr/local/bin/
cp kubernetes/server/bin/kube-apiserver /usr/local/bin/
cp kubernetes/server/bin/kube-controller-manager /usr/local/bin/
cp kubernetes/server/bin/kube-scheduler /usr/local/bin/
cp kubernetes/server/bin/kube-proxy /usr/local/bin/
cp kubernetes/server/bin/kubelet /usr/local/bin/
cp kubernetes/platforms/linux/amd64/kubectl /usr/local/bin/

rm -rf kubernetes kubernetes.tar.gz