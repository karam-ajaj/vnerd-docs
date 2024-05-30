---
comments: true
---

# Homarr

Simplifying Home Automation with Containers

[Homarr](https://github.com/ajnart/homarr) is an open-source project that redefines home automation by leveraging the power of containers. Created by [ajnart](https://github.com/ajnart), this project provides a streamlined approach to managing and orchestrating various home automation services within containerized environments.

## Key Features

- **Containerized Services:** Homarr embraces the containerization paradigm, allowing users to deploy and manage home automation services in isolated and portable containers.

- **Simplified Setup:** With a focus on user-friendly configuration, Homarr aims to simplify the initial setup and ongoing maintenance of diverse home automation applications.

- **Extensibility:** Designed with extensibility in mind, Homarr supports the integration of additional services and tools, providing flexibility for users to tailor their home automation stack.

- **Scalability:** Whether you're just starting with a few services or building a comprehensive home automation ecosystem, Homarr scales effortlessly to accommodate your needs.

## Getting Started

Explore the detailed documentation provided by the [Homarr project](https://github.com/ajnart/homarr) to kickstart your home automation journey. The documentation offers step-by-step guides, configuration examples, and additional resources for a smooth setup.

## Community and Support

Connect with the Homarr community on [GitHub](https://github.com/ajnart/homarr) to engage with other users, seek support, and stay informed about updates and enhancements. The collaborative nature of this project encourages a thriving community of home automation enthusiasts.

Experience the future of home automation through simplicity and containerization with Homarr.


## Volumes

```bash
/nfs-nas-swarm/config/homarr
/nfs-nas-swarm/data/homarr
```

## Deployment
No special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/homarr.yml"
```

## Notes
To connect locally to the Arr services you need to add the autopirate-network later on. 
