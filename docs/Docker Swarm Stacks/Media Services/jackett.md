---
comments: true
---

# Jackett

Your Universal Torrent Search Tool

[Jackett](https://github.com/Jackett/Jackett) stands as a versatile and open-source application, serving as a universal torrent search tool. With Jackett, you can consolidate and streamline your torrent searches by providing a unified interface to a multitude of torrent trackers. This ensures a seamless experience in finding and managing your favorite content without the need to visit multiple websites.

## Key Features of Jackett

- **Unified Search:** Jackett acts as a bridge between your favorite torrent clients and a wide range of torrent trackers, offering a single point of search for diverse content.

- **Extensive Compatibility:** Jackett supports integration with numerous private and public torrent trackers, enhancing the scope and availability of your search results.

- **Customization:** Tailor your Jackett experience by configuring your preferred torrent trackers and optimizing search parameters for a personalized torrent search engine.

- **API Support:** Leverage the Jackett API to integrate seamlessly with automation tools, allowing for automated searches and content retrieval.

## Getting Started with Jackett

Embark on your journey with Jackett by exploring the [official GitHub repository](https://github.com/Jackett/Jackett). The repository provides detailed documentation, installation guides, and configuration tips to ensure a smooth setup.

## Community and Support

Connect with the Jackett community on the [official forums](https://discuss.jackett.io/) to engage in discussions, seek assistance, and stay informed about updates. Join a community of torrent enthusiasts and automation aficionados who appreciate the convenience and power of Jackett.

Experience the efficiency and simplicity of Jackett—a universal torrent search tool designed to enhance your content discovery process.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/jackett
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  jackett:
    image: lscr.io/linuxserver/jackett:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/jackett:/config
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.jackett-http.entrypoints: http
        traefik.http.routers.jackett-https.middlewares: authelia@docker
        traefik.http.routers.jackett-https.rule: Host(`jackett.vnerd.nl`)
        traefik.http.services.jackett.loadbalancer.server.port: '9117'
        traefik.constraint-label: traefik-public
        traefik.http.routers.jackett-http.rule: Host(`jackett.vnerd.nl`)
        traefik.http.routers.jackett-http.middlewares: https-redirect
        traefik.http.routers.jackett-https.entrypoints: https
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.jackett-https.tls: 'true'
        traefik.http.routers.jackett-https.tls.certresolver: le
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

