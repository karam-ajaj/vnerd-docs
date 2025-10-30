---
comments: true
---
# Headphones

Your Audio Exploration Companion

[Headphones](https://github.com/rembo10/headphones) is an open-source application that transforms the way you explore and enjoy music. Created by the [Headphones community](https://github.com/rembo10/headphones), this versatile tool automates the process of searching, downloading, and organizing your favorite tunes, making it an indispensable companion for music enthusiasts.

## Key Features

- **Automated Music Discovery:** Headphones seamlessly integrates with various music databases to automate the discovery of your favorite artists, albums, and tracks.

- **Download Management:** Effortlessly download high-quality audio files, ensuring a pristine listening experience for your music collection.

- **Customizable Preferences:** Tailor Headphones to your musical preferences with customizable settings, including preferred audio formats, bitrates, and music genres.

- **Integration with Media Servers:** Enjoy seamless integration with media servers like Plex and others, enhancing your overall media streaming experience.

## Getting Started

Embark on your musical journey with Headphones by exploring the detailed documentation available on the [GitHub repository](https://github.com/rembo10/headphones). The documentation provides step-by-step guides, configuration details, and tips for optimizing your music discovery setup.

## Community and Support

Connect with the Headphones community on [GitHub](https://github.com/rembo10/headphones) to engage in discussions, share musical discoveries, and seek assistance. Join a dynamic community of music enthusiasts dedicated to simplifying and enhancing the way we experience and organize our music libraries.

Experience the joy of automated music discovery and organization with Headphones—a must-have tool for every audiophile.


## Volumes

```bash
/swarm/config/autopirate/headphones
/swarm/data/autopirate/data
```

## Deployment

## Docker swarm file
```yaml
version: '3.3'
services:
  headphones:
    image: lscr.io/linuxserver/headphones:latest
    volumes:
     - /swarm/config/autopirate/headphones:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.headphones-http.rule: Host(`headphones.vnerd.nl`)
        traefik.http.routers.headphones-https.tls.certresolver: le
        traefik.http.routers.headphones-https.entrypoints: https
        traefik.http.routers.headphones-http.middlewares: https-redirect
        traefik.constraint-label: traefik-public
        traefik.http.services.headphones.loadbalancer.server.port: '8181'
        traefik.http.routers.headphones-http.entrypoints: http
        traefik.http.routers.headphones-https.rule: Host(`headphones.vnerd.nl`)
        traefik.http.routers.headphones-https.tls: 'true'
        traefik.http.routers.headphones-https.middlewares: authelia@docker
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

