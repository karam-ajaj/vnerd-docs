---
comments: true
---

# Ombi

Simplifying Media Requests

[Ombi](https://ombi.io/) is a user-friendly, open-source application that simplifies the process of requesting and managing media content within your server. Aimed at enhancing the user experience in Plex, Emby, and other media server environments, Ombi empowers users to request their favorite movies, TV shows, and music, creating a streamlined system for administrators to fulfill those requests.

## Key Features

- **User Requests:** Ombi enables users to submit requests for movies, TV shows, and music directly through a simple and intuitive interface.

- **Integration:** Seamlessly integrates with popular media servers such as Plex and Emby, allowing administrators to monitor and fulfill requests efficiently.

- **Automated Notifications:** Keeps users informed about the status of their requests through automated notifications, enhancing communication between administrators and users.

- **Customization:** Administrators have the flexibility to customize Ombi to suit the specific needs and preferences of their media server environment.

## Getting Started

Getting started with Ombi is a straightforward process. Explore the [official Ombi website](https://ombi.io/) for installation guides, documentation, and community resources.

## Community and Support

Connect with the Ombi community through the [official forums](https://community.ombi.io/), where users share experiences, seek assistance, and stay updated on the latest developments. Ombi's active community fosters collaboration and support among users and developers.

Enhance your media server experience by incorporating Ombi—a powerful and user-friendly tool for managing media requests.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/ombi
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  ombi:
    image: lscr.io/linuxserver/ombi:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/ombi:/config
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.services.ombi.loadbalancer.server.port: '3579'
        traefik.http.routers.ombi-https.middlewares: authelia@docker
        traefik.http.routers.ombi-http.rule: Host(`ombi.vnerd.nl`)
        traefik.http.routers.ombi-https.rule: Host(`ombi.vnerd.nl`)
        traefik.http.routers.ombi-https.entrypoints: https
        traefik.http.routers.ombi-https.tls: 'true'
        traefik.http.routers.ombi-http.middlewares: https-redirect
        traefik.constraint-label: traefik-public
        traefik.http.routers.ombi-http.entrypoints: http
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.ombi-https.tls.certresolver: le
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

