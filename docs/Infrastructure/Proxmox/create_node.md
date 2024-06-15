# Create new swarm node on Proxmox hosts

a vm template was created (ubuntu 22.04 LTS) as a starting point for all nodes

## Procedure

1. clone the template (pxsw00) to a new vm

2. edit the cpu to max the cores (based on the residing host) and use type host for better performance.

3. configure the new node:

*change the hostname from pxe console*

```
cat /etc/hostname
pxsw01.karam.lab
```

*change the ip*

```
cat /etc/netplan/00-installer-config.yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens18:
      addresses:
      - 10.10.10.81/24
      nameservers:
        addresses:
        - 10.10.10.220
        - 8.8.8.8
        search:
        - karam.lab
      routes:
      - to: default
        via: 10.10.10.1
  version: 2

```

*reboot*

**login from ssh and do the following**

*extend the disk*

```
df -h
lsblk
for file in /sys/bus/scsi/devices/[0-3]*/rescan; do echo 1 >$file; done
lvresize -r -l+100%FREE /dev/ubuntu-vg/ubuntu-lv
```

*mount nfs share*

```
sudo -s
apt install nfs-common -y
mkdir /nfs-nas-swarm
echo "10.10.10.210:/share/NFSv=4/nfs-nas-swarm /nfs-nas-swarm nfs rw,nolock 0 0" >> /etc/fstab
mount -a
```

*install docker* [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker ps
```

*join the swarm cluster, on master node apply*

```
 docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-2wq0r0pcfl1f536f0po9b3vdnpnzr6jzjuiynibzlds64vn0ys-dzx0fw34zvajngbtz4s1pzj8q 10.10.10.222:2377

```

> [!WARNING]
> to be able to apply awx playbooks you need to configure a user in the sudoers group with no password needed
> apply the following on all hosts

```
sudo -s
echo "karam ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/karam
```