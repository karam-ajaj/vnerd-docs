---
comments: true
---

# Readarr

Transforming Your Literary Collection Experience

[Readarr](https://readarr.com/) is a powerful and open-source application designed to revolutionize the management of your literary collection. Whether you're an avid reader or a book enthusiast, Readarr simplifies the process of cataloging, organizing, and discovering your favorite books in a seamless and automated manner.

## Key Features of Readarr

- **Automated Cataloging:** Readarr automates the retrieval of book details, covers, and other metadata, ensuring your literary collection is organized and enriched effortlessly.

- **Flexible Searching:** With a robust search engine, Readarr enables you to discover new books and editions based on various criteria, making it easy to expand your reading list.

- **Customizable Libraries:** Tailor your library to your preferences with customizable folders, allowing you to categorize books based on genres, authors, or any other criteria.

- **Cross-Platform Compatibility:** Readarr is designed to work on various platforms, providing a consistent experience whether you're running it on Windows, macOS, or Linux.

## Getting Started

Embark on your literary journey with Readarr by visiting the [official Readarr website](https://readarr.com/) and exploring the installation guides and documentation. Whether you're new to book management or a seasoned librarian, Readarr offers an intuitive interface and user-friendly setup.

## Community and Support

Connect with fellow book enthusiasts and the Readarr community on the [official forums](https://forums.readarr.com/) to share your experiences, seek advice, and stay informed about updates. Join the conversation and be part of a community dedicated to enhancing the reading experience with Readarr.

Discover the joy of managing your literary collection effortlessly with Readarr—an application that combines functionality with a passion for literature.


## Volumes

```bash
/swarm/config/autopirate/readarr
/swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  readarr:
    image: lscr.io/linuxserver/readarr:nightly
    volumes:
     - /swarm/config/autopirate/readarr:/config
     - /swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.readarr-https.middlewares: authelia@docker
        traefik.http.routers.readarr-http.rule: Host(`readarr.vnerd.nl`)
        traefik.http.services.readarr.loadbalancer.server.port: '8787'
        traefik.http.routers.readarr-http.middlewares: https-redirect
        traefik.http.routers.readarr-https.tls: 'true'
        traefik.http.routers.readarr-https.rule: Host(`readarr.vnerd.nl`)
        traefik.http.routers.readarr-https.entrypoints: https
        traefik.http.routers.readarr-https.tls.certresolver: le
        traefik.constraint-label: traefik-public
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.readarr-http.entrypoints: http
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

