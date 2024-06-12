---
comments: true
---

# Logspout

Lightweight Log Router for Docker Containers

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Logspout](https://github.com/gliderlabs/logspout) is a lightweight log router designed specifically for Docker containers. It collects logs from all containers running on a Docker host and routes them to various destinations, such as log management systems, storage services, or standard output. With its simplicity and flexibility, Logspout makes it easy to centralize and manage logs from Dockerized applications, enabling efficient monitoring, analysis, and troubleshooting.

## Key Features

- **Container-Aware:** Logspout runs as a container itself and automatically collects logs from all other containers running on the same Docker host, eliminating the need for manual configuration.
- **Plug-and-Play:** Logspout requires minimal setup and configuration, making it easy to integrate with existing Docker environments without disrupting workflows.
- **Flexible Routing:** Route logs to multiple destinations, including syslog servers, HTTP endpoints, file systems, and more, based on simple filtering rules or custom configurations.
- **Real-Time Streaming:** Stream logs in real-time to downstream services, enabling timely analysis and alerting for operational insights and troubleshooting.
- **Open Source:** Logspout is open-source software, providing transparency, extensibility, and community-driven development for ongoing improvements and enhancements.

## Getting Started

To get started with Logspout, deploy the Logspout container on your Docker host using the official Docker image available on [Docker Hub](https://hub.docker.com/r/gliderlabs/logspout). You can customize Logspout's behavior and configure log routing by providing environment variables or custom configuration files.

## Community and Support

Join the Logspout community on [GitHub](https://github.com/gliderlabs/logspout) to engage with other users, report issues, request features, and contribute to the project. Stay informed about the latest updates, enhancements, and best practices through community discussions and announcements.

Simplify log management for your Docker containers with Logspout—a lightweight and flexible log router designed for efficient log collection, routing, and analysis.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/logspout.yml"
```

## Notes

