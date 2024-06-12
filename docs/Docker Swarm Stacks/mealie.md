---
comments: true
---

# Mealie

Open-Source Recipe Management System

![mealie diagram](/assets/diagrams/mealie.png){ loading=lazy }

[Mealie](https://github.com/hay-kot/mealie) is a modern, open-source recipe management system designed to simplify the process of organizing, sharing, and discovering recipes. With its intuitive interface, extensive feature set, and support for various data formats, Mealie provides a versatile platform for individuals, families, and communities to manage their culinary creations.

## Key Features

- **Recipe Organization:** Easily organize your recipes into categories, tags, and collections, making it simple to find and browse recipes based on your preferences.
- **User-Friendly Interface:** Enjoy a clean and intuitive web-based interface for adding, editing, and sharing recipes, with support for rich media and detailed instructions.
- **Customizable Recipe Cards:** Customize recipe cards with images, ingredients, instructions, and nutritional information, creating visually appealing and informative recipes.
- **Import and Export:** Import recipes from popular formats like Markdown, JSON, and CSV, and export recipes in various formats for sharing or backup purposes.
- **Multi-Language Support:** Mealie supports multiple languages, allowing users to view recipes and interface elements in their preferred language.

## Getting Started

To get started with Mealie, deploy the Mealie application using Docker or run it locally on your machine. Visit the [official GitHub repository](https://github.com/hay-kot/mealie) for installation instructions, configuration guides, and additional resources. The repository also provides comprehensive documentation to help you set up and customize Mealie according to your preferences.

## Community and Support

Join the Mealie community on [GitHub](https://github.com/hay-kot/mealie) to engage with other users, share feedback, report issues, and contribute to the project. Stay informed about the latest updates, features, and community-driven enhancements through discussions and announcements.

Simplify your recipe management with Mealie—a modern and versatile recipe management system designed to streamline the organization, sharing, and discovery of culinary delights.


## Volumes

```bash
/nfs-nas-swarm/config/
/nfs-nas-swarm/data/
```

## Deployment
No Special requirments

## Docker swarm file
``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/mealie.yml"
```

## Notes

