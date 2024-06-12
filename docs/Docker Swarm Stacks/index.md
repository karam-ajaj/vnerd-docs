---
comments: true
---
# Introduction

This section contains the required yaml files and the deployment procedure to create the services in a docker swarm cluster.

[GitHub Repository](https://github.com/karam-ajaj/portainer-compose)

## Reference
Every article contains the following sections:

1. Volumes --> the volumes needed to store the configuration and data files for each stack (it is deployed on a shared NAS storage)

2. Deployment --> the steps required to deploy the stack

3. Docker swarm file --> the yaml file that is fed to swarmpit to deploy the stack

4. Notes --> additional notes

First you need to deploy the Swarmpit stack (management service in this case) and Traefik stack (proxy service), then you can go further with deploying whatever service you desire.

## Tools used to build this section

### Diagrams *(Graphviz)*
Built using Graphviz as container from this project [pmsipilot/docker-compose-viz](https://github.com/pmsipilot/docker-compose-viz).

The script will create a list of all the stacks and generate graphs and copy these images to the relative path to be desplayed in this section.

``` bash linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/diagrams/temp/generate_script.sh"
```

### Description *(ChatGPT)*

The introduction for each section was written using ChatGPT using this simple request:

``` 
write a short introduction about {} in markdown language 
```

### Configurations *(GitHub repo)*

Built using a [github repository](https://github.com/karam-ajaj/portainer-compose) that is connected to each file in this section to publish the yaml files directly (even if they are updated 😉 ).