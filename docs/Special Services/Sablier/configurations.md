## Install the [Sablier plugin](https://plugins.traefik.io/plugins/633b4658a4caa9ddeffda119/sablier) on traefik 


### Add these lines to traefik

```
- --experimental.plugins.sablier.modulename=github.com/acouvreur/sablier
- --experimental.plugins.sablier.version=v1.5.0
```

### Also, to allow empty services in traefik add this:

```
- --providers.docker.allowEmptyServices=true
```

---

## Deploy Sablier service

The implementation process is describerd [here](https://docs.vnerd.nl/Docker%20Swarm%20Stacks/sablier/).

---

## Enable Sablier on a service

To enable Sablier middleware from Treafik on a service follow the methode described [here](https://docs.vnerd.nl/Special%20Services/Sablier/enable_service/).