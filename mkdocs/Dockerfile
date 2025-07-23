FROM python:3.11-slim

WORKDIR /site

# Copy mkdocs config
COPY mkdocs/mkdocs.yml /site/mkdocs.yml

# Copy docs separately
COPY docs/ /site/docs/

# Install MkDocs and plugins
RUN pip install --no-cache-dir \
  mkdocs>=1.5.3 \
  mkdocs-material>=9.5.19 \
  mkdocs-mermaid2-plugin>=1.1.1

EXPOSE 8000

CMD ["mkdocs", "serve", "--config-file", "/site/mkdocs.yml", "--dev-addr=0.0.0.0:8000"]
