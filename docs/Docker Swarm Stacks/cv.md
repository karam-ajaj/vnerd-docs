---
comments: true
---

# CV

High-Performance Web Server

[NGINX](https://nginx.org/) stands as a versatile, high-performance web server and reverse proxy server, renowned for its efficiency, scalability, and reliability. Originally developed to address the challenges of handling concurrent connections and delivering static content, NGINX has evolved into a powerful tool for optimizing web server performance and facilitating seamless application delivery.

## Key Features

- **Web Server:** NGINX is widely acclaimed for its role as a robust web server, capable of efficiently serving static content with minimal resource consumption.

- **Reverse Proxy:** NGINX excels as a reverse proxy, seamlessly handling incoming requests, distributing traffic, and load balancing across multiple servers to enhance application performance.

- **Scalability:** Designed to handle a large number of simultaneous connections efficiently, NGINX is an excellent choice for scaling web applications and services.

- **Extensibility:** NGINX supports a rich set of modules, enabling users to extend its functionality and adapt it to a variety of use cases.

## Getting Started

Whether you are setting up a simple static website, deploying a dynamic web application, or optimizing your server stack, NGINX's documentation provides comprehensive guidance for installation, configuration, and optimization.

[NGINX Documentation](https://nginx.org/en/docs/)

## Community and Support

Join the thriving NGINX community to stay updated on the latest developments, seek assistance, and share your experiences with other users.

[NGINX Forum](https://forum.nginx.org/)

Experience the speed, reliability, and versatility of NGINX—a cornerstone in modern web server technology.

## Volumes
```bash
/nfs-nas-swarm/config/CV
/nfs-nas-swarm/data/CV
```

## Deployment
The website was built using Bootstrap and the files resides on the specifide shared location

## Docker swarm file
```yaml
version: '3.7'
services:
  cv:
    image: nginx:latest
    environment:
      PGID: '1000'
      PUID: '1000'
    volumes:
     - /nfs-nas-swarm/data/CV:/usr/share/nginx/html
    networks:
     - traefik-public
    logging:
      driver: json-file
    deploy:
      replicas: 3
      labels:
        traefik.http.routers.cv-http.middlewares: https-redirect
        traefik.http.routers.cv-http.rule: Host(`cv.vnerd.nl`)
        traefik.http.services.cv.loadbalancer.server.port: '80'
        traefik.http.routers.cv-https.tls: 'true'
        traefik.http.routers.cv-https.tls.certresolver: le
        traefik.constraint-label: traefik-public
        traefik.http.routers.cv-https.rule: Host(`cv.vnerd.nl`)
        traefik.docker.network: traefik-public
        traefik.enable: 'true'
        traefik.http.routers.cv-https.entrypoints: https
        traefik.http.routers.cv-http.entrypoints: http
      placement:
        constraints:
         - node.labels.Arch==i686
networks:
  traefik-public:
    external: true
```

## Note
A redirect rule was added to cloudflarte to redirect to vnerd, otherwise it didnt work, should investigate!
