# Docker/SvelteKit Experiment

This is an experiment to build and publish a SvelteKit app to the GitHub container registry.

## How it works

- The `Dockerfile` contains build instructions and a label for the image.
- There's a workflow action to build and deploy to GitHub Container Registry (GHCR).

## Usage

Create a `docker-compose.yml`:

```yaml
services:
  web:
    image: ghcr.io/joshnuss/sk-docker-experiment:latest
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL="postgresql://postgres:postgres@localhost:5432/db?schema=public"

  db:
    image: postgres
    restart: always
    ports:
      - 5432:5432
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=db
```

Build and run:

```sh
docker compose up
```

Then visit: https://localhost:3000

## Credits

- SvelteKit `Dockerfile` is based on [@aradalvand's gist](https://gist.github.com/aradalvand/04b2cad14b00e5ffe8ec96a3afbb34fb). Modified to support `pnpm`.
- Article about [publishing Docker images to GitHub's container registry](https://dev.to/willvelida/pushing-container-images-to-github-container-registry-with-github-actions-1m6b)
- @onixus74 for explaining how all this works
