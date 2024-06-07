# openvpn server


## install openvpn
1. create account https://as-portal.openvpn.com/instructions/debian/installation
2. choose debian 11 (pc01)
3. ssh to pc01

```
apt update && apt -y install ca-certificates wget net-tools gnupg
wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian bullseye main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as
## output
To reconfigure manually, use the /usr/local/openvpn_as/bin/ovpn-init tool.

+++++++++++++++++++++++++++++++++++++++++++++++
Access Server 2.13.0 has been successfully installed in /usr/local/openvpn_as
Configuration log file has been written to /usr/local/openvpn_as/init.log


Access Server Web UIs are available here:
Admin  UI: https://10.10.10.220:943/admin
Client UI: https://10.10.10.220:943/
To login please use the "openvpn" account with "*********" password.
(password can be changed on Admin UI)
+++++++++++++++++++++++++++++++++++++++++++++++
```

## claim server token
login to the internal url from the previous output 


## configure traefik proxy
add the following dynamic conf to traefik

```
http:
  routers:
    vpn-http:
      rule: "Host(`vpn.vnerd.nl`)"
      entryPoints:
        - "http"
      service: vpn
      middlewares:
        - https-redirect
    vpn-https:
      rule: "Host(`vpn.vnerd.nl`)"
      entryPoints:
        - "https"
      service: vpn
      tls:
        certResolver: le
  services:
    vpn:
      loadBalancer:
        servers:
        - url: "https://10.10.10.220:943"
  middlewares:
    https-redirect:
      redirectScheme:
        scheme: https
```
		
## change passaword
login to https://vpn.vnerd.nl/ and change password

## activate open vpn
1. go to admin panel https://vpn.vnerd.nl/admin/activation
2. add activation code from https://as-portal.openvpn.com/billing/activation-keys/subscriptions

## configure the firewall
add NAT rule and firewall rule to the fw01

## configure the open vpn instance
1. change server name to vpn.vnerd.nl from this url: https://vpn.vnerd.nl/admin/network_settings
2. create new user
3. create new token url and edit it to get the token  https://vpn.vnerd.nl/admin/user_profiles
```
openvpn://import-profile/https://vpn.vnerd.nl:1194/rest/GetProfileViaToken?token=iHlq2zq7dvHeTapINMfYfQxbXvBHPGCB
```
4. download open vpn client

5. configure client to use the token url
6. connect!

> **_NOTE:_** you cal also login with the new user, download and import the locked-profile, and connect!