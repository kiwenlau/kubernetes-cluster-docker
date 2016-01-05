#基于Docker快速搭建Kuberntes集群


##项目简介

![alt text](https://github.com/kiwenlau/kubernetes-cluster-docker/raw/master/kubernetes-cluster-docker.png "Image Architecture")


##运行步骤

1.下载Docker镜像

```
sudo docker pull kiwenlau/kubernetes-cluster:1.0.7
```

2.克隆GitHub仓库

```
git clone https://github.com/kiwenlau/kubernetes-cluster-docker
cd kubernetes-cluster-docker
```

3.启动kubernetes

```
chmod +x start-kubernetes.sh
./start-kubernetes.sh 
```

运行成功后进入kubernetes-master容器


4.测试kubernetes

```
./test-kubernetes.sh
```