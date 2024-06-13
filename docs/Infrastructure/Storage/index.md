Storage is divided into 3 tiers/components:

1. slow nfs share from Qnap nas to store data and backups.

2. fast storage using OpenMediaVault as a Proxmox vm using the internal super fast ssd of the NUC, this is used to store configuration files and services databases.

3. truenas core server installed on Proliant ML310e Gen 8 server for storing media files, this storage is big configured with RAID 0 and has no redundeancy nor backup.