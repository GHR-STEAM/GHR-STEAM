# GHR-STEAM Account Command Center

This directory is the governance and portfolio-management layer for the GitHub account GHR-STEAM.

It is intentionally additive: it does not replace the existing GHR-STEAM application, its source tree, database migrations, frontend, tests, Docker assets, or existing CI/security workflows.

## Start here

- [Repository catalog](REPOSITORY_CATALOG.md) — public repository inventory and audit state.
- [Classification policy](CLASSIFICATION_POLICY.md) — portfolio categories and lifecycle definitions.
- [Operating policy](OPERATING_POLICY.md) — naming, documentation, security, backup, and change-control standards.
- [Roadmap](ROADMAP.md) — staged execution plan.
- [Public inventory data](data/repositories.public.json) — machine-readable public repository snapshot.
- [Original profile README](archive/README_PROFILE_TEMPLATE_ORIGINAL.md) — preserved copy of the previous root README.

## Current audit baseline

Snapshot date: **2026-11-11**

- 72 repositories visible to the connected account.
- 48 public repositories.
- 24 private repositories.
- 0 repositories currently marked archived in the returned inventory.

The public catalog intentionally excludes private repository names and metadata. Lifecycle, activity, duplication, fork/origin, and security states remain **unverified** until a deeper audit is completed.

## Governance principles

1. Preserve existing source code, Git history, branches, tags, releases, and project data.
2. Treat repository names and sizes as clues, never as proof of project status or duplication.
3. Prefer review branches and pull requests over direct changes to the default branch.
4. Do not delete, archive, transfer, rename, merge, or change visibility without a separate explicit approval.
5. Never publish private repository metadata, credentials, tokens, or secrets in this public repository.
6. Record evidence and verification status for every material decision.
