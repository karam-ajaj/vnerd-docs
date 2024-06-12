---
comments: true
---

# LibreNMS

Open-Source Network Monitoring and Management

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[LibreNMS](https://www.librenms.org/) is a powerful and flexible open-source network monitoring and management platform designed to monitor network devices and servers in real-time. With its intuitive interface, extensive feature set, and active community support, LibreNMS provides a comprehensive solution for monitoring the health, performance, and availability of your network infrastructure.

## Key Features

- **Auto-Discovery:** Automatically discover and monitor network devices and servers on your network, simplifying the initial setup process.
- **Real-Time Monitoring:** Monitor network performance metrics, including bandwidth usage, CPU, memory, and disk space, in real-time, enabling proactive management and troubleshooting.
- **Alerting and Notifications:** Set up customizable alerts to notify you of critical events or performance anomalies via various channels, such as email, SMS, or Slack.
- **Historical Data:** Store and analyze historical performance data to identify trends, patterns, and potential issues over time.
- **Extensible and Customizable:** Extend LibreNMS's functionality with plugins and integrations, or customize dashboards and reports to suit your specific monitoring needs.

## Getting Started

To get started with LibreNMS, visit the [official website](https://www.librenms.org/) for installation instructions, configuration guides, and additional resources. The website provides comprehensive documentation and tutorials to help you deploy and configure LibreNMS for your network environment.

## Community and Support

Join the LibreNMS community on the [official forums](https://community.librenms.org/) to engage with other users, ask questions, share your experiences, and contribute to the project. Stay informed about the latest updates, features, and best practices through community discussions and announcements.

Monitor your network with confidence using LibreNMS—a flexible and scalable network monitoring solution for maintaining the health and performance of your network infrastructure.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/librenms.yml"
```

## Notes

