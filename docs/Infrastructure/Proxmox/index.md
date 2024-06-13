# Proxmox Cluster Setup Documentation

### Introduction

Welcome to the Proxmox Cluster Setup Documentation. This guide provides step-by-step instructions for setting up a Proxmox cluster using Intel NUC devices, creating Ubuntu VMs for a workload swarm cluster, and configuring a Traefik load balancer for cluster access.

---

### Proxmox Installation

Proxmox is installed as the barebone layer on three Intel NUC devices to create a robust and efficient cluster. This section covers the installation process and initial setup.

#### Steps
1. Download the Proxmox VE ISO.
2. Create a bootable USB drive with the Proxmox VE ISO.
3. Boot each Intel NUC from the USB drive and follow the installation prompts.
4. Complete the installation and configure the network settings for each NUC.

---

### Cluster Configuration

Once Proxmox is installed on all three Intel NUC devices, the next step is to configure them as a cluster. This involves connecting the devices and setting up the Proxmox cluster.

#### Steps
1. Log in to the Proxmox web interface on each NUC.
2. Create a new cluster on the first NUC.
3. Join the other two NUCs to the cluster using the join information provided by the first NUC.

---

### VM Creation

Virtual Machines (VMs) are created with Ubuntu OS to be added to the workload swarm cluster. This section details the process of creating and configuring these VMs.

#### [Steps](https://docs.vnerd.nl/Infrastructure/Proxmox/create_node/)


---

### Traefik Load Balancer Setup

A Traefik load balancer is configured using dynamic configurations to provide access to the Proxmox cluster. This section explains how to set up and configure Traefik.

#### [Steps](https://docs.vnerd.nl/Infrastructure/Traefik/)

---

### Conclusion

This documentation provides a comprehensive guide to setting up a Proxmox cluster on Intel NUC devices, creating Debian VMs, and configuring a Traefik load balancer. Follow the steps carefully to ensure a successful setup.

For more detailed instructions and troubleshooting tips, refer to the official Proxmox and Traefik documentation.

---

### Additional Resources

- [Proxmox VE Official Documentation](https://www.proxmox.com/en/proxmox-ve)
- [Debian Official Website](https://www.debian.org/)
- [Traefik Official Documentation](https://doc.traefik.io/traefik/)

---
