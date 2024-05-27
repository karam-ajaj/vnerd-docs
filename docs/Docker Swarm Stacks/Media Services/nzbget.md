---
comments: true
---

# NZBGet

Efficient Usenet Downloader

[NZBGet](https://nzbget.net/) is a lightweight, efficient, and open-source Usenet downloader designed to simplify and optimize the process of acquiring content from Usenet newsgroups. With its speed, resource efficiency, and feature-rich capabilities, NZBGet stands as a popular choice among users seeking a reliable Usenet downloading solution.

## Key Features

- **Speed and Efficiency:** NZBGet is renowned for its exceptional download speed and low system resource usage, making it an ideal choice for both low-powered devices and high-performance systems.

- **Multi-Platform Support:** NZBGet is compatible with various platforms, including Windows, macOS, Linux, and NAS devices, ensuring flexibility and accessibility for users across different environments.

- **Web Interface:** The user-friendly web interface provides a convenient way to manage and monitor downloads, offering control over settings, queue management, and historical data.

- **Automation:** NZBGet supports automation through post-processing scripts, making it easy to integrate with other applications and services in your media management stack.

## Getting Started

Embark on your Usenet downloading journey with NZBGet by exploring the official [NZBGet website](https://nzbget.net/) for downloads, documentation, and installation guides. Whether you're a beginner or an advanced user, NZBGet caters to a wide range of expertise levels.

## Community and Support

Join the NZBGet community on [GitHub](https://github.com/nzbget/nzbget) to engage with other users, access support forums, and stay informed about updates and improvements. The active community ensures ongoing development and collaborative support.

Experience the speed and efficiency of NZBGet—a versatile Usenet downloader crafted for seamless content acquisition.


## Volumes

```bash
/nfs-nas-swarm/config/autopirate/nzbget
/nfs-nas-swarm/data/autopirate/data
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  nzbget:
    image: lscr.io/linuxserver/nzbget:latest
    volumes:
     - /nfs-nas-swarm/config/autopirate/nzbget:/config
     - /nfs-nas-swarm/data/autopirate/data:/data
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.routers.nzbget-https.rule: Host(`nzbget.vnerd.nl`)
        traefik.http.routers.nzbget-https.middlewares: authelia@docker
        traefik.http.routers.nzbget-http.rule: Host(`nzbget.vnerd.nl`)
        traefik.http.routers.nzbget-https.tls: 'true'
        traefik.http.routers.nzbget-http.middlewares: https-redirect
        traefik.http.routers.nzbget-https.tls.certresolver: le
        traefik.constraint-label: traefik-public
        traefik.http.routers.nzbget-https.entrypoints: https
        traefik.http.routers.nzbget-http.entrypoints: http
        traefik.http.services.nzbget.loadbalancer.server.port: '6789'
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

