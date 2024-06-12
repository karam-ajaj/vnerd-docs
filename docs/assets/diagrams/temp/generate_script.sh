#!/bin/bash

cd /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp
ls /nfs-nas-swarm/github-repos/portainer-compose/stacks > list.txt

for stack_name in $(sed 's/\.[^.]*$//' list.txt)
do
    echo $stack_name
    cd /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp
    cp /nfs-nas-swarm/github-repos/portainer-compose/stacks/$stack_name.yml /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    docker run --rm -it -d --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -r docker-compose.yml 
    # docker run --rm -it -d --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -o $stack_name.png docker-compose.yml
    # wait for container execution
    sleep 5
    chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png 
    sleep 1
    # chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/$stack_name.png
    mv /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png /nfs-nas-swarm/github-repos/portainer-compose/diagrams/$stack_name.png 
    sleep 1
done

# rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
# rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png
rm /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/0template.png
cp -r /nfs-nas-swarm/github-repos/portainer-compose/diagrams /nfs-nas-swarm/config/docs/docs/assets



# Usage:
#   render [options] [--] [<input-file>]

# Arguments:
#   input-file                         Path to a docker compose file [default: "./docker-compose.yml"]

# Options:
#       --override=OVERRIDE            Tag of the override file to use [default: "override"]
#   -o, --output-file=OUTPUT-FILE      Path to a output file (Only for "dot" and "image" output format) [default: "./docker-compose.dot" or "./docker-compose.png"]
#   -m, --output-format=OUTPUT-FORMAT  Output format (one of: "dot", "image", "display") [default: "display"]
#       --only=ONLY                    Display a graph only for a given services (multiple values allowed)
#   -f, --force                        Overwrites output file if it already exists
#       --no-volumes                   Do not display volumes
#   -r, --horizontal                   Display a horizontal graph
#       --ignore-override              Ignore override file