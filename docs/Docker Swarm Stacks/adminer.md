---
comments: true
---

# Adminer

A Lightweight Database Management Tool

[Adminer](https://www.adminer.org/) is a powerful, lightweight, and user-friendly database management tool designed to simplify the management of databases. Developed as a single-file PHP application, Adminer offers a comprehensive feature set that rivals more complex database management solutions, making it an ideal choice for developers, database administrators, and webmasters.

## Key Features

- **Single-File Deployment:** Adminer's single PHP file setup ensures a quick and straightforward deployment process, minimizing configuration hassles.
- **Multi-Database Support:** Adminer supports a wide range of databases, including MySQL, PostgreSQL, SQLite, MS SQL, Oracle, and others, providing versatility for different database environments.
- **User-Friendly Interface:** The intuitive and clean interface makes database management tasks such as querying, editing, and exporting data simple and efficient.
- **Comprehensive Functionality:** Adminer includes features like data import/export, table management, user management, and SQL query execution, covering all essential database operations.
- **Security:** With built-in security features, Adminer ensures safe and secure access to your databases.

## Getting Started

To get started with Adminer, download the single PHP file from the [official website](https://www.adminer.org/) and upload it to your server. Accessing the file via your web browser will bring you to the Adminer login page, where you can connect to your database.

## Community and Support

Join the Adminer community through the [official GitHub repository](https://github.com/vrana/adminer) to engage with other users, report issues, and contribute to the project. Stay updated on the latest features and improvements by following the development and participating in community discussions.

Experience the simplicity and power of database management with Adminer—a tool designed to make managing your databases easier than ever.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/adminer.yml"
```

## Notes

