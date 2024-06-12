---
comments: true
---

# Jellyfin

Your Open-Source Media Server

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Jellyfin](https://jellyfin.org/) is a powerful and open-source media server that puts you in control of your digital media. It offers a seamless and customizable platform for organizing, streaming, and enjoying your movies, TV shows, music, and photos across various devices.

## Key Features

- **Media Streaming:** Jellyfin enables you to stream your media library to a wide range of devices, including smart TVs, computers, tablets, and mobile phones.

- **User-Friendly Interface:** With an intuitive web-based interface, Jellyfin makes it easy to organize and access your media collection. It supports rich metadata, subtitles, and customizable libraries.

- **Live TV and DVR:** Take your entertainment experience to the next level with Jellyfin's support for live TV and DVR functionality, allowing you to watch and record live broadcasts.

- **Client Apps:** Jellyfin offers a variety of client apps for different platforms, ensuring compatibility with popular devices and operating systems.

## Getting Started

Embark on your Jellyfin journey by visiting the [official Jellyfin website](https://jellyfin.org/). The site provides comprehensive documentation, installation guides, and a vibrant community to support you at every step.

## Community and Support

Connect with the Jellyfin community on the [forums](https://forum.jellyfin.org/) to share your experiences, seek assistance, and participate in discussions. Jellyfin's open-source nature fosters collaboration and continual improvement.

## Freedom to Enjoy Your Media

Experience the freedom of managing and enjoying your media on your terms with Jellyfin. Whether you're a media enthusiast or casual viewer, Jellyfin's versatility and open-source ethos make it a standout choice for your personal media server needs.


## Volumes

```bash
/nfs-nas-swarm/config/jellyfin/config
/nfs-nas-swarm/config/jellyfin/cache
/nfs-nas-swarm/data/media
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  jellyfin:
    image: jellyfin/jellyfin:latest
    environment:
      PGID: '0'
      PUID: '0'
    volumes:
     - /nfs-nas-swarm/config/jellyfin/config:/config
     - /nfs-nas-swarm/config/jellyfin/cache:/cache
     - /nfs-nas-swarm/data/media:/media
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - internal
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.jellyfin.rule: Host(`jellyfin.vnerd.nl`)
        traefik.http.routers.jellyfin-http.entrypoints: http
        traefik.http.routers.jellyfin-http.middlewares: https-redirect
        traefik.http.services.jellyfin.loadbalancer.server.port: '8096'
        traefik.http.routers.jellyfin-https.tls: 'true'
        traefik.http.routers.jellyfin-https.rule: Host(`jellyfin.vnerd.nl`)
        traefik.constraint-label: traefik-public
        traefik.http.routers.jellyfin-https.entrypoints: https
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.jellyfin-https.tls.certresolver: le
      placement:
        constraints:
         - node.labels.Arch!=i686
         - node.hostname == pc03.karam.lab
networks:
  internal:
    driver: overlay
  traefik-public:
    external: true

```
## Notes

