---
comments: true
---

# Docker Stack Diagrams

This section documents how the Docker Swarm stack diagrams are generated and kept in sync with the site. The diagrams help readers quickly understand each stack’s topology and how services relate.

## How it works

- We use the container `pmsipilot/docker-compose-viz` (Graphviz under the hood) to render images from Compose/Swarm YAML.
- A simple script renders every stack and copies the images to the docs assets:
	- Script: `docs/assets/diagrams/temp/generate_script.sh`
	- Source YAMLs: `/swarm/config/docs/github-repos/portainer-compose/stacks/*.yml`
	- Output images: `docs/assets/diagrams/<stack>.png`

On each stack page, images are referenced like:

```markdown
![<stack> diagram](../assets/diagrams/<stack>.png){ loading=lazy }
```

## Prerequisites

- Docker is available on the host where you run the script
- Access to the paths used in the script (mounted or present on that host):
	- `/swarm/config/docs/github-repos/portainer-compose/stacks`
	- `/swarm/config/docs/docs/assets/diagrams`
- Network access to pull `pmsipilot/docker-compose-viz` (first run)

## Regenerate all diagrams

Run the script from any shell on a host that can access the above paths:

```bash
bash docs/assets/diagrams/temp/generate_script.sh
```

What it does:

1. Lists all `*.yml` files in `/swarm/config/docs/github-repos/portainer-compose/stacks`
2. Renders each file with `pmsipilot/docker-compose-viz`
3. Writes images to `docs/assets/diagrams/<stack>.png`
4. Copies the full diagrams folder back to the `portainer-compose/diagrams` directory for reference

## Render a single diagram (optional)

You can manually render one stack to validate output before running the full script:

```bash
cd /swarm/config/docs/docs/assets/diagrams/temp
cp /swarm/config/docs/github-repos/portainer-compose/stacks/<stack>.yml docker-compose.yml
docker run --rm -it -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -r --force docker-compose.yml
mv docker-compose.png ../<stack>.png
```

## Troubleshooting

- No image produced
	- Check that `docker-compose.yml` exists in the temp folder before rendering
	- Validate the YAML: unsupported Compose keys or syntax errors can stop rendering
	- Run the renderer without redirecting output to see errors
- Wrong or missing paths
	- Verify the paths in the script match your environment (they use `/swarm/config/docs/...`)
- Permissions
	- Ensure write access to `docs/assets/diagrams`

## Notes

- Images are used purely for documentation. They may not show dynamic runtime state (e.g., scaled replicas) unless defined in YAML.
- Keep stack names in `stacks/<name>.yml` aligned with the desired `<name>.png` to avoid broken image links in pages.
