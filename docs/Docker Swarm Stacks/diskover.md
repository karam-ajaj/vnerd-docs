---
comments: true
---

# Diskover

Intelligent Data Management and Analytics

![diskover diagram](/assets/diagrams/diskover.png){ loading=lazy }

[Diskover](https://github.com/shirosaidev/diskover) is an open-source, powerful data management and analytics tool designed to help organizations efficiently manage and visualize their file systems. By providing insights into data usage and storage, Diskover enables users to make informed decisions about data retention, archiving, and resource allocation.

## Key Features

- **Comprehensive File Indexing:** Quickly scan and index file systems to gather detailed metadata about files and directories.
- **Data Visualization:** Utilize a range of visual tools to analyze storage usage, identify large files, duplicates, and areas of inefficiency.
- **Customizable Reports:** Generate detailed reports tailored to your specific needs, helping you understand data trends and optimize storage.
- **Scalable and Fast:** Designed to handle large-scale file systems, Diskover can efficiently process and analyze vast amounts of data.
- **Integration with Elasticsearch:** Leverage the power of Elasticsearch for fast and scalable search capabilities across your indexed data.

## Getting Started

To get started with Diskover, visit the [official GitHub repository](https://github.com/shirosaidev/diskover) for installation instructions, configuration guides, and additional resources. The repository provides comprehensive documentation to help you deploy and customize Diskover to suit your data management needs.

## Community and Support

Join the Diskover community on [GitHub](https://github.com/shirosaidev/diskover) to engage with other users, share feedback, and contribute to the project. Stay informed about the latest features, improvements, and community-driven enhancements.

Optimize your data management strategy with Diskover—an intelligent tool designed to provide clarity and control over your file systems.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/diskover.yml"
```

## Notes

