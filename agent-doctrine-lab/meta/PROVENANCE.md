# Provenance

## Assembly Date

2026-06-09

## Source Materials

| Target file | Source |
|---|---|
| `doctrine/THE_ART_OF_DESIGN.md` | Uploaded `THE_ART_OF_DESIGN.md` v0.4 |
| `doctrine/THE_ART_OF_NAMING.md` | Recovered from uploaded `THE_ART_OF_NAMING.md` search corpus and prior doctrine snippets |
| `aodp/AODP_CORE.md` | Uploaded `AODP_CORE.md` v1.8 |
| `aodp/AODP_CONTEXT.md` | Uploaded `AODP_CONTEXT.md` |
| `aodp/TRADEOFFS.md` | Uploaded `TRADEOFFS.md` |
| `aodp/JOURNAL.md` | Uploaded `JOURNAL.md` |
| `aodp/self-audit-results.yaml` | Uploaded AODP self-audit result |
| `aodp/audit/*.py` | Uploaded AODP audit scripts |

## Assembly Notes

This pack is structured for cloud-agent review rather than local runtime execution.

The GitHub-staged copy is under `arhsmoque/arh-artifacts/agent-doctrine-lab/` because the active GitHub connector exposes repository file operations but does not expose create-repository.

The complete assembled pack is available as `agent-doctrine-lab.zip` in the ChatGPT sandbox output.

## Known Liens

```yaml
liens:
  - id: github_new_repo_creation_unavailable
    status: open
    detail: "The active GitHub connector exposes repository file/commit operations but no create-repository operation."
    recommended_resolution: "Create a dedicated repository manually or with a GitHub tool that exposes create-repo, then move this directory to repository root."
  - id: art_of_naming_recovered_baseline
    status: open
    detail: "The full canonical source file was not mounted in the local sandbox. The included file is recovered from available uploaded corpus snippets."
    recommended_resolution: "Replace with exact canonical THE_ART_OF_NAMING.md if exported later."
```
