# PXE/TFTP


## Setting up server
we need to configure the PXE/TFTP server first

## DHCP
- install dhcp server service wit this simple command

```
apt -y install isc-dhcp-server
```

- there are two location to store the dhcp server configurations:

```
/etc/default/isc-dhcp-server
/etc/dhcp/dhcpd.conf
```

- the contents of these two files are described here:

```
cat /etc/default/isc-dhcp-server
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="eno1"
#INTERFACESv6=""
```

```
cat /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;

allow booting;

authoritative;

# in this example, we serve DHCP requests from 10.10.10.(3 to 253)
# and we have a router at 10.10.10.1
subnet 10.10.10.0 netmask 255.255.255.0 {
  range 10.10.10.40 10.10.10.60;
  option broadcast-address 10.10.10.255;
  option routers 10.10.10.1;             # our router
  option domain-name-servers 10.10.10.1; # our router has DNS functionality
  option domain-name "karam.lab";
  next-server 10.10.10.220;             # our Server
  filename "gpxe.kpxe"; # setting a default, might be wrong for "non defaults"
 
  group{
   host tc01           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.201;   }
   host tc02           { hardware ethernet 9c:8e:99:d4:31:b7; fixed-address 10.10.10.202;   }
   host tc03           { hardware ethernet 9c:8e:99:d4:12:98; fixed-address 10.10.10.203;   }
   host tc04           { hardware ethernet 9c:8e:99:d4:13:9a; fixed-address 10.10.10.204;   }
   host tc05           { hardware ethernet 9c:8e:99:d4:36:4d; fixed-address 10.10.10.205;   }
#   host tc06           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.206;   }
 }
}
```

## NFS
configure NFS settings and allow all devices on the local network to access the shared folder
```
echo "Setting up NFS for local network"
echo "/srv/pxe 10.10.10.0/255.255.255.0(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "Restarting NFS service"
exportfs -ra 
```

## lighttpd
restart lighttpd service
```
/etc/init.d/lighttpd restart
```

lighttpd configuration should be like this:

```
root@pc01:~# cat /etc/lighttpd/lighttpd.conf
server.modules = (
        "mod_indexfile",
        "mod_access",
        "mod_alias",
        "mod_redirect",
)

server.document-root        = "/srv/pxe"
server.upload-dirs          = ( "/var/cache/lighttpd/uploads" )
server.errorlog             = "/var/log/lighttpd/error.log"
server.pid-file             = "/run/lighttpd.pid"
server.username             = "www-data"
server.groupname            = "www-data"
server.port                 = 80

# features
#https://redmine.lighttpd.net/projects/lighttpd/wiki/Server_feature-flagsDetails
server.feature-flags       += ("server.h2proto" => "enable")
server.feature-flags       += ("server.h2c"     => "enable")
server.feature-flags       += ("server.graceful-shutdown-timeout" => 5)
#server.feature-flags       += ("server.graceful-restart-bg" => "enable")

# strict parsing and normalization of URL for consistency and security
# https://redmine.lighttpd.net/projects/lighttpd/wiki/Server_http-parseoptsDetails
# (might need to explicitly set "url-path-2f-decode" = "disable"
#  if a specific application is encoding URLs inside url-path)
server.http-parseopts = (
  "header-strict"           => "enable",# default
  "host-strict"             => "enable",# default
  "host-normalize"          => "enable",# default
  "url-normalize-unreserved"=> "enable",# recommended highly
  "url-normalize-required"  => "enable",# recommended
  "url-ctrls-reject"        => "enable",# recommended
  "url-path-2f-decode"      => "enable",# recommended highly (unless breaks app)
 #"url-path-2f-reject"      => "enable",
  "url-path-dotseg-remove"  => "enable",# recommended highly (unless breaks app)
 #"url-path-dotseg-reject"  => "enable",
 #"url-query-20-plus"       => "enable",# consistency in query string
)

index-file.names            = ( "index.php", "index.html" )
url.access-deny             = ( "~", ".inc" )
static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )

# default listening port for IPv6 falls back to the IPv4 port
include_shell "/usr/share/lighttpd/use-ipv6.pl " + server.port
include_shell "/usr/share/lighttpd/create-mime.conf.pl"
include "/etc/lighttpd/conf-enabled/*.conf"

#server.compat-module-load   = "disable"
server.modules += (
        "mod_dirlisting",
        "mod_staticfile",
)
```

## PXE
apply the following commands. This will install the required services, create some directories to store configurations etc..
```
apt-get install tftpd-hpa nfs-kernel-server lighttpd
mkdir -p /srv/pxe/configs
mkdir -p /srv/pxe/data
chmod -R 777 /srv/pxe
ssh-keygen
cp ~/.ssh/id_rsa.pub /srv/pxe/sshkeys.pub
```

### 1. PXE config
in my lab I had to use a different port (port 8765 because traefik uses port 80)

