#!/bin/bash

echo -e "\nsudo docker build -t kiwenlau/kubernetes-slave:1.0.7 ."
sudo docker build -t kiwenlau/kubernetes-slave:1.0.7 .

docker rm -f kubernetes-slave > /dev/null

echo -e "\n\ndocker run -it -d kiwenlau/kubernetes-slave:1.0.7"
docker run -it -d --link kubernetes-master:kubernetes-master --privileged  -v /var/run/docker.sock:/var/run/docker.sock --name=kubernetes-slave kiwenlau/kubernetes-slave:1.0.7 