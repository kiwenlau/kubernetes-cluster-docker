#!/bin/bash

# echo -e "\nBuild kiwenlau/kubernetes-cluster:1.0.7 image"
# sudo docker build -f ./kubernetes-cluster/Dockerfile -t kiwenlau/kubernetes-cluster:1.0.7 ./kubernetes-cluster

# run N slave containers
N=$1

# the defaut slave number is 3
if [ $# = 0 ]
then
  N=3
fi

echo -e "\nstart kubernetes-master container"
docker rm -f kubernetes-master &> /dev/null
docker run -it -d --name=kubernetes-master kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-master.conf > /dev/null 


i=1
while [ $i -le $N ]
do
  sudo docker rm -f kubernetes-slave$i &> /dev/null
  echo "start kubernetes-slave$i container..."
  docker run -it -d --link kubernetes-master:kubernetes-master --privileged  --name=kubernetes-slave$i --hostname=kubernetes-slave$i kiwenlau/kubernetes-cluster:1.0.7 /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/kubernetes-slave.conf > /dev/null 
  ((i++))
done 

echo -e "\nGet into kubernetes-master container"
docker exec -it kubernetes-master bash


echo ""
