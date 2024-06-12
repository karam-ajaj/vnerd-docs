---
comments: true
---

# TDarr

Media File Management and Encoding Automation

![tdarr diagram](/assets/diagrams/tdarr.png){ loading=lazy }

[TDarr](https://github.com/HaveAGitGat/Tdarr) is an open-source media file management and encoding automation tool designed to streamline the process of organizing, optimizing, and converting multimedia files. With TDarr, users can automate the transcoding and optimization of media files, ensuring compatibility, quality, and consistency across different devices and platforms.

## Key Features

- **Media File Analysis:** TDarr analyzes media files to identify inconsistencies, errors, and optimization opportunities, allowing users to optimize and standardize their media library.
- **Encoding Automation:** TDarr automates the process of transcoding and encoding media files to ensure compatibility with specific devices, formats, and streaming services.
- **Customizable Workflows:** TDarr supports customizable workflows and presets for encoding settings, enabling users to tailor the transcoding process to their specific requirements and preferences.
- **Batch Processing:** TDarr facilitates batch processing of media files, allowing users to process multiple files simultaneously and optimize their media library efficiently.
- **Integration with Media Servers:** TDarr integrates with media servers such as Plex and Jellyfin, enabling seamless integration of transcoded and optimized media files into streaming and playback environments.

## Getting Started

To get started with TDarr, visit the [GitHub repository](https://github.com/HaveAGitGat/Tdarr) for installation instructions, configuration guidelines, and documentation. Follow the provided setup guides to deploy TDarr on your server and configure it to analyze and optimize your media files.

## Community and Support

Join the TDarr community on [GitHub](https://github.com/HaveAGitGat/Tdarr) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the TDarr media file management and encoding automation tool.

Automate media file management and optimization with TDarr—a powerful and flexible tool for transcoding, encoding, and organizing multimedia files.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/tdarr.yml"
```

## Notes

