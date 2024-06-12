---
comments: true
---

# CloudBeaver

Web-Based Database Management

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[CloudBeaver](https://github.com/dbeaver/cloudbeaver) is a powerful, open-source web-based database management tool that provides a convenient way to manage databases from any browser. Developed by the team behind DBeaver, CloudBeaver combines robust database management capabilities with the flexibility and accessibility of a web application, making it an ideal solution for both individual developers and enterprise teams.

## Key Features

- **Web-Based Interface:** Access and manage your databases from any device with a web browser, eliminating the need for local installations.
- **Multi-Database Support:** CloudBeaver supports a wide range of databases, including MySQL, PostgreSQL, Oracle, SQL Server, and many others, providing versatility for different database environments.
- **Collaborative Environment:** Enable team collaboration with shared access to database connections, queries, and results, enhancing productivity and teamwork.
- **Security and Permissions:** Implement robust security measures with user authentication, role-based access control, and detailed permission settings to safeguard your data.
- **Customizable and Extensible:** Tailor CloudBeaver to meet your specific needs with custom plugins, themes, and configurations.

## Getting Started

To get started with CloudBeaver, visit the [official GitHub repository](https://github.com/dbeaver/cloudbeaver) for installation instructions, configuration guides, and additional resources. The documentation provides comprehensive details to help you deploy CloudBeaver on your server or cloud environment.

## Community and Support

Join the CloudBeaver community on [GitHub](https://github.com/dbeaver/cloudbeaver) to engage with other users, share feedback, and contribute to the project. Stay updated with the latest features, improvements, and community-driven enhancements.

Experience the ease and efficiency of web-based database management with CloudBeaver—a tool designed to make database administration more accessible and collaborative.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/cloudbeaver.yml"
```

## Notes

