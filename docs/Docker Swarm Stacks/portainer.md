---
comments: true
---

## ChatGPT
write a short introduction about {} in markdown language

## Volumes

```bash
/nfs-nas-swarm/data/portainer
```

## Deployment
PORTAINER_LICENSE_KEY should be added.

## Docker swarm file
```yaml
version: '3.3'
services:
  agent:
    image: portainer/agent:latest
    environment:
      AGENT_CLUSTER_ADDR: tasks.agent
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock
     - /var/lib/docker/volumes:/var/lib/docker/volumes
    networks:
     - portainer-internal
    logging:
      driver: json-file
    deploy:
      mode: global
      placement:
        constraints:
         - node.platform.os == linux
         - node.labels.Arch != i686
  portainer:
    image: portainer/portainer-ce:latest
    command:
     - -H
     - tcp://tasks.agent:9001
     - --tlsskipverify
    environment:
      PORTAINER_LICENSE_KEY: {license-key}
    volumes:
     - /var/run/docker.sock:/var/run/docker.sock
     - /nfs-nas-swarm/data/portainer:/data
    networks:
     - portainer-internal
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.portainer-https.entrypoints: https
        traefik.http.routers.portainer-https.tls.certresolver: le
        traefik.http.routers.portainer-http.middlewares: https-redirect
        traefik.http.routers.portainer-https.tls: 'true'
        traefik.constraint-label: traefik-public
        traefik.http.services.portainer.loadbalancer.server.port: '9000'
        traefik.http.routers.portainer-http.entrypoints: http
        traefik.http.routers.portainer-http.rule: Host(`portainer.vnerd.nl`)
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.portainer-https.middlewares: authelia@docker
        traefik.http.routers.portainer-https.rule: Host(`portainer.vnerd.nl`)
      update_config:
        parallelism: 0
        failure_action: rollback
      placement:
        constraints:
         - node.role == manager
networks:
  portainer-internal:
    driver: overlay
  traefik-public:
    external: true

```
## Notes

