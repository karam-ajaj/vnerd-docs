---
comments: true
---

# Swarmprom

Monitoring and Alerting for Docker Swarm Clusters

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[Swarmprom](https://github.com/stefanprodan/swarmprom) is an open-source monitoring and alerting solution designed specifically for Docker Swarm clusters. Built on top of Prometheus, Grafana, and a set of Docker-friendly exporters, Swarmprom provides comprehensive insights into the performance, health, and status of Docker Swarm services and containers, enabling operators to monitor, visualize, and troubleshoot their containerized infrastructure effectively.

## Key Features

- **Prometheus Monitoring:** Swarmprom leverages Prometheus for collecting, storing, and querying time-series metrics from Docker Swarm nodes, services, and containers, enabling real-time monitoring and analysis of cluster performance.
- **Grafana Dashboards:** Swarmprom includes pre-configured Grafana dashboards with built-in visualizations and metrics for monitoring Docker Swarm cluster resources, workloads, and service-level objectives (SLOs).
- **Exporter Integration:** Swarmprom integrates with a range of Docker-friendly exporters, including Node Exporter, cAdvisor, and Docker Swarm Exporter, to collect metrics on system resources, container health, and orchestration insights.
- **Alerting and Notification:** Swarmprom supports alerting and notification mechanisms through Prometheus Alertmanager, allowing operators to define and manage alerts based on predefined thresholds and conditions.
- **Scalability and Extensibility:** Swarmprom is designed for scalability and extensibility, with support for adding custom exporters, dashboards, and alerting rules to meet specific monitoring requirements and use cases.

## Getting Started

To get started with Swarmprom, visit the [GitHub repository](https://github.com/stefanprodan/swarmprom) for installation instructions, configuration guidelines, and documentation. Follow the provided setup guides to deploy Swarmprom on your Docker Swarm cluster and start monitoring your containerized infrastructure with Prometheus and Grafana.

## Community and Support

Join the Swarmprom community on [GitHub](https://github.com/stefanprodan/swarmprom) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Swarmprom monitoring and alerting solution.

Monitor and manage your Docker Swarm clusters with ease using Swarmprom—an open-source monitoring and alerting solution powered by Prometheus and Grafana.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/swarmprom.yml"
```

## Notes