```
# install requirements
sudo apt-get install -y build-essential liblzma-dev

# get source
cd /tmp
git clone git://git.ipxe.org/ipxe.git

# create boot script
cat  /tmp/ipxe/src/boot.ipxe
#!ipxe
dhcp
chain http://10.10.10.220:8765/gpxe-script

cd /tmp/ipxe/src

make bin/undionly.kpxe EMBED=boot.ipxe

cp bin/undionly.kpxe /srv/tftp/gpxe.kpxe
```

### 2. PXE script

```
cat /srv/pxe/gpxe-script
#!gpxe
kernel http://10.10.10.220:8765/boot/vmlinuz-lts apkovl=http://10.10.10.220:8765/configs/${net0/mac}.tar.gz ip=dhcp ssh_key=http://10.10.10.220:8765/sshkeys.pub modloop=http://10.10.10.220:8765/boot/modloop-lts modules=loop,squashfs,sd-mod,usb-storage alpine_dev=nfs:10.10.10.220:/srv/pxe alpine_repo=http://nl.alpinelinux.org/alpine/v3.17/main/
initrd http://10.10.10.220:8765/boot/initramfs-lts
boot
```

### 3. test tftp
from another host on the same network verify tftp is working
```
apt install tftp-hpa
cd /tmp
uname -a >/srv/tftp/test
tftp 10.10.10.220
tftp> get test
tftp> quit
 diff test /srv/tftp/test
(nothing, they are identical)
```

### 4. get the iso

```
cd /srv/pxe/data/
apt install wget
wget https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86/alpine-netboot-3.17.0-x86.tar.gz
ls
unzip
cd /srv/pxe/data
tar -xvf alpine-netboot-3.17.0-x86.tar.gz
cp /srv/pxe/data/alpine-netboot-3.17.0-x86.tar.gz /srv/pxe/
cp /srv/pxe/data/boot/vmlinuz-lts /srv/pxe/
cp /srv/pxe/data/boot/modloop-lts /srv/pxe/
cp /srv/pxe/data/boot/initramfs-lts /srv/pxe/
rm -rf boot
mkdir /srv/pxe/boot
mv /srv/pxe/initramfs-lts /srv/pxe/boot/
mv /srv/pxe/vmlinuz-lts /srv/pxe/boot/
mv /srv/pxe/modloop-lts /srv/pxe/boot/
chmod 644 /srv/pxe/boot/initramfs-lts
```

> **_NOTE:_** IMPORTANT: restart all services

```
systemctl restart isc-dhcp-server.service && /etc/init.d/lighttpd restart && exportfs -ra && systemctl restart tftpd-hpa && systemctl restart nfs-kernel-server
```

### 5. find the new IP

```
journalctl -fu isc-dhcp-server
```

### 6. create default config

login on the booted client and do the following

```
echo "10.10.10.220:/srv/pxe/configs /config nfs rw,nolock 0 0" >> /etc/fstab
touch /etc/save.sh
##################
cat << 'EOF' > /etc/save.sh
#!/bin/ash
echo "[+] Saving your changes"
lbu include /root/
lines=$(cat /sys/class/net/eth0/address)
printf 'lbu pkg /config/%s.tar.gz\n' $lines | while read line; do $line; done
echo "[+] Done"
EOF
##################
cat << 'EOF' > /etc/resolv.conf
search karam.lab
nameserver 10.10.10.220
nameserver 8.8.8.8
EOF
##################
cat << 'EOF' > /etc/motd



╦ ╦┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐  ┌┬┐┌─┐  ╦╔═┌─┐┬─┐┌─┐┌┬┐  ┬  ┌─┐┌┐ ┬
║║║├┤ │  │  │ ││││├┤    │ │ │  ╠╩╗├─┤├┬┘├─┤│││  │  ├─┤├┴┐│
╚╩╝└─┘┴─┘└─┘└─┘┴ ┴└─┘   ┴ └─┘  ╩ ╩┴ ┴┴└─┴ ┴┴ ┴  ┴─┘┴ ┴└─┘o




EOF
##################
cat << 'EOF' > /etc/apk/repositories
http://nl.alpinelinux.org/alpine/v3.17/main/
https://nl.alpinelinux.org/alpine/v3.17/community/
EOF
##################
chmod +x /etc/save.sh
echo "alias save=\"/etc/save.sh\"" >> /etc/profile
mkdir /config
mount -a && df -h
#mount nfs at boot
apk add nfs-utils libmount
rc-update add nfsmount default
##################
# create a local data disk and configure the hostname
setup-hostname
setup-disk
##################
# save and reboot
save
reboot
##################
# add docker
apk update
apk add docker
rc-update add docker boot
service docker start
# join swarm
docker swarm join --token SWMTKN-1-4zvqdvpnkkqwhyovszs8utragt48ab6m8npi5ur2piujynk64b-4roeekrrohd2gr7e6ixwkipzy 10.10.10.220:2377
docker swarm join --token SWMTKN-1-4zvqdvpnkkqwhyovszs8utragt48ab6m8npi5ur2piujynk64b-4roeekrrohd2gr7e6ixwkipzy 10.10.10.220:2377
##################
# save and reboot
save
reboot
```


