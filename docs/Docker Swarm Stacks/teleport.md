---
comments: true
---

# Teleport

Secure Access for Infrastructure

![teleport diagram](/assets/diagrams/teleport.png){ loading=lazy }

[Teleport](https://goteleport.com/) is an open-source, cloud-native, and multi-platform solution for secure access to infrastructure and applications across distributed environments. Designed to simplify and enhance access controls, Teleport provides a unified gateway for developers and system administrators to securely access servers, containers, databases, and Kubernetes clusters without exposing sensitive credentials or compromising security.

## Key Features

- **Zero Trust Access:** Teleport implements a zero-trust security model, authenticating and authorizing access requests based on user identity, role, and device trustworthiness, rather than network location or IP address.
- **SSH and Kubernetes Access:** Teleport supports secure SSH access to servers and containers, as well as role-based access control (RBAC) and audit logging for Kubernetes clusters, providing a unified access control plane for both traditional and cloud-native environments.
- **Session Recording and Playback:** Teleport records SSH and Kubernetes sessions, allowing administrators to audit user activities, monitor commands, and replay sessions for troubleshooting and forensic analysis.
- **Certificate-Based Authentication:** Teleport uses short-lived X.509 certificates for authentication and authorization, eliminating the need for long-lived credentials and reducing the attack surface.
- **Audit Logging and Compliance:** Teleport generates detailed audit logs of user activities, access requests, and system events, facilitating compliance with regulatory requirements and security best practices.

## Getting Started

To get started with Teleport, visit the [official website](https://goteleport.com/) to download and install the software, or deploy it using Docker, Kubernetes, or other containerization platforms. Follow the provided documentation and setup guides to configure Teleport for your infrastructure and integrate it with your existing authentication providers and identity stores.

## Community and Support

Join the Teleport community on [GitHub](https://github.com/gravitational/teleport) to engage with other users, report issues, contribute code, and stay informed about the latest updates and developments. Participate in community discussions, share feedback, and collaborate on improving and enhancing the Teleport secure access solution.

Securely access and manage your infrastructure with Teleport—a cloud-native solution for zero-trust access control and secure remote access.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/teleport.yml"
```

## Notes

