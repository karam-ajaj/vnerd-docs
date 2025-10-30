---
hide:
  - navigation
  - toc
---

# Introduction

Everyone dreams of having a beautiful homelab—or at least I do. There’s something deeply satisfying about running your own services at home. You avoid recurring costs, you learn a ton, and you get the freedom to build exactly what you need.

With that freedom comes responsibility: security, redundancy, backups, administration, and, yes, documentation. This site is equal parts documentation and technical blog. I share what I’m running, why I chose it, and the exact steps to reproduce it—warts and all.

And because great systems deserve a great front door, there’s a dashboard that truly ties the room together—powered by my [Atlas](https://github.com/karam-ajaj/atlas) project.

> “That rug really tied the room together.”

<!-- ![The Big Lebowski — the rug that ties the room together](assets/images/The%20Big%20Lebowski.jpg){ loading=lazy } -->

What you’ll find here:

- Docker Swarm stacks with deploy-ready YAML, diagrams, and step‑by‑step guides
- Infrastructure notes (networking, storage, Proxmox, VPN, PXE, DNS, backup, and more)
- Tooling and automation that keep the docs in sync with the live lab

## Using dynamic configurations

This site is built with MkDocs Material and intentionally designed to be dynamic as the lab evolves.

More details: [Special Services → MkDocs](https://docs.vnerd.nl/Special%20Services/MkDocs/)

### Dynamic configurations

- GitHub repositories are connected directly to the MkDocs configuration using external markdown includes (`--8<--`) so content stays current without copy/paste. Most service YAML lives in the [portainer-compose repository](https://github.com/karam-ajaj/portainer-compose).
- Diagrams are generated automatically and added to the relevant pages for each stack.

### Github actions

[GitHub Actions](https://docs.vnerd.nl/Special%20Services/GitHub%20Actions/) orchestrate parts of the automation pipeline that builds and publishes this site.

### Content writing

Narrative sections are AI-assisted to improve readability. All commands, paths, and YAML are sourced from the actual repositories or verified against the running homelab.