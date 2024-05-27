---
comments: true
---

# Radarr

Automate Your Movie Collection

[Radarr](https://radarr.video/) is an open-source movie management tool that revolutionizes the way you organize and enjoy your film collection. With its powerful automation features, Radarr takes the hassle out of movie tracking, ensuring that your library is always up-to-date and well-organized.

## Key Features of Radarr

- **Automated Search and Download:** Radarr automatically searches for your desired movies and downloads them using popular torrent or Usenet providers.

- **Intelligent Quality Settings:** Set preferred quality profiles, and Radarr will ensure that your movies meet your specified standards, upgrading to higher resolutions when available.

- **Customizable Watchlists:** Easily manage your movie watchlist by adding and organizing movies with Radarr's user-friendly interface.

- **Comprehensive Notification System:** Stay informed about your movie library with Radarr's notification system, alerting you to new releases, downloads, and other important events.

## Getting Started

Getting started with Radarr is straightforward. Visit the [Radarr website](https://radarr.video/) for downloads, installation guides, and comprehensive documentation. Whether you're a casual movie enthusiast or a seasoned media collector, Radarr caters to all levels of expertise.

## Community and Support

Connect with the active Radarr community on [GitHub](https://github.com/Radarr/Radarr) to engage in discussions, seek assistance, and stay updated on the latest features and enhancements. Join a community passionate about simplifying movie management through automation.

Enhance your movie-watching experience with Radarr—where automation meets a well-organized film collection.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/radarr
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  radarr:
    image: lscr.io/linuxserver/radarr:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/radarr:/config
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.radarr-https.tls: 'true'
        traefik.http.routers.radarr-http.entrypoints: http
        traefik.http.routers.radarr-https.middlewares: authelia@docker
        traefik.http.routers.radarr-https.tls.certresolver: le
        traefik.http.routers.radarr-https.entrypoints: https
        traefik.http.routers.radarr-http.middlewares: https-redirect
        traefik.constraint-label: traefik-public
        traefik.http.services.radarr.loadbalancer.server.port: '7878'
        traefik.http.routers.radarr-https.rule: Host(`radarr.vnerd.nl`)
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.radarr-http.rule: Host(`radarr.vnerd.nl`)
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

