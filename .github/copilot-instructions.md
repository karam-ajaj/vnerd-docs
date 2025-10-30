# vNerd Documentation Copilot Instructions

## Project Overview
This is a **MkDocs Material-based documentation site** for a homelab infrastructure, served at **https://docs.vnerd.nl/**. The documentation covers Docker Swarm stacks, infrastructure components, and automation workflows for the owner's personal lab environment. All Docker services are defined in the [portainer-compose repository](https://github.com/karam-ajaj/portainer-compose), with content generated dynamically using external GitHub repositories and automated diagram generation.

## Mission: Better Documentation
The primary goal is to create comprehensive, user-friendly documentation that helps others understand and replicate the homelab setup. Focus on clarity, completeness, and practical examples when contributing to or improving the documentation.

### Tone and Style
- Write in a professional, concise voice suitable for a documentation/technical blog.
- Keep it engaging and human; light humor is welcome when it clarifies or adds personality (e.g., the “ties the room together” nod to The Big Lebowski).
- Prioritize accuracy and reproducibility; every command and path should be runnable and correct.
- When describing architecture, include the “why” behind decisions alongside the “how”.

## Architecture & Key Patterns

### Dynamic Content Integration
- **External markdown inclusion**: Uses `mkdocs-embed-external-markdown` with `--8<--` syntax to pull content from external repos
- **Configuration files embedded**: Docker compose files are embedded directly from [portainer-compose repo](https://github.com/karam-ajaj/portainer-compose)
- **Diagram automation**: Bash script at `docs/assets/diagrams/temp/generate_script.sh` auto-generates Docker stack diagrams using `pmsipilot/docker-compose-viz`

### Documentation Structure
- **Docker Swarm Stacks**: Main content area with standardized format: Volumes → Deployment → Docker swarm file → Notes
- **Infrastructure**: Organized by service type (DNS, Networking, Storage, Proxmox, etc.)
- **Special Services**: Meta-documentation about the toolchain (MkDocs, GitHub Actions, etc.)

### Content Conventions
- Each Docker stack page follows this pattern: introduction (AI-generated) → diagram → key features → volumes → deployment steps → YAML configuration
- All stack pages include comments (`comments: true` in frontmatter) for community engagement
- Diagrams are lazy-loaded: `![diagram](../assets/diagrams/name.png){ loading=lazy }`

## Documentation Improvement Guidelines

### Writing Better Documentation
When improving or creating documentation:
- **Be practical**: Include real examples, actual commands, and specific file paths from the homelab
- **Explain the "why"**: Don't just document what services do, explain why they're chosen and how they fit the overall architecture
- **Add troubleshooting**: Include common issues and solutions encountered during deployment
- **Cross-reference**: Link related services and dependencies to help users understand the complete picture
- **Update diagrams**: Ensure auto-generated diagrams reflect current service configurations
- **Test instructions**: Verify deployment commands and configuration examples actually work
- **Professional yet engaging**: This is a documentation/technical blog site - maintain professionalism while keeping content interesting and accessible

### Content Quality Standards
- Each service should have clear prerequisites and dependencies listed
- Include resource requirements (CPU, RAM, storage) where relevant  
- Provide both quick-start and detailed configuration options
- Add security considerations and best practices
- Document backup and recovery procedures for critical services

## Development Workflow

### MkDocs Configuration
- **Custom build**: Uses custom Docker image `keinstien/mkdocs-material:9.5.26` with additional plugins
- **Key plugins**: `awesome-pages`, `external-markdown`, `termynal`, `blog`
- **Theme**: Material theme with automatic/light/dark mode toggle, navigation features enabled

### Content Creation Process
1. **Docker stacks**: Create YAML in external portainer-compose repo → run diagram generation script → create documentation page with embedded config
2. **AI-generated introductions**: Use ChatGPT with prompt: "write a short introduction about {service} in markdown language"
3. **Dynamic updates**: External repo changes auto-reflect in documentation via embed syntax

### File Organization
- `/docs/Docker Swarm Stacks/`: Main service documentation
- `/docs/Infrastructure/`: Network, storage, and system documentation
- `/docs/Special Services/`: Documentation toolchain and meta-services
- `/docs/assets/diagrams/`: Auto-generated service architecture diagrams
- `/overrides/`: Custom theme components (comments integration)

## Key Files to Understand
- `mkdocs.yml`: Complex configuration with custom plugins and dynamic content features
- `docs/assets/diagrams/temp/generate_script.sh`: Automated diagram generation workflow
- `docs/Docker Swarm Stacks/index.md`: Template and pattern for service documentation
- `docs/stylesheets/extra.css`: Custom styling for code highlighting and tooltips

## Development Commands
```bash
# Build custom MkDocs image with plugins
docker build -t keinstien/mkdocs-material:9.5.26 .

# Run development server
docker run --rm -it -p 8000:8000 -v $(pwd):/docs keinstien/mkdocs-material:9.5.26

# Generate diagrams for all stacks
cd docs/assets/diagrams/temp && ./generate_script.sh
```

## External Dependencies
- **Content source**: https://github.com/karam-ajaj/portainer-compose (main config repository)
- **Diagram generation**: `pmsipilot/docker-compose-viz` Docker container
- **AI content**: ChatGPT-generated service introductions
- **Infrastructure**: Hosted on Docker Swarm with NFS shared storage (`/swarm/`)