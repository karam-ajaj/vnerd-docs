FROM squidfunk/mkdocs-material:9.5.26

# Install plugins inside the container
RUN pip install \
  mkdocs-embed-external-markdown \
  mkdocs-awesome-pages-plugin \
  termynal \
  mkdocs-charts-plugin \
  mkdocs-pdf-export-plugin
