---
comments: true
---

This section contains the required yaml files and the deployment procedure to create the services in a docker swarm cluster

[GitHub Repository](https://github.com/karam-ajaj/portainer-compose)

## Reference
Every article contains the following sections:

1. Volumes --> the volumes needed to store the configuration and data files for each stack (it is deployed on a shared NAS storage)

2. Deployment --> the steps required to deploy the stack

3. Docker swarm file --> the yaml file that is fed to swarmpit to deploy the stack

4. Notes --> additional notes

First you need to deploy the Swarmpit stack (management service in this case) and Traefik stack (proxy service), then you can go further with deploying whatever service you desire.

