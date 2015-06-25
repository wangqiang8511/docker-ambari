docker ps -a | grep 'ambari' | awk '{print $1}' | sudo xargs docker rm -f
