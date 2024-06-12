---
comments: true
---

# FileBrowser

A Simple and Powerful File Manager

![authelia diagram](/assets/diagrams/authelia.png){ loading=lazy }

[FileBrowser](https://filebrowser.org/) is a lightweight and easy-to-use file manager that provides a web-based interface for managing files and directories on your server or cloud storage. With its intuitive interface and robust feature set, FileBrowser offers a convenient way to navigate, upload, download, and organize files from anywhere.

## Key Features

- **Web-Based Interface:** Access and manage your files from any web browser, eliminating the need for complex terminal commands or file transfer protocols.
- **User-Friendly Design:** Enjoy a clean and intuitive interface that makes file management tasks simple and straightforward, even for novice users.
- **File Preview and Editing:** View previews of images, videos, and documents directly in the browser, and edit text files using a built-in text editor.
- **File Sharing and Collaboration:** Share files and folders with others via secure links, facilitating collaboration and file exchange.
- **Integration with Cloud Storage:** Connect FileBrowser to popular cloud storage providers like Dropbox, Google Drive, and Amazon S3, enabling seamless access to your cloud files.

## Getting Started

To get started with FileBrowser, download and install the application from the [official website](https://filebrowser.org/). The website provides installation instructions and configuration guides to help you set up FileBrowser on your server or cloud environment.

## Community and Support

Join the FileBrowser community on [GitHub](https://github.com/filebrowser/filebrowser) to engage with other users, report issues, request features, and contribute to the project. Stay updated on the latest developments, enhancements, and community-driven plugins.

Simplify your file management tasks with FileBrowser—a versatile and user-friendly file manager for all your storage needs.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/filebrowser.yml"
```

## Notes

