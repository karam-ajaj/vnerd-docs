---
comments: true
---

# Prowlarr

Unifying Your Usenet and Torrent Search

[Prowlarr](https://prowlarr.com/) emerges as a versatile and open-source application that unifies Usenet and torrent searches, providing a seamless experience for content enthusiasts. With its user-friendly interface and powerful search capabilities, Prowlarr simplifies the process of managing your preferred content sources.

## Key Features of Prowlarr

- **Unified Search:** Prowlarr combines Usenet and torrent searches into a single interface, allowing users to effortlessly discover and manage content from both worlds.

- **Customizable Indexers:** Enjoy the flexibility of configuring your preferred Usenet and torrent indexers, ensuring Prowlarr aligns with your content preferences.

- **Automation and Integration:** Prowlarr seamlessly integrates with popular download managers like Sonarr, Radarr, and Lidarr, automating the retrieval and organization of your media collection.

- **User-Friendly Interface:** With an intuitive and responsive web interface, Prowlarr ensures a straightforward and enjoyable user experience.

## Getting Started

Embark on your Prowlarr journey by exploring the [official website](https://prowlarr.com/) and accessing the detailed documentation. The guides provide step-by-step instructions for installation, configuration, and optimization.

## Community and Support

Connect with the Prowlarr community on [GitHub](https://github.com/Prowlarr/Prowlarr) to engage in discussions, seek assistance, and stay informed about updates and enhancements. Join a thriving community of content enthusiasts committed to simplifying the search and management of Usenet and torrent content.

Experience the convenience of Prowlarr—a unifying solution for enthusiasts who prefer the best of both Usenet and torrent worlds.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/prowlarr
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  prowlarr:
    image: lscr.io/linuxserver/prowlarr:nightly
    volumes:
     - /nfs-nas-swarm/config/autopirate/prowlarr:/config
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.prowlarr-https.middlewares: authelia@docker
        traefik.http.routers.prowlarr-https.tls: 'true'
        traefik.http.routers.prowlarr-https.tls.certresolver: le
        traefik.http.routers.prowlarr-http.middlewares: https-redirect
        traefik.http.routers.prowlarr-http.rule: Host(`prowlarr.vnerd.nl`)
        traefik.http.routers.prowlarr-http.entrypoints: http
        traefik.http.routers.prowlarr-https.entrypoints: https
        traefik.http.services.prowlarr.loadbalancer.server.port: '9696'
        traefik.constraint-label: traefik-public
        traefik.http.routers.prowlarr-https.rule: Host(`prowlarr.vnerd.nl`)
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

