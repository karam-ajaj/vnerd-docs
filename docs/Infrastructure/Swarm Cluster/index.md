# Introduction

This guide provides detailed instructions for setting up and managing a Docker Swarm Cluster using the resources available on [docs.vnerd.nl](https://docs.vnerd.nl).

---

### Management Layer Overview

The primary management layer is built on a Docker Swarm cluster. This robust orchestration tool facilitates efficient container management and service deployment.

### Node Configuration

The nodes within the Swarm cluster comprise:

- **Physical Hosts**: All physical servers participating in the cluster.
- **Virtual Machines (VMs)**: Virtual machines created on the underlying Proxmox cluster, adding flexibility and scalability to the infrastructure.