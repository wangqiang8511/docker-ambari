# Introduction

Dockerfiler for hdp abmari.

* Ambari version: 2.0.0
* hdp version: 2.2
* system: centos 6

# How to use

Build Image

```bash
./build
```

Start a test cluster

```bash
./start.sh
docker exec -it $(docker ps | grep ambari-server | awk '{print $1}') bash /scripts/install_cluster.sh
```

Remove the test cluster

```bash
./stop.sh
```

# Known Issues

* To get dns and reverse dns working, ip of containers is used as hostname directly.
* To make the example run. You have to have at least 4 containers.
* Change POSTROUTING iptable rules to 

```bash
sudo iptables -t nat -D POSTROUTING 1
sudo iptables -I POSTROUTING -t nat -s 172.17.0.0/16 ! -d 172.17.0.0/16 -j MASQUERADE
```
