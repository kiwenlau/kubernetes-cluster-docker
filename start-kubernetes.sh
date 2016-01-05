#!/bin/bash

echo -e "\nBuild kiwenlau/kubernetes-cluster:1.0.7 image"
sudo docker build -f ./kubernetes-cluster/Dockerfile -t kiwenlau/kubernetes-cluster:1.0.7 ./kubernetes-cluster

docker rm -f kubernetes-master kubernetes-slave > /dev/null

echo -e "\nRun kubernetes-master container"
docker run -it -d --name=kubernetes-master kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-master.conf 

echo -e "\n\nRun kubernetes-slave container"
docker run -it -d --link kubernetes-master:kubernetes-master --privileged  --name=kubernetes-slave kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-slave.conf 

echo -e "\n\nGet into kubernetes-master container"
docker exec -it kubernetes-master bash

echo ""
