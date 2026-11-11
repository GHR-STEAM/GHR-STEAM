# GHR-STEAM

**GitHub Account Command Center & Integrated Data Platform**

This repository serves two purposes:

1. **Account governance:** a documented control center for cataloguing, classifying, auditing, and improving repositories under [@GHR-STEAM](https://github.com/GHR-STEAM).
2. **Existing application:** the GHR-STEAM integrated data-management platform. Its current application source, frontend, migrations, tests, Docker configuration, and CI workflows are retained in place.

## Account command center

The governance framework is maintained in [governance/](governance/).

- [Governance overview](governance/README.md)
- [Repository catalog](governance/REPOSITORY_CATALOG.md)
- [Classification policy](governance/CLASSIFICATION_POLICY.md)
- [Operating policy](governance/OPERATING_POLICY.md)
- [Organization roadmap](governance/ROADMAP.md)
- [Public machine-readable inventory](governance/data/repositories.public.json)

**Inventory baseline (2026-11-11):** 72 repositories visible to the connected account — 48 public and 24 private. The public catalog intentionally excludes private repository names and metadata.

## Existing application

The existing project is described in [docs/](docs/), with the application source and supporting infrastructure preserved in their current locations.

- Python project metadata: [pyproject.toml](pyproject.toml)
- Application source: [src/](src/)
- Frontend: [frontend/](frontend/)
- Database migrations: [migrations/](migrations/)
- Tests: [tests/](tests/)
- Container configuration: [docker-compose.yml](docker-compose.yml)

## Change and safety policy

- Governance changes are proposed on dedicated branches and reviewed through pull requests.
- Existing application code and Git history are preserved.
- No repository is renamed, deleted, archived, transferred, or made public/private by this catalog.
- Private repository details and secrets must never be published here.
- Lifecycle and duplicate decisions require evidence from repository history and contents.

## Documentation

Start with [governance/README.md](governance/README.md) for account organization, or [docs/index.md](docs/index.md) for the existing application documentation.
