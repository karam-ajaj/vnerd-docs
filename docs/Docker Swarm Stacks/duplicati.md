---
comments: true
---

# Duplicati

Open-Source Cloud Backup Software

![duplicati diagram](/assets/diagrams/duplicati.png){ loading=lazy }

[Duplicati](https://www.duplicati.com/) is a powerful and versatile open-source backup solution designed to protect your data by creating encrypted backups that can be stored on various cloud storage providers or local storage devices. With its user-friendly interface and advanced features, Duplicati offers a comprehensive backup solution for both personal and professional use cases.

## Key Features

- **Flexible Backup Options:** Duplicati supports a wide range of backup destinations, including cloud storage providers like Amazon S3, Google Drive, and Dropbox, as well as local storage devices and network shares.
- **Encryption and Security:** Ensure the security of your backups with built-in encryption algorithms that protect your data both in transit and at rest.
- **Incremental and Differential Backups:** Duplicati employs advanced backup strategies, including incremental and differential backups, to optimize storage space and minimize backup times.
- **Automated Scheduling:** Schedule automated backup tasks to run at specified intervals, ensuring your data is backed up regularly without manual intervention.
- **Cross-Platform Compatibility:** Duplicati is compatible with Windows, macOS, and Linux operating systems, providing flexibility and consistency across different platforms.

## Getting Started

To get started with Duplicati, download and install the application from the [official website](https://www.duplicati.com/). The website also offers comprehensive documentation and user guides to help you configure and manage your backups effectively.

## Community and Support

Join the Duplicati community on [GitHub](https://github.com/duplicati/duplicati) to engage with other users, report issues, request features, and contribute to the project. Stay informed about the latest updates, enhancements, and community-driven plugins.

Protect your valuable data with Duplicati—a reliable and feature-rich backup solution designed to safeguard your digital assets.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/duplicati.yml"
```

## Notes

