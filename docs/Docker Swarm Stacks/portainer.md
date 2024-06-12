---
comments: true
---

# Portainer

Simplified Container Management

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Portainer](https://www.portainer.io/) is an open-source container management platform designed to simplify the deployment, management, and monitoring of containerized applications and environments. With its intuitive interface, rich feature set, and support for multiple container runtimes, Portainer provides users with a powerful toolset for managing containerized workloads across various deployment scenarios.

## Key Features

- **User-Friendly Interface:** Portainer offers a clean and intuitive web-based interface for managing containers, images, volumes, networks, and other Docker or Kubernetes resources.
- **Deployment Orchestration:** Portainer supports deployment and orchestration of containerized applications using Docker Swarm, Kubernetes, and other container orchestration platforms.
- **Container Lifecycle Management:** Portainer enables users to create, start, stop, restart, and delete containers with ease, as well as monitor container health and resource usage.
- **Image Management:** Portainer allows users to search, pull, push, and manage Docker images from public or private registries, facilitating streamlined image management and distribution.
- **Access Control and Authentication:** Portainer offers role-based access control (RBAC) and LDAP/AD integration for user authentication and authorization, ensuring secure access to container management functionalities.

## Getting Started

To get started with Portainer, deploy the Portainer container using Docker or Kubernetes, or install it directly on your host machine. Visit the [official website](https://www.portainer.io/) for installation instructions, documentation, and resources. The website provides comprehensive guides and tutorials to help you set up and configure Portainer for your container environment.

## Community and Support

Join the Portainer community on [GitHub](https://github.com/portainer/portainer) to engage with other users, ask questions, share your experiences, and contribute to the project. Stay informed about the latest updates, features, and best practices through community discussions and announcements.

Simplify container management and orchestration with Portainer—an intuitive and feature-rich platform for managing containerized applications and environments.


## Volumes

```bash
/nfs-nas-swarm/data/portainer
```

## Deployment
PORTAINER_LICENSE_KEY should be added.

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/portainer.yml"
```

## Notes

