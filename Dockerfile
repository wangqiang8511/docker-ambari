FROM centos:6

MAINTAINER Wang Qiang "wangqiang8511@gmail.com"

# Setup Basic system pkgs
RUN yum update -y
RUN yum install -y vim less curl wget unzip tar ntp

# Setup ambari
RUN cd /etc/yum.repos.d/ && \
    wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo
RUN yum install -y ambari-server ambari-agent
ADD blueprints /opt/blueprints
ADD scripts /scripts
ADD scripts/hostname.sh /etc/ambari-agent/conf/hostname.sh
ADD conf/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini
RUN curl -o /opt/ambari-shell.jar https://s3-eu-west-1.amazonaws.com/maven.sequenceiq.com/releases/com/sequenceiq/ambari-shell/0.1.23/ambari-shell-0.1.23.jar

CMD /scripts/bootstrap.sh
