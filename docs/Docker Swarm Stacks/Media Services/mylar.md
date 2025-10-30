---
comments: true
---

# Mylar

Automated Comic Book Management

[Mylar](https://github.com/mylar3/mylar3) is an open-source project designed to simplify and automate the management of your comic book collection. This versatile application ensures that your digital comic library is organized, up-to-date, and easily accessible. Whether you're a seasoned comic book enthusiast or just getting started, Mylar streamlines the process of cataloging, downloading, and maintaining your favorite comic series.

## Key Features of Mylar

- **Automated Downloading:** Mylar integrates with various comic book providers and Usenet services, automating the process of fetching and updating your comic collection.

- **Metadata and Organization:** Mylar enriches your comic library by automatically fetching metadata, covers, and additional information, ensuring a visually appealing and well-organized collection.

- **Notification System:** Stay informed about new releases and updates with Mylar's built-in notification system, keeping you up-to-date with the latest issues from your favorite series.

- **Cross-Platform Compatibility:** Mylar supports various operating systems, making it accessible and functional across a range of platforms.

## Getting Started

Explore the [Mylar GitHub repository](https://github.com/mylar3/mylar3) for detailed installation instructions, configuration guides, and additional resources to kickstart your journey with automated comic book management.

## Community and Support

Connect with the Mylar community on the [official forums](https://forums.sabr.net/forums/163-Mylar) to engage in discussions, seek assistance, and share your experiences. Join a vibrant community of comic enthusiasts who appreciate the convenience and automation that Mylar brings to comic book management.

Experience the ease and efficiency of managing your digital comic collection with Mylar—a tool crafted for comic enthusiasts, by comic enthusiasts.


## Volumes

```bash
/swarm/config/autopirate/mylar
/swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  mylar:
    image: lscr.io/linuxserver/mylar3:latest
    volumes:
     - /swarm/config/autopirate/mylar:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.mylar-http.middlewares: https-redirect
        traefik.http.routers.mylar-https.tls: 'true'
        traefik.http.routers.mylar-http.rule: Host(`mylar.vnerd.nl`)
        traefik.http.routers.mylar-https.middlewares: authelia@docker
        traefik.http.routers.mylar-https.rule: Host(`mylar.vnerd.nl`)
        traefik.http.routers.mylar-https.tls.certresolver: le
        traefik.http.routers.mylar-http.entrypoints: http
        traefik.http.services.mylar.loadbalancer.server.port: '8090'
        traefik.constraint-label: traefik-public
        traefik.http.routers.mylar-https.entrypoints: https
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

