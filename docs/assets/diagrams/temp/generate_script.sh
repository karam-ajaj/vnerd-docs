#!/bin/bash

cd /swarm/github-repos/portainer-compose/diagrams/temp
ls /swarm/github-repos/portainer-compose/stacks > list.txt

for stack_name in $(sed 's/\.[^.]*$//' list.txt)
do
    echo $stack_name
    cd /swarm/github-repos/portainer-compose/diagrams/temp
    cp /swarm/github-repos/portainer-compose/stacks/$stack_name.yml /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    chmod 777 /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    docker run --rm -it -d --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -r docker-compose.yml 
    # wait for container execution
    sleep 5
    chmod 777 /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png 
    sleep 1
    mv /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png /swarm/github-repos/portainer-compose/diagrams/$stack_name.png 
    sleep 1
done

# rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
# rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png
rm /swarm/github-repos/portainer-compose/diagrams/temp/0template.png
cp -r /swarm/github-repos/portainer-compose/diagrams /swarm/config/docs/docs/assets
