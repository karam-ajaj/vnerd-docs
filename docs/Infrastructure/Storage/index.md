# Storage Architecture

The storage system is structured into three distinct tiers/components, each designed for specific purposes to optimize performance and reliability.

## Storage Components

### 1. Slow NFS Share

- **Hardware**: QNAP NAS TS-231P
- **Disks**: Red NAS HDD's
- **Purpose**: Storing data and backups
- **Characteristics**: Ideal for long-term storage needs where speed is not a critical factor.

### 2. Fast Storage

- **Hardware**: OpenMediaVault running on a Proxmox VM
- **Disks**: Internal super-fast SSD of the NUC
- **Purpose**: Storing configuration files and services databases
- **Characteristics**: High-speed storage solution for frequently accessed and critical data.

### 3. TrueNAS Core Server

- **Hardware**: Proliant ML310e Gen 8 server
- **Disks**: Normal Hdd's, configured with RAID 0
- **Purpose**: Storing media files
- **Characteristics**: Large capacity with no redundancy or backup, suitable for storing media files where high availability is not a priority.

Each tier serves a specific role, balancing performance, capacity, and redundancy to meet the diverse storage needs of our infrastructure.