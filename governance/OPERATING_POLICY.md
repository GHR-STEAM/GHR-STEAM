# Repository Operating Policy

## 1. Change control

- The default branch is protected by process: propose changes on a dedicated branch and review them through a pull request.
- No direct push to the default branch for governance changes.
- No deletion, archival, transfer, rename, visibility change, collaborator/permission change, or Git-history rewrite without separate explicit approval.
- For high-impact changes, create a rollback plan and verify a restorable backup before execution.
- Every change must identify its scope, rationale, evidence, risk, validation, and rollback path.

## 2. README standard

Each maintained original project should document:

1. Project purpose and current status.
2. Main capabilities and intended users.
3. Supported platforms and prerequisites.
4. Installation and configuration.
5. Usage examples.
6. Testing and development commands.
7. Architecture or key components.
8. Security and data-handling notes.
9. License and contribution guidance.
10. Known limitations and support status.

Do not fabricate capabilities, test results, compatibility, performance claims, or release status.

## 3. Repository structure

Use a structure appropriate to the language and project type. Common conventions include:

- src/ for application or library source, when applicable.
- tests/ for automated tests, when applicable.
- docs/ for user and engineering documentation.
- .github/workflows/ for CI and automation.
- .github/ISSUE_TEMPLATE/ and .github/PULL_REQUEST_TEMPLATE.md for contribution workflows.

Do not move files merely to satisfy a template. Preserve build systems, framework conventions, generated-code boundaries, migrations, deployment assets, and existing imports.

## 4. Security baseline

For each eligible repository, assess:

- Dependabot version updates and security alerts.
- Secret scanning and push protection availability.
- Code scanning (CodeQL or a suitable alternative).
- Least-privilege GitHub Actions permissions.
- Pinned or controlled third-party Actions where practical.
- Protected default branch and pull-request review requirements.
- Environment secrets stored in GitHub settings, never committed.
- Dependency and license risks.

This policy records the target baseline; it does not claim that account-wide settings are already enabled.

## 5. Project management

Use GitHub Projects for portfolio-level prioritization and Issues for actionable work. Use Discussions when the repository has an active collaborative community or design discussion need.

Recommended issue labels:

- type:bug
- type:feature
- type:maintenance
- type:security
- priority:p0, priority:p1, priority:p2
- status:triage, status:planned, status:blocked

## 6. Backup and recovery

Before destructive or high-impact operations:

- Preserve repository source and relevant Git refs.
- Verify backup completeness and integrity.
- Include tags, branches, releases, LFS objects, and required assets.
- Record backup location, timestamp, method, and verification result.
- Test restoration where practical.

## 7. Evidence and reporting

Every audit result must include:

- Repository URL and audit timestamp.
- Exact evidence inspected.
- Findings separated from assumptions.
- Confidence level.
- Recommended action and risk.
- Explicit approval state.
- Verification result after any change.

Never report an action as complete unless the resulting GitHub state has been checked.
