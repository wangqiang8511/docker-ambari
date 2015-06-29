#!/bin/bash

: ${BLUEPRINT:=multinode-simple}

export PATH=/usr/jdk64/jdk1.7.0_67/bin:$PATH

/scripts/ambari_shell.sh << EOF
blueprint add --file /opt/blueprints/${BLUEPRINT}.json
cluster build --blueprint $BLUEPRINT
cluster autoAssign
cluster create --exitOnFinish true
EOF
