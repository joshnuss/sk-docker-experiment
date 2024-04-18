# Docker/SvelteKit Experiment

This is an experiment to build a publish SvelteKit app to the GitHub container registry.

## Usage

Create a `docker-compose.yml`:

```yaml
services:
  - web:
    image: ghcr.io/joshnuss/sk-docker-experiment
    expose:
      - "3000:3000"
```

Build and run:

```sh
docker compose up
```

Then visit: https://localhost:3000

## Credits

- SvelteKit `Dockerfile` is based on [@aradalvand's gist](https://gist.github.com/aradalvand/04b2cad14b00e5ffe8ec96a3afbb34fb). Modified to support `pnpm`.
- Article about [publishing Docker images to GitHub's container registry](https://dev.to/willvelida/pushing-container-images-to-github-container-registry-with-github-actions-1m6b)
