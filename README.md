#基于Docker快速搭建Kuberntes集群


##项目简介

将kubernetes运行在Docker容器之中，可以快速地在单机上搭建多节点的Kubernetes集群。如下图所示，我在Ubuntu主机上一共运行了4个Docker容器：其中1个为Kubernetes Master，另外3个为Kubernetes Slave。Master容器中运行了etcd, apiserver, controller manager和scheduler组件，Slave中运行了docker daemon, proxy和kubelet组件。

Kubernetes Slave采用了Docker-in-Docker模式，因此，由Kubernetes启动的容器均运行在Kubernetes Slave中。Docker自1.8.0开始，容器会自动挂载cgroups，使得运行Docker-in-Docker时不需要手动挂载cgroups。

一般来说，Docker容器适合运行单线程应用，然而很多时候我们需要在容器中运行多个线程。例如，Kubernetes Master中一共运行了4个线程: etcd, controller manager, apiserver, scheduler。

在Docker容器中运行多个线程最直接的方法是使用shell脚本启动多个线程。然而，当Kubernetes Master中的各个组件以后台程序形式启动之后，shell脚本将会退出，Docker容器也跟着退出了。因为shell脚本是容器启动的第1个线程，PID为1，1号线程退出时，Docker容器则会退出。当然，可以在shell脚本的最后启动一个不退出的前台程序，例如bash，使得shell脚本不退出即可。

![alt text](https://github.com/kiwenlau/kubernetes-cluster-docker/raw/master/kubernetes-cluster-docker.png "Image Architecture")


##运行步骤

1.安装Docker

ubuntu 14.04上安装Docker: 

```
curl -fLsS https://get.docker.com/ | sh
```

其他系统请参考: [https://docs.docker.com/](https://docs.docker.com/)

2.下载Docker镜像

```
sudo docker pull kiwenlau/kubernetes-cluster:1.0.7
```

3.克隆GitHub仓库

```
git clone https://github.com/kiwenlau/kubernetes-cluster-docker
cd kubernetes-cluster-docker
```

4.启动kubernetes

```
chmod +x start-kubernetes.sh
./start-kubernetes.sh 
```

运行成功后进入kubernetes-master容器

5.测试kubernetes

```
./test-kubernetes.sh
```