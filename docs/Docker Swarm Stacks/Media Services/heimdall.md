---
comments: true
---

# Heimdall

Unified Dashboard for Simplified Web Services Access

[Heimdall](https://heimdall.site/) emerges as a powerful and open-source dashboard solution designed to streamline access to your web services. With a user-friendly interface and customizable features, Heimdall consolidates your favorite web applications, services, and tools into a single, unified dashboard for effortless navigation.

## Key Features

- **Centralized Access:** Heimdall acts as a centralized hub, allowing users to organize and access various web applications and services from a single, intuitive dashboard.

- **Customization:** Tailor your dashboard to suit your preferences by adding, rearranging, and categorizing your favorite applications. Personalize your workspace for optimal efficiency.

- **Security:** Secure your dashboard with authentication measures, ensuring that only authorized users can access your collection of web services.

- **Quick Deployment:** Heimdall's simplicity extends to its deployment process, allowing users to set up their personalized dashboards swiftly.

## Getting Started

Embark on your journey with Heimdall by exploring the official [Heimdall website](https://heimdall.site/) for documentation, installation guides, and configuration details. Whether you are a casual user or a tech enthusiast, Heimdall caters to a broad audience with its straightforward setup.

## Community and Support

Connect with the Heimdall community on platforms such as [GitHub](https://github.com/linuxserver/Heimdall) to engage in discussions, share ideas, and seek assistance. Join a community of users passionate about simplifying web service access and enhancing the dashboard experience.

Experience the convenience and efficiency of Heimdall—a unified dashboard solution that puts your web services at your fingertips.


## Volumes

```bash
/swarm/config/autopirate/heimdall
```

## Deployment
No Special requirments

## Docker swarm file
```yaml
version: '3.3'
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall:latest
    environment:
      PGID: '911'
      PUID: '911'
    volumes:
     - /swarm/config/autopirate/heimdall:/config
     - /etc/localtime:/etc/localtime:ro
    networks:
     - autopirate-network
     - traefik-public
    logging:
      driver: json-file
    deploy:
      labels:
        traefik.http.services.heimdall.loadbalancer.server.port: '80'
        traefik.http.routers.heimdall-https.entrypoints: https
        traefik.http.routers.heimdall-https.tls.certresolver: le
        traefik.http.routers.heimdall-http.middlewares: https-redirect
        traefik.http.routers.heimdall-https.rule: Host(`heimdall.vnerd.nl`)
        traefik.constraint-label: traefik-public
        traefik.http.routers.heimdall-https.tls: 'true'
        traefik.http.routers.heimdall-http.entrypoints: http
        traefik.http.routers.heimdall-http.rule: Host(`heimdall.vnerd.nl`)
        traefik.http.routers.heimdall-https.middlewares: https-redirect
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

