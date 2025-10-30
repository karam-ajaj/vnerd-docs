#!/bin/bash

cd /swarm/config/docs/docs/assets/diagrams/temp/
ls /swarm/config/docs/github-repos/portainer-compose/stacks > list.txt

for stack_name in $(sed 's/\.[^.]*$//' list.txt)
do
    echo $stack_name
    cd /swarm/config/docs/docs/assets/diagrams/temp
    cp /swarm/config/docs/github-repos/portainer-compose/stacks/$stack_name.yml /swarm/config/docs/docs/assets/diagrams/temp/docker-compose.yml
    chmod 777 /swarm/config/docs/docs/assets/diagrams/temp/docker-compose.yml
    docker run --rm -it --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -r --force docker-compose.yml
    # wait for container execution
    # sleep 5
    chmod 777 /swarm/config/docs/docs/assets/diagrams/temp/docker-compose.png
    sleep 1
    mv /swarm/config/docs/docs/assets/diagrams/temp/docker-compose.png /swarm/config/docs/docs/assets/diagrams/$stack_name.png
    sleep 1
done

# rm /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
# rm /swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png
# rm /swarm/config/docs/github-repos/portainer-compose/diagrams/temp/0template.png
cp -r /swarm/config/docs/docs/assets/diagrams /swarm/config/docs/github-repos/portainer-compose/diagrams
