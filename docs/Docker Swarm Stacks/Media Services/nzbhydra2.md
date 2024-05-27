---
comments: true
---

# NZBHydra2

Unifying Your Usenet Searches

[NZBHydra2](https://github.com/theotherp/nzbhydra2) is a powerful, open-source application designed to simplify and enhance your Usenet search experience. With a unified interface, NZBHydra2 aggregates search results from multiple Usenet indexers, allowing you to find and download the content you're looking for more efficiently.

## Key Features

- **Multi-Indexer Support:** NZBHydra2 supports integration with various Usenet indexers, consolidating search results from multiple sources in one convenient location.

- **Search Customization:** Fine-tune your searches with advanced filters, categories, and sorting options to quickly locate the content that matches your preferences.

- **Proxy and Authentication:** Ensure privacy and security by configuring proxy support and authentication, adding an extra layer of protection to your Usenet activities.

- **Statistics and History:** Gain insights into your Usenet usage with detailed statistics and search history, allowing you to track trends and optimize your search strategies.

## Getting Started

Explore the [NZBHydra2 GitHub repository](https://github.com/theotherp/nzbhydra2) for installation instructions, configuration details, and additional documentation. Whether you're a Usenet enthusiast or new to the scene, NZBHydra2 provides a user-friendly interface to streamline your searches.

## Community and Support

Connect with the NZBHydra2 community through the [GitHub repository](https://github.com/theotherp/nzbhydra2) to engage in discussions, report issues, and stay informed about updates and enhancements. Join a community of Usenet enthusiasts dedicated to optimizing the search experience.

Enhance your Usenet search capabilities with NZBHydra2—a versatile tool that brings convenience and efficiency to the world of Usenet indexing.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/nzbhydra
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  nzbhydra2:
    image: lscr.io/linuxserver/nzbhydra2:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/nzbhydra:/config
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.nzbhydra2-http.middlewares: https-redirect
        traefik.http.routers.nzbhydra2-https.entrypoints: https
        traefik.http.routers.nzbhydra2-http.rule: Host(`nzbhydra.vnerd.nl`)
        traefik.http.routers.nzbhydra2-https.middlewares: authelia@docker
        traefik.http.routers.nzbhydra2-http.entrypoints: http
        traefik.http.services.nzbhydra2.loadbalancer.server.port: '5076'
        traefik.http.routers.nzbhydra2-https.tls.certresolver: le
        traefik.http.routers.nzbhydra2-https.tls: 'true'
        traefik.constraint-label: traefik-public
        traefik.http.routers.nzbhydra2-https.rule: Host(`nzbhydra.vnerd.nl`)
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

