# Introduction

To use [MKDocs](https://github.com/squidfunk/mkdocs-material) in a container I had to make some adjustments, this is described in the following sections.

## Prepare the environment

``` bash
nano /swarm/config/docs/mkdocs.yml
theme:
  name: 'material'
```

## Deploy files

``` bash
docker run --rm -it -p 8000:8000 -v /swarm/config/docs:/docs squidfunk/mkdocs-material
```

## Build container

To add the needed plug-ins I had to re-build with the new needed functuality using the official image


**On PC01 do the following:**

*Create the Dockerfile in this location ```/mkdocs/Dockerfile```*

``` bash
# grep the latest tag
FROM squidfunk/mkdocs-material:9.5.26
# install plug-ins to be used later in the config file
RUN pip install mkdocs-embed-external-markdown mkdocs-awesome-pages-plugin termynal mkdocs-charts-plugin mkdocs-pdf-export-plugin
```

*Pull, build, tag and push to* ***Dockerhub***

``` bash
docker pull squidfunk/mkdocs-material:9.5.26
docker build -t keinstien/mkdocs-material:9.5.26 .
docker images | grep mkdocs
docker login
docker tag keinstien/mkdocs-material:9.5.26 keinstien/mkdocs-material:9.5.26
docker push keinstien/mkdocs-material:9.5.26
```

*Edit the tag in the stack file and redeploy*