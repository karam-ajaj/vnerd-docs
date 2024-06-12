---
comments: true
---

# Traefik v3

Modern Edge Router and Load Balancer

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Traefik v3](https://traefik.io/) is a modern edge router and load balancer designed for microservices architectures and containerized environments. As a cloud-native application proxy, Traefik v3 provides dynamic routing, traffic management, and TLS termination for applications running on Kubernetes, Docker, and other container orchestration platforms.

## Key Features

- **Dynamic Configuration:** Traefik v3 supports dynamic configuration and automatic service discovery for containerized applications, enabling seamless integration with container orchestration platforms like Kubernetes and Docker Swarm.
- **Automatic TLS:** Traefik v3 provides automatic TLS certificate generation and management through integration with Let's Encrypt, allowing users to secure their applications with HTTPS encryption without manual certificate management.
- **Service Mesh Integration:** Traefik v3 integrates with service mesh technologies like Istio and Linkerd, enabling advanced traffic management, observability, and security features for microservices deployments.
- **Web Application Firewall (WAF):** Traefik v3 includes built-in support for web application firewall (WAF) capabilities, allowing users to define and enforce security policies to protect their applications from common web-based attacks.
- **Dashboard and Metrics:** Traefik v3 offers a web-based dashboard and metrics endpoint for monitoring and visualizing traffic metrics, request rates, and error rates, providing insights into application performance and health.

## Getting Started

To get started with Traefik v3, visit the [official website](https://traefik.io/) to download and install the software, or deploy it using containerization tools like Docker Compose or Kubernetes. Follow the provided documentation and setup guides to configure Traefik v3 for your environment and integrate it with your applications.

## Community and Support

Join the Traefik v3 community on [GitHub](https://github.com/traefik/traefik) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Traefik v3 edge router and load balancer.

Enhance your microservices architecture with Traefik v3—a cloud-native edge router and load balancer designed for modern containerized environments.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/traefikv3.yml"
```

## Notes

