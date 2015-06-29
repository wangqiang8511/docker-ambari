#!/bin/bash

: ${AMBARI_HOST:=${AMBARISERVER_PORT_8080_TCP_ADDR:=localhost}}

echo AMBARI_HOST=${AMBARI_HOST:? ambari server address is mandatory, fallback is a linked containers exposed 8080}

export PATH=/usr/jdk64/jdk1.7.0_67/bin:$PATH
java -jar /opt/ambari-shell.jar --ambari.host=$AMBARI_HOST
