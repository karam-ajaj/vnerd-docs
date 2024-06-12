---
comments: true
---

# Wetty

Web Terminal

![wetty diagram](/assets/diagrams/wetty.png){ loading=lazy }

[Wetty](https://github.com/krishnasrinivas/wetty) is an open-source web-based terminal emulator that allows users to access a remote shell session via a web browser. It provides a convenient way to interact with remote servers and devices using a familiar terminal interface without the need for a dedicated SSH client.

## Key Features

- **Web-Based Terminal:** Wetty provides a web-based terminal interface accessible via a web browser, eliminating the need for a standalone SSH client or terminal emulator.
- **Secure Communication:** Wetty establishes a secure connection between the web browser and the remote server using SSH, ensuring encrypted communication and secure access to the terminal session.
- **User Authentication:** Wetty supports user authentication through SSH, allowing users to log in to the remote server using their existing credentials and access permissions.
- **Customizable Interface:** Wetty offers customization options for the terminal interface, including support for terminal themes, fonts, and color schemes, providing users with a personalized terminal experience.
- **Integration with Web Applications:** Wetty can be integrated into web applications and dashboards, enabling developers to embed terminal functionality directly into their web-based tools and platforms.

## Getting Started

To get started with Wetty, deploy the Wetty server on your remote Linux server or device by following the installation instructions provided in the [GitHub repository](https://github.com/krishnasrinivas/wetty). Once installed, access the Wetty web terminal interface through your web browser by navigating to the Wetty server's URL.

## Community and Support

Join the Wetty community on [GitHub](https://github.com/krishnasrinivas/wetty) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Wetty web terminal emulator.

Access remote shell sessions conveniently from your web browser with Wetty—a web-based terminal emulator for secure and interactive remote access.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/wetty.yml"
```

## Notes

