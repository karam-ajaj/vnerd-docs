---
comments: true
---

# Notifiarr

Unified Notification Aggregator

[Notifiarr](https://github.com/Notifiarr/notifiarr) is a unified notification aggregator designed to centralize and streamline notifications from various sources, such as media servers, download clients, and monitoring systems. With its flexible integration capabilities and customizable alerting mechanisms, Notifiarr provides users with a single platform for receiving, managing, and acting upon notifications, enhancing visibility and control over their digital ecosystem.

## Key Features

- **Multi-Source Integration:** Notifiarr integrates with popular media servers (Plex, Emby, Jellyfin), download clients (Sonarr, Radarr, Lidarr, SABnzbd, NZBGet), monitoring systems (Grafana, InfluxDB, Telegraf), and more, consolidating notifications from disparate sources into a single interface.
- **Customizable Notifications:** Customize notification settings and preferences, including delivery methods (email, Discord, Slack, Telegram), content filters, and escalation rules, to tailor notifications to your specific needs and preferences.
- **Alerting and Escalation:** Set up alerts and escalation policies based on predefined conditions or triggers, ensuring timely notification and action for critical events or anomalies.
- **User-Friendly Interface:** Enjoy a clean and intuitive web-based interface for managing notifications, configuring integrations, and monitoring system health and status.
- **Open-Source and Extensible:** Notifiarr is open-source software, providing transparency, flexibility, and community-driven development for ongoing improvements and enhancements.

## Getting Started

To get started with Notifiarr, deploy the Notifiarr application using Docker or run it locally on your machine. Visit the [official GitHub repository](https://github.com/Notifiarr/notifiarr) for installation instructions, configuration guides, and additional resources. The repository also provides comprehensive documentation to help you set up and customize Notifiarr according to your preferences.

## Community and Support

Join the Notifiarr community on [GitHub](https://github.com/Notifiarr/notifiarr) to engage with other users, share feedback, report issues, and contribute to the project. Stay informed about the latest updates, features, and community-driven enhancements through discussions and announcements.

Centralize and streamline your notifications with Notifiarr—a unified notification aggregator designed to enhance visibility and control over your digital ecosystem.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/notifiarr.yml"
```

## Notes