#### different approach

you can copy the file 00:00:00:00:00:00.tar.gz to a new file with the mac address as the name in the same location.
then you only have to apply these commands
```
setup-hostname
setup-disk
```

### 7. configure powerdns

```
cat << 'EOF' > /etc/resolv.conf
search karam.lab
nameserver 10.10.10.220
nameserver 8.8.8.8
EOF
```

### enable mic and speaker

[https://wiki.alpinelinux.org/wiki/ALSA](https://wiki.alpinelinux.org/wiki/ALSA)

```
apk add alsa-utils alsaconf
addgroup $USER audio
addgroup root audio
alsamixer ## unmute using M (00 means open and mm means muted)
rc-service alsa start
rc-update add alsa
aplay /tmp/test-mic.wav
save
exit
```

### 8. create static IP config:

```
# cat /etc/dhcp/dhcpd.conf    
default-lease-time 600;
max-lease-time 7200;

allow booting;

authoritative;

# in this example, we serve DHCP requests from 10.10.10.(3 to 253)
# and we have a router at 10.10.10.1
subnet 10.10.10.0 netmask 255.255.255.0 {
  range 10.10.10.40 10.10.10.60;
  option broadcast-address 10.10.10.255;
  option routers 10.10.10.1;             # our router
  option domain-name-servers 10.10.10.1; # our router has DNS functionality
  option domain-name "karam.lab";
  next-server 10.10.10.220;             # our Server
  filename "gpxe.kpxe"; # setting a default, might be wrong for "non defaults"
 
  group{
   host tc01           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.201;   }
#   host tc02           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.202;   }
#   host tc03           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.203;   }
   host tc04           { hardware ethernet 9c:8e:99:d4:13:9a; fixed-address 10.10.10.204;   }
   host tc05           { hardware ethernet 9c:8e:99:d4:36:4d; fixed-address 10.10.10.205;   }
#   host tc06           { hardware ethernet 9c:8e:99:d4:35:fb; fixed-address 10.10.10.206;   }
 }
}

```

### 9. copy config to a new client

```
## change bios config to boot from network
## reboot and find the IP address and MAC using this command
journalctl -fu isc-dhcp-server
cd /srv/pxe/configs/
## copy a config to a new location to edit
cp 9c:8e:99:d4:13:9a.tar.gz test.tar.gz
tar -xvf test.tar.gz
## change the hostname
vi etc/hostname
## tar the folders (root was added to preserve the ssh key)
tar -czvf file.tar.gz root etc
## move to the new MAC
mv file.tar.gz 9c\:8e\:99\:d4\:35\:fb.tar.gz
## remove temp folders
rm -rf etc root
rm test.tar.gz
## login to the client
ssh 10.10.10.46
## reboot the client
reboot
## login again and create local data disk
ssh 10.10.10.46
setup-disk
## mount all (new UUID in fstab)
mount -a && df -h
## save and reboot
save
reboot
```


## references

*   [https://blog.haschek.at/2019/build-your-own-datacenter-with-pxe-and-alpine.html](https://blog.haschek.at/2019/build-your-own-datacenter-with-pxe-and-alpine.html)
    
*   [https://wiki.alpinelinux.org/wiki/Alpine\_local\_backup#Checking\_what\_will\_be\_added\_to\_your\_apkovl](https://wiki.alpinelinux.org/wiki/Alpine_local_backup#Checking_what_will_be_added_to_your_apkovl)
    
*   [https://www.server-world.info/en/note?os=Debian\_11&p=dhcp&f=1](https://www.server-world.info/en/note?os=Debian_11&p=dhcp&f=1)
    
*   [https://wiki.debian.org/PXEBootInstall](https://wiki.debian.org/PXEBootInstall)
    
*   [https://alpinelinux.org/downloads/](https://alpinelinux.org/downloads/)
    
*   [https://nl.alpinelinux.org/alpine/v3.17/main/](https://nl.alpinelinux.org/alpine/v3.17/main/)
    
*   [https://www.cyberciti.biz/faq/how-to-create-tar-gz-file-in-linux-using-command-line/](https://www.cyberciti.biz/faq/how-to-create-tar-gz-file-in-linux-using-command-line/)
    
*   [https://dev.alpinelinux.org/~clandmeter/other/forum.alpinelinux.org/forum/general-discussion/nfs-mount-fails-boot.html](https://dev.alpinelinux.org/~clandmeter/other/forum.alpinelinux.org/forum/general-discussion/nfs-mount-fails-boot.html)
    