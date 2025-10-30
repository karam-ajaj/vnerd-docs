---
comments: true
---

# Sonarr

Elevate Your TV Show Management

[Sonarr](https://sonarr.tv/) is a powerful and open-source application designed to revolutionize the way you manage your TV show library. With a focus on automation, flexibility, and user-friendly features, Sonarr simplifies the process of acquiring, organizing, and keeping your favorite TV shows up to date.

## Key Features

- **Automated Downloading:** Sonarr automates the retrieval of your preferred TV shows by seamlessly integrating with download clients such as BitTorrent and Usenet.

- **User-Friendly Interface:** Enjoy an intuitive web-based interface that facilitates easy configuration, monitoring, and management of your TV show library.

- **Customizable Quality Settings:** Tailor your TV show preferences with customizable quality settings, ensuring you get the best viewing experience based on your criteria.

- **Smart Episode Management:** Sonarr intelligently manages episodes, automatically upgrading to higher-quality versions as they become available.

## Getting Started

Embark on your TV show management journey by exploring the [official Sonarr website](https://sonarr.tv/). The website provides comprehensive documentation, installation guides, and support resources to help you get started.

## Community and Support

Connect with the vibrant Sonarr community on the [forums](https://forums.sonarr.tv/) to share experiences, seek assistance, and stay informed about updates and feature discussions. Join a community passionate about optimizing the TV show management experience.

Elevate your TV show library to new heights with Sonarr—a versatile and user-friendly solution for TV enthusiasts.


## Volumes

```bash
/swarm/config/autopirate/sonarr
/swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    volumes:
     - /swarm/config/autopirate/sonarr:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.sonarr-http.rule: Host(`sonarr.vnerd.nl`)
        traefik.http.routers.sonarr-http.entrypoints: http
        traefik.http.routers.sonarr-https.entrypoints: https
        traefik.http.services.sonarr.loadbalancer.server.port: '8989'
        traefik.constraint-label: traefik-public
        traefik.http.routers.sonarr-http.middlewares: https-redirect
        traefik.http.routers.sonarr-https.middlewares: authelia@docker
        traefik.http.routers.sonarr-https.tls: 'true'
        traefik.http.routers.sonarr-https.rule: Host(`sonarr.vnerd.nl`)
        traefik.http.routers.sonarr-https.tls.certresolver: le
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

