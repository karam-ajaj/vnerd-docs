---
comments: true
---

# ruTorrent

Your Lightweight and Feature-Packed BitTorrent Client

[ruTorrent](https://github.com/Novik/ruTorrent) stands as a popular and lightweight web-based front-end for the rTorrent BitTorrent client. Offering a user-friendly interface, extensive features, and efficient resource usage, ruTorrent has become a preferred choice for managing torrents on remote servers.

## Key Features of ruTorrent

- **Web-Based Interface:** Access and control your rTorrent client from anywhere with ruTorrent's intuitive web-based interface.

- **Comprehensive Torrent Management:** Enjoy a rich set of features, including torrent creation, management, monitoring, and detailed information about your downloads.

- **Plug-in Support:** Extend the functionality of ruTorrent with a variety of plugins, allowing for customization and additional features tailored to your preferences.

- **Performance and Resource Efficiency:** Designed with efficiency in mind, ruTorrent ensures optimal performance and minimal resource usage, making it suitable for both powerful servers and resource-constrained environments.

## Getting Started

Getting started with ruTorrent is straightforward. Deploy the web-based client on your server and connect it to your rTorrent instance. Detailed installation instructions and configuration options can be found on the [ruTorrent GitHub repository](https://github.com/Novik/ruTorrent).

## Community and Support

Join the active ruTorrent community to connect with other users, share insights, and seek assistance. The [ruTorrent GitHub repository](https://github.com/Novik/ruTorrent) serves as a hub for discussions, bug reports, and collaborative development.

Experience the convenience and efficiency of managing your BitTorrent downloads with ruTorrent—a versatile and user-friendly interface for the powerful rTorrent client.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/rutorrent
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  rutorrent:
    image: lscr.io/linuxserver/rutorrent:latest
    ports:
     - 36258:36258
    volumes:
     - /nfs-nas-swarm/config/autopirate/rutorrent:/config
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.rutorrent-https.entrypoints: https
        traefik.http.routers.rutorrent-http.entrypoints: http
        traefik.http.routers.rutorrent-http.middlewares: https-redirect
        traefik.http.routers.rutorrent-https.middlewares: authelia@docker
        traefik.http.services.rutorrent.loadbalancer.server.port: '80'
        traefik.http.routers.rutorrent-https.rule: Host(`rutorrent.vnerd.nl`)
        traefik.constraint-label: traefik-public
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.rutorrent-http.rule: Host(`rutorrent.vnerd.nl`)
        traefik.http.routers.rutorrent-https.tls.certresolver: le
        traefik.http.routers.rutorrent-https.tls: 'true'
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

