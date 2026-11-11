# Repository Classification Policy

## Portfolio categories

| Category | Scope |
|---|---|
| AI & Agents | AI agents, coding assistants, model integrations, agent protocols, and automation |
| AI Infrastructure | MCP servers, memory systems, model gateways, inference and orchestration infrastructure |
| E-Commerce | Online stores, digital products, payments, catalogues, and order systems |
| Developer Tools | IDE extensions, CLI tools, libraries, build tooling, and developer productivity |
| Android & TV | Android applications, Android TV, Google TV, Chromecast, and device tooling |
| Windows Tools | Windows utilities, desktop automation, diagnostics, and system tooling |
| Documentation & Learning | Documentation sites, guides, examples, and learning repositories |
| Open-Source Mirrors | Forks or mirrors of upstream open-source projects |
| Experiments | Prototypes, temporary tests, proof-of-concepts, and Codespaces experiments |
| Needs Triage | Repositories whose purpose or ownership is not yet established |
| Archived | Completed or inactive repositories intentionally retained read-only |

A repository may have one primary category and optional secondary tags. Do not force a repository into a category when evidence is insufficient.

## Lifecycle states

- **Active:** evidence of current maintenance or planned ongoing work, confirmed by owner or recent meaningful commits.
- **Paused:** valid project with no current work, but retained for possible resumption.
- **Archived:** intentionally read-only and retained for historical/reference purposes.
- **Duplicate candidate:** substantial overlap is detected, but no merge/deletion decision has been made.
- **Needs triage:** purpose, ownership, origin, or status is unclear.

Do not use repository size, name, visibility, or a single timestamp as the sole lifecycle signal.

## Mirror and fork handling

Before classifying a repository as a mirror:

1. Inspect GitHub fork metadata and upstream repository.
2. Compare commit ancestry and default branches.
3. Identify local commits and local-only files.
4. Determine whether the repository is a maintained fork, a mirror, or an independent derivative.
5. Preserve attribution, license notices, and upstream references.

## Naming policy

For repositories owned as original projects, prefer concise, descriptive, lowercase kebab-case names. Preserve upstream names for genuine forks/mirrors unless a rename is justified and explicitly approved.

## Classification confidence

- **High:** supported by source code, documentation, and repository metadata.
- **Medium:** supported by README and a consistent file structure.
- **Low:** based only on name or limited metadata.

The initial catalog uses provisional categories only; no final lifecycle labels have been assigned.
