---
comments: true
---

# Tautulli

Monitoring and Analytics for Plex Media Server

![tautulli diagram](/assets/diagrams/tautulli.png){ loading=lazy }

[Tautulli](https://tautulli.com/) is a powerful open-source monitoring and analytics platform designed for Plex Media Server users. With Tautulli, Plex enthusiasts can gain insights into their media consumption habits, track server activity, and analyze usage patterns, enabling them to optimize their Plex experience and enhance their media streaming environment.

## Key Features

- **Server Monitoring:** Tautulli provides detailed statistics and metrics on Plex Media Server usage, including playback history, library statistics, user activity, and device usage.
- **User Analytics:** Tautulli offers user-level analytics, allowing Plex users to track individual viewing habits, preferences, and playback behavior across different devices.
- **Notification System:** Tautulli features a flexible notification system that can alert users to new media additions, playback events, server status changes, and other relevant events via email, SMS, or push notifications.
- **Customization and Extensibility:** Tautulli is highly customizable and extensible, with support for custom scripts, plugins, and integrations, enabling users to tailor the platform to their specific needs and workflows.
- **Integration with External Services:** Tautulli integrates with external services such as Trakt.tv and IMDb, allowing users to enrich their media library with additional metadata and personalized recommendations.

## Getting Started

To get started with Tautulli, visit the [official website](https://tautulli.com/) to download and install the software on your server. Follow the provided installation instructions and configure Tautulli to connect to your Plex Media Server instance. Once set up, you can access the Tautulli web interface to start monitoring and analyzing your Plex usage data.

## Community and Support

Join the Tautulli community on [GitHub](https://github.com/Tautulli/Tautulli) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Tautulli monitoring and analytics platform.

Gain valuable insights into your Plex Media Server usage with Tautulli—a feature-rich monitoring and analytics solution for Plex enthusiasts.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/tautulli.yml"
```

## Notes

