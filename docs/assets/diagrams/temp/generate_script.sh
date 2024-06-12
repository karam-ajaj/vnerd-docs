#!/bin/bash

cd /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp
ls /nfs-nas-swarm/github-repos/portainer-compose/stacks > list.txt

for stack_name in $(sed 's/\.[^.]*$//' list.txt)
do
    echo $stack_name
    cd /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp
    cp /nfs-nas-swarm/github-repos/portainer-compose/stacks/$stack_name.yml /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    docker run --rm -it -d --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image docker-compose.yml
    # wait for container execution
    sleep 5
    chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png
    mv /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png /nfs-nas-swarm/github-repos/portainer-compose/diagrams/$stack_name.png
    sleep 5
done

rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png
rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/0template.png
cp -r /nfs-nas-swarm/github-repos/portainer-compose/diagrams /nfs-nas-swarm/config/docs/docs/assets