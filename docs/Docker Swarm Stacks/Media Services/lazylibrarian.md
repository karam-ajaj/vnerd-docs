---
comments: true
---

# LazyLibrarian

Your Effortless Book Manager

[LazyLibrarian](https://github.com/DobyTang/LazyLibrarian) is an open-source application designed to simplify and automate the management of your digital book collection. Developed by [DobyTang](https://github.com/DobyTang), LazyLibrarian is a versatile tool that combines the power of automation with an intuitive user interface, making it easier than ever to discover, download, and organize your favorite books.

## Key Features

- **Automated Book Search:** LazyLibrarian autonomously searches for and downloads books based on your preferences, ensuring your collection stays up-to-date effortlessly.

- **Integration with Multiple Sources:** It seamlessly integrates with various sources, including popular book providers and trackers, to provide a wide range of options for discovering new books.

- **Metadata Management:** LazyLibrarian excels in managing book metadata, ensuring that your collection is organized, complete, and enriched with relevant information.

- **User-Friendly Interface:** With an intuitive web-based interface, LazyLibrarian offers a hassle-free user experience for configuring preferences, monitoring downloads, and exploring your book library.

## Getting Started

Embark on your journey of automated book management by exploring the [LazyLibrarian GitHub repository](https://github.com/DobyTang/LazyLibrarian). The repository provides comprehensive documentation, installation guides, and configuration details to get you started.

## Community and Support

Join the LazyLibrarian community on [GitHub](https://github.com/DobyTang/LazyLibrarian) to engage in discussions, share tips, and seek assistance. Connect with fellow book enthusiasts and contribute to the development of this remarkable tool.

Discover the joy of maintaining a well-organized digital bookshelf with LazyLibrarian—a perfect companion for book lovers who value simplicity and automation.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/lazylibrarian
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  lazylibrarian:
    image: lscr.io/linuxserver/lazylibrarian:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/lazylibrarian:/config
     - /nfs-nas-swarm/data/autopirate/data:/books
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.lazylibrarian-http.rule: Host(`lazylibrarian.vnerd.nl`)
        traefik.http.services.lazylibrarian.loadbalancer.server.port: '5299'
        traefik.http.routers.lazylibrarian-https.rule: Host(`lazylibrarian.vnerd.nl`)
        traefik.http.routers.lazylibrarian-http.entrypoints: http
        traefik.http.routers.lazylibrarian-https.entrypoints: https
        traefik.http.routers.lazylibrarian-https.tls: 'true'
        traefik.http.routers.lazylibrarian-http.middlewares: https-redirect
        traefik.constraint-label: traefik-public
        traefik.http.routers.lazylibrarian-https.tls.certresolver: le
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.lazylibrarian-https.middlewares: authelia@docker
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

