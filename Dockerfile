FROM centos:6

MAINTAINER Wang Qiang "wangqiang8511@gmail.com"

# Setup Basic system pkgs
RUN yum update -y
RUN yum install -y vim less curl wget unzip tar

# Setup ambari
RUN cd /etc/yum.repos.d/ && \
    wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo
RUN yum install -y ambari-server ambarii-agent
