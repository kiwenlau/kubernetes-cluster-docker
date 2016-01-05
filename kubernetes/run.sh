#!/bin/bash

echo -e "\nsudo docker build -t kiwenlau/kubernetes-cluster:1.0.7 ."
sudo docker build -t kiwenlau/kubernetes-cluster:1.0.7 .

docker rm -f kubernetes-master > /dev/null

rm tmp/*

echo -e "\n\ndocker run -it -d kiwenlau/kubernetes-cluster:1.0.7 /usr/local/bin/start-kubernetes.sh master ."
docker run -it -d --name=kubernetes-master -v /root/mac/kubernetes-cluster-docker/kubernetes/tmp:/tmp kiwenlau/kubernetes-cluster:1.0.7 