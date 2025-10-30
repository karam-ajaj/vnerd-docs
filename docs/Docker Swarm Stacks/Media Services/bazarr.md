---
comments: true
---

# Bazarr
Your Cross-Platform Subtitle Companion

[Bazarr](https://github.com/morpheus65535/bazarr) is an open-source and cross-platform application designed to simplify the management of subtitles for your media collection. Developed by the [Bazarr community](https://github.com/morpheus65535/bazarr), this versatile tool seamlessly integrates with popular media servers, ensuring that your movies and TV shows are always accompanied by accurate and timely subtitles.

## Key Features

- **Subtitle Management:** Bazarr automates the searching, downloading, and management of subtitles for your media content, supporting a wide range of languages.

- **Integration with Media Servers:** Enjoy seamless integration with media servers such as Plex, Sonarr, and Radarr, enhancing your media streaming experience.

- **Customization and Flexibility:** Tailor Bazarr to your preferences with customizable settings, including subtitle provider selection, preferred languages, and scheduling options.

- **User-Friendly Interface:** Bazarr boasts an intuitive web interface that simplifies the configuration and monitoring of your subtitle management tasks.

## Getting Started

Getting started with Bazarr is a breeze. Dive into the [Bazarr GitHub repository](https://github.com/morpheus65535/bazarr) for comprehensive documentation, installation guides, and configuration details.

## Community and Support

Connect with the Bazarr community on [GitHub](https://github.com/morpheus65535/bazarr) to engage in discussions, share experiences, and seek assistance. Join a vibrant community of media enthusiasts dedicated to enhancing the subtitle experience for every user.

Experience the convenience and accuracy of Bazarr—a reliable companion for managing subtitles effortlessly in your media library.


## Volumes

```bash
/swarm/config/autopirate/bazarr
/swarm/data/autopirate/data
```

## Deployment

## Docker swarm file
```yaml
version: '3.3'
services:
  bazarr:
    image: ghcr.io/hotio/bazarr:latest
    environment:
      PGID: '911'
      PUID: '911'
    volumes:
     - /swarm/config/autopirate/bazarr:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.bazarr-http.entrypoints: http
        traefik.http.routers.bazarr-https.entrypoints: https
        traefik.http.routers.bazarr-https.tls: 'true'
        traefik.http.routers.bazarr-https.tls.certresolver: le
        traefik.http.routers.bazarr-https.rule: Host(`bazarr.vnerd.nl`)
        traefik.http.services.bazarr.loadbalancer.server.port: '6767'
        traefik.constraint-label: traefik-public
        traefik.http.routers.bazarr-http.rule: Host(`bazarr.vnerd.nl`)
        traefik.http.routers.bazarr-http.middlewares: https-redirect
        traefik.http.routers.bazarr-https.middlewares: authelia@docker
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
      placement:
        constraints:
         - node.labels.Arch!=i686
networks:
  autopirate-network:
    driver: overlay
  traefik-public:
    external: true
```
## Notes

