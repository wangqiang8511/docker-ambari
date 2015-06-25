# Introduction

Dockerfiler for hdp abmari.

Ambari version: 2.0.0
hdp version: 2.2
system: centos 6

# Known Issues

* To get dns and reverse dns working, ip of containers is used as hostname directly.
* Change POSTROUTING iptable rules to 

```bash
sudo iptables -t nat -D POSTROUTING 1
sudo iptables -I POSTROUTING -t nat -s 172.17.0.0/16 ! -d 172.17.0.0/16 -j MASQUERADE
```
