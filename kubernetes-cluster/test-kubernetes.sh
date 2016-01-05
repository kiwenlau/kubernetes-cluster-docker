#!/bin/bash

echo -e "\nkubectl create -f pod-nginx.yaml"
kubectl create -f pod-nginx.yaml

echo -e "\nkubectl get pods/nginx\n"

while [[ true ]]; do
        kubectl get pods/nginx
        nginxPod=`kubectl get pods/nginx | grep Running | grep 1/1`
        if [[ $nginxPod ]]; then
                break
        fi
        sleep 2
done

echo -e "\nkubectl describe pods/nginx\n"
kubectl describe pods/nginx

echo ""
