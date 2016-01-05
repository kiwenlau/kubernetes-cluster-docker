#!/bin/bash

echo -e "\nBuild kiwenlau/kubernetes-cluster:1.0.7 image"
sudo docker build -f ./kubernetes-cluster/Dockerfile -t kiwenlau/kubernetes-cluster:1.0.7 ./kubernetes-cluster

docker rm -f kubernetes-master kubernetes-slave1 kubernetes-slave2 kubernetes-slave3 > /dev/null

echo -e "\nRun kubernetes-master container"
docker run -it -d --name=kubernetes-master kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-master.conf 

echo -e "\n\nRun kubernetes-slave1 container"
docker run -it -d --link kubernetes-master:kubernetes-master --privileged  --name=kubernetes-slave1 kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-slave.conf 

echo -e "\n\nRun kubernetes-slave2 container"
docker run -it -d --link kubernetes-master:kubernetes-master --privileged  --name=kubernetes-slave2 kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-slave.conf

echo -e "\n\nRun kubernetes-slave3 container"
docker run -it -d --link kubernetes-master:kubernetes-master --privileged  --name=kubernetes-slave3 kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-slave.conf  

echo -e "\n\nGet into kubernetes-master container"
docker exec -it kubernetes-master bash

echo ""
