#!/bin/bash

echo -e "\nsudo docker build -t kiwenlau/kubernetes-master:1.0.7 ."
sudo docker build -t kiwenlau/kubernetes-master:1.0.7 .

docker rm -f kubernetes-master > /dev/null

echo -e "\n\ndocker run -it -d kiwenlau/kubernetes-master:1.0.7"
docker run -it -d --name=kubernetes-master kiwenlau/kubernetes-master:1.0.7 