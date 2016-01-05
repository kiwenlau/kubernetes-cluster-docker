#!/bin/bash

role=$1

start_master()
{
	exec etcd --data-dir=/var/etcd/data > /tmp/etcd.log 2>&1 &
	sleep 5
	# exec kube-apiserver --service-cluster-ip-range=10.0.0.1/24 --insecure-bind-address=0.0.0.0 --etcd_servers=http://127.0.0.1:4001 > /tmp/kube-apiserver.log 2>&1 &
	# sleep 5
	# exec kube-controller-manager --master=http://0.0.0.0:8080 > /tmp/kube-controller-manager.log 2>&1 &
	# exec kube-scheduler --master=http://0.0.0.0:8080 > /tmp/kube-scheduler.log 2>&1 &
}

if [[ $1 = "master" ]]; then
	start_master
fi