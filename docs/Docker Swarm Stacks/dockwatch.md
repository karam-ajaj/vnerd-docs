---
comments: true
---

# Dockwatch

Simplified Docker Container Monitoring

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Dockwatch](https://github.com/sourcefuse/dockwatch) is an intuitive and open-source monitoring tool designed to simplify the management and oversight of Docker containers. By providing real-time insights into container performance and health, Dockwatch helps developers and system administrators ensure their containerized applications are running smoothly and efficiently.

## Key Features

- **Real-Time Monitoring:** Track the performance and health of your Docker containers in real-time, ensuring immediate awareness of any issues.
- **User-Friendly Dashboard:** Enjoy a clean and intuitive web-based dashboard that provides an overview of your container ecosystem at a glance.
- **Detailed Metrics:** Access comprehensive metrics, including CPU, memory usage, network activity, and more, to understand the resource consumption of each container.
- **Alerts and Notifications:** Configure alerts to receive notifications about critical events or performance anomalies, enabling proactive management.
- **Open Source:** As an open-source tool, Dockwatch offers transparency, flexibility, and the ability to contribute to its development.

## Getting Started

To get started with Dockwatch, visit the [official GitHub repository](https://github.com/sourcefuse/dockwatch) for installation instructions, configuration guides, and additional resources. The repository provides detailed documentation to help you set up and customize Dockwatch according to your monitoring needs.

## Community and Support

Join the Dockwatch community on [GitHub](https://github.com/sourcefuse/dockwatch) to engage with other users, share feedback, and contribute to the project. Stay updated on the latest features, improvements, and community-driven enhancements.

Ensure optimal performance and reliability of your Docker containers with Dockwatch—a powerful tool for simplified container monitoring.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/dockwatch.yml"
```

## Notes

