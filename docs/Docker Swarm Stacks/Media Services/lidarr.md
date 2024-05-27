---
comments: true
---

# Lidarr

Your Music Collection, Automated

[Lidarr](https://lidarr.audio/) is an open-source, cross-platform application designed for music enthusiasts who want a seamless and automated way to manage their music collections. As a part of the Servarr family, Lidarr focuses specifically on the organization and maintenance of music libraries, ensuring that your favorite tunes are always well-organized and up-to-date.

## Key Features of Lidarr

- **Automated Music Management:** Lidarr automates the process of searching, downloading, and organizing your music library, ensuring your collection is comprehensive and up-to-date.

- **Intelligent Searching:** Utilizing various sources, Lidarr intelligently searches for your preferred music, fetching high-quality metadata and cover art to enhance your listening experience.

- **Customization and Preferences:** Tailor Lidarr to your preferences with customizable settings, including preferred quality, language, and release type, providing a personalized music management experience.

- **Cross-Platform Compatibility:** Lidarr is compatible with various operating systems, including Windows, macOS, and Linux, ensuring flexibility in deployment.

## Getting Started with Lidarr

To embark on your automated music management journey with Lidarr, visit the [official Lidarr website](https://lidarr.audio/) for downloads and installation guides. Whether you're a music enthusiast or someone new to automated music organization, Lidarr provides an intuitive interface and user-friendly setup.

## Community and Support

Connect with the Lidarr community on the [forums](https://forums.lidarr.audio/) to engage in discussions, seek assistance, and share your experiences. Join a vibrant community of music lovers and automation enthusiasts who are passionate about optimizing their music collections.

Experience the convenience and precision of Lidarr—a reliable companion for managing your music library with flair.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/lidarr
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  lidarr:
    image: lscr.io/linuxserver/lidarr:latest
    volumes:
     - /etc/localtime:/etc/localtime:ro
     - /nfs-nas-swarm/config/autopirate/lidarr:/config
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.lidarr-https.tls.certresolver: le
        traefik.http.routers.lidarr-https.middlewares: authelia@docker
        traefik.http.routers.lidarr-http.entrypoints: http
        traefik.http.routers.lidarr-http.rule: Host(`lidarr.vnerd.nl`)
        traefik.http.routers.lidarr-https.tls: 'true'
        traefik.constraint-label: traefik-public
        traefik.http.routers.lidarr-https.rule: Host(`lidarr.vnerd.nl`)
        traefik.http.services.lidarr.loadbalancer.server.port: '8686'
        traefik.http.routers.lidarr-https.entrypoints: https
        traefik.http.routers.lidarr-http.middlewares: https-redirect
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

