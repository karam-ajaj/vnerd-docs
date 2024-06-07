---
comments: true
---

# Remmina

Feature-Rich Remote Desktop Client

[Remmina](https://remmina.org/) is a powerful and versatile open-source remote desktop client for managing remote desktop connections on Linux-based operating systems. With its intuitive interface, extensive protocol support, and rich feature set, Remmina provides users with a comprehensive solution for accessing and managing remote desktops, servers, and virtual machines from a single application.

## Key Features

- **Protocol Support:** Remmina supports a wide range of remote desktop protocols, including RDP, VNC, SSH, NX, XDMCP, SPICE, and more, enabling users to connect to various remote desktop environments and systems.
- **User-Friendly Interface:** Remmina offers a clean and intuitive user interface for managing multiple remote desktop connections, with support for tabbed browsing, session management, and customizable connection profiles.
- **Advanced Features:** Remmina provides advanced features such as file transfer, audio redirection, printer sharing, SSH tunneling, and session recording, enhancing productivity and collaboration in remote desktop environments.
- **Integration with Remote Desktop Services:** Remmina integrates seamlessly with remote desktop services and virtualization platforms, including Windows Remote Desktop Services (RDS), VirtualBox, VMware, and Microsoft Hyper-V.
- **Customization and Extensibility:** Remmina is highly customizable and extensible, with support for plugins, themes, and scripting languages, allowing users to tailor the client to their specific requirements and workflows.

## Getting Started

To get started with Remmina, install the software package from the package repository of your Linux distribution, or download and compile it from source using the instructions provided on the [official website](https://remmina.org/). Once installed, launch Remmina and configure remote desktop connections by specifying the target host address, protocol, and authentication credentials.

## Community and Support

Join the Remmina community on [GitHub](https://github.com/FreeRDP/Remmina) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Remmina remote desktop client.

Access and manage remote desktops with ease using Remmina—a feature-rich and versatile remote desktop client for Linux-based operating systems.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/remmina.yml"
```

## Notes

