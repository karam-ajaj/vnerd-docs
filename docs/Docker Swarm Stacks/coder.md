---
comments: true
---

# Coder

Revolutionizing Development Environments

[Coder](https://coder.com/) is a cutting-edge platform that revolutionizes the way developers create, collaborate, and deploy applications. With a focus on simplicity and efficiency, Coder provides a cloud-based development environment that empowers teams to code securely and collaboratively from anywhere in the world.

## Key Features

- **Cloud-Native Development:** Coder allows developers to access their development environments from the cloud, eliminating the need for complex local setups and ensuring consistency across team members.

- **Collaboration Tools:** Enhance teamwork with collaborative features that enable real-time code sharing, pair programming, and seamless communication within the development environment.

- **Security First:** Coder prioritizes security by providing secure and isolated development environments, ensuring that code and data are protected throughout the development lifecycle.

- **Scalability:** Whether you're a solo developer or part of a large enterprise, Coder scales effortlessly to meet your team's needs, providing a flexible and adaptable development environment.

## Getting Started

Embark on a new era of development with Coder by exploring the platform's features and capabilities. The [official Coder website](https://coder.com/) offers detailed documentation, tutorials, and resources to help you get started quickly.

## Community and Support

Join the Coder community to connect with fellow developers, share insights, and seek assistance. Stay informed about updates, new features, and best practices through community forums and official channels.

Experience the future of collaborative and cloud-native development with Coder—a platform designed to transform the way you code and build software.


## Volumes

```bash
/nfs-nas-swarm/config/coder
/nfs-nas-swarm/config
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  coder:
    image: lscr.io/linuxserver/code-server:latest
    environment:
      PASSWORD: password
      PGID: '911'
      PUID: '911'
      TZ: Europe/Amsterdam
      DEFAULT_WORKSPACE: '/home/coder/nfs-nas-swarm/config'
    volumes:
     - /nfs-nas-swarm/config:/home/coder/nfs-nas-swarm/config
     - /nfs-nas-swarm/config/coder:/config
    networks:
     - traefik-public
    logging:
      driver: json-file
    deploy:
      replicas: 0
      labels:
        sablier.enable: 'true'
        traefik.http.routers.coder-https.entrypoints: https
        traefik.http.routers.coder-https.middlewares: authelia@docker, coder-sablier@file
        traefik.http.routers.coder-http.middlewares: https-redirect
        traefik.http.routers.coder-https.rule: Host(`coder.vnerd.nl`)
        traefik.http.routers.coder-https.tls.certresolver: le
        traefik.http.routers.coder-https.tls: 'true'
        traefik.http.routers.coder-http.entrypoints: http
        sablier.group: coder
        traefik.constraint-label: traefik-public
        traefik.docker.lbswarm: 'true'
        traefik.http.services.coder.loadbalancer.server.port: '8443'
        traefik.http.routers.coder-http.rule: Host(`coder.vnerd.nl`)
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
      placement:
        constraints:
         - node.labels.Arch!=i686
networks:
  traefik-public:
    external: true


```
## Notes

