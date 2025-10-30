---
comments: true
---

# SABnzbd

Effortless Usenet Downloads

[SABnzbd](https://sabnzbd.org/) stands as a versatile and open-source Usenet client designed for simplifying and automating the process of downloading content from Usenet newsgroups. Whether you're a seasoned Usenet user or a newcomer, SABnzbd provides a user-friendly interface and powerful features for efficient and automated downloads.

## Key Features

- **Automatic Downloads:** SABnzbd excels in automating the downloading process, allowing users to queue, download, and unpack content seamlessly.

- **Web Interface:** Access SABnzbd's intuitive web-based interface from any device, providing convenient control and monitoring of your downloads.

- **NZB File Support:** SABnzbd supports NZB files, a standardized format that simplifies the retrieval of information from Usenet and streamlines the download process.

- **Extensibility:** Enhance SABnzbd's functionality with additional plugins and integrations, tailoring the application to your specific needs.

## Getting Started

Embark on your Usenet journey with SABnzbd by visiting the [official website](https://sabnzbd.org/) and exploring the comprehensive documentation. Whether you're installing SABnzbd for the first time or upgrading an existing setup, the documentation provides step-by-step guides and configuration details.

## Community and Support

Connect with the SABnzbd community on the [forums](https://forums.sabnzbd.org/) to engage in discussions, seek assistance, and share your experiences. Stay informed about updates, announcements, and community-driven enhancements within the world of SABnzbd.

Experience the simplicity and efficiency of Usenet downloads with SABnzbd—a reliable companion for content retrieval from Usenet newsgroups.


## Volumes

```bash
nfs-nas-swarm/config/autopirate/sabnzbd
/swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  sabnzbd:
    image: lscr.io/linuxserver/sabnzbd:latest
    volumes:
     - /swarm/config/autopirate/sabnzbd:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.sabnzbd-https.middlewares: authelia@docker
        traefik.http.routers.sabnzbd-http.middlewares: https-redirect
        traefik.http.routers.sabnzbd-http.rule: Host(`sabnzbd.vnerd.nl`)
        traefik.http.routers.sabnzbd-https.tls.certresolver: le
        traefik.http.routers.sabnzbd-https.rule: Host(`sabnzbd.vnerd.nl`)
        traefik.http.services.sabnzbd.loadbalancer.server.port: '8080'
        traefik.constraint-label: traefik-public
        traefik.http.routers.sabnzbd-https.tls: 'true'
        traefik.http.routers.sabnzbd-http.entrypoints: http
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.sabnzbd-https.entrypoints: https
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

