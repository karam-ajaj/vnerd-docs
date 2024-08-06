# Enable on a service

## Add middleware to a service

Add the following parameters to the service

```yaml
version: '3.3'
services:
  service_name:
    deploy:
      replicas: 0
      labels:
        sablier.enable: 'true'
        sablier.group: service_name
        traefik.docker.lbswarm: 'true'
        traefik.http.routers.service_name-https.middlewares: authelia@docker, service_name-sablier@file
```

## Configure the plugin using traefik dynamic configurations

1. Add the service name to the configuration file from [Filebrowser](https://docs.vnerd.nl/Docker%20Swarm%20Stacks/filebrowser/) or [coder](https://docs.vnerd.nl/Docker%20Swarm%20Stacks/coder/).


2. Define some variables.

The Sablier plugin configurations in Traefik dynamic configurations will be this file
``` yaml linenums="1" hl_lines="1 2"
--8<-- "configs/traefikv3/dynamic-config/plugin-sablier.yml"
```

!!! note
    If you change the dynamic configurations file then you have to restart the sablier service.

    Apparently, and restart traefik!

    **update**

    add this and it should always work

    --providers.file.directory=/my/path/to/dynamic/conf

    --providers.file.watch=true

    **update**

    no it doesnt, you have to restart traefik!