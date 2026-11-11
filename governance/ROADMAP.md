# Account Organization Roadmap

## Phase 0 — Preserve and establish governance (in progress)

- [x] Inspect current repository metadata and root layout.
- [x] Identify existing application structure and existing CI/security automation.
- [x] Create an isolated governance branch from main.
- [x] Preserve the previous root README before proposing a replacement.
- [x] Add governance policy and a public-only initial inventory.
- [ ] Review the pull request and validate all links and inventory counts.

## Phase 1 — Complete repository audit

- [ ] Retrieve full metadata for all 72 visible repositories.
- [ ] Audit all 48 public repositories.
- [ ] Audit the 24 private repositories without publishing their names or metadata.
- [ ] Capture commit activity, branches, tags, releases, forks, upstreams, and permissions.
- [ ] Inspect README, source layout, tests, CI, dependencies, and security posture.
- [ ] Identify duplicate candidates using evidence rather than names alone.

## Phase 2 — Portfolio classification

- [ ] Confirm primary category and tags for each repository.
- [ ] Confirm lifecycle state: active, paused, archived, or needs triage.
- [ ] Separate original projects from upstream mirrors and forks.
- [ ] Identify priority projects and projects requiring owner decisions.

## Phase 3 — Standardization

- [ ] Improve README files for maintained original projects.
- [ ] Add contribution and issue templates where useful.
- [ ] Normalize labels and project metadata.
- [ ] Apply project-appropriate folder conventions without disruptive file moves.
- [ ] Preserve upstream README/license attribution in mirrors.

## Phase 4 — Security and automation

- [ ] Review Dependabot configuration and alerts per repository.
- [ ] Review secret scanning and push protection availability.
- [ ] Review CodeQL/code scanning and GitHub Actions permissions.
- [ ] Review default-branch protection and PR review settings.
- [ ] Avoid enabling settings that could block current workflows until compatibility is checked.

## Phase 5 — Portfolio dashboard

- [ ] Build a portfolio view for status, category, priority, health, and last audit.
- [ ] Connect GitHub Projects to prioritized work.
- [ ] Create recurring audit procedure and owner review cadence.
- [ ] Keep private project data in a private location or private repository.

## Phase 6 — Acceptance

- [ ] Validate every proposed change and its rollback path.
- [ ] Confirm no source, branch, tag, release, or history was lost.
- [ ] Publish a final report with completed, pending, blocked, and approval-required actions.

## Approval gates

Renaming, archiving, deleting, transferring, changing visibility, changing permissions, merging repositories, rewriting history, or changing default-branch protections remain separate approval-gated actions.
