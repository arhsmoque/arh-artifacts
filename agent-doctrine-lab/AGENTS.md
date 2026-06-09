# AGENTS.md

## Scope

This file governs agent work inside `agent-doctrine-lab/`.

The repository contains doctrine and governance materials. Treat it primarily as a review and documentation surface, not an application codebase.

## Operating Rule

Read in this order:

1. `README.md`
2. `doctrine/THE_ART_OF_DESIGN.md`
3. `doctrine/THE_ART_OF_NAMING.md`
4. `aodp/AODP_CORE.md`
5. `aodp/TRADEOFFS.md`
6. `review/REVIEW_GUIDE.md`
7. `meta/PROVENANCE.md`

## What Agents Should Do

Agents may:

- review doctrine coherence;
- identify gaps, over-gating, under-gating, and contradictions;
- suggest clearer file structure;
- propose patch-ready edits;
- compare design doctrine, naming doctrine, and AODP alignment;
- generate review reports using `review/REVIEW_PACKET.md`.

Agents must:

- preserve core intent;
- distinguish doctrine, protocol, audit evidence, and provenance;
- cite exact files and sections when proposing changes;
- avoid rewriting the entire doctrine unless explicitly requested;
- keep final-state docs clean and place historical reasoning in journal or provenance records.

## What Agents Must Not Do

Agents must not:

- collapse the three doctrines into one large essay;
- rename public doctrine files without a migration record;
- remove AODP audit evidence to make the repository look cleaner;
- treat missing adapters as proof the core protocol is invalid;
- convert prose doctrine into rigid checklist-only form;
- add temporal notes such as `updated` or `new` inside current-state docs.

## Review Mode

When reviewing, return:

```yaml
review:
  verdict: "accept | accept_with_lien | revise | block"
  strengths: []
  risks: []
  gaps: []
  over_gating: []
  under_gating: []
  suggested_patches: []
  must_not_break: []
```

## Failure Modes

If a file is missing, do not infer that the doctrine does not exist. Report the missing file and continue with the nearest available source.

If a source appears reconstructed, mark the review confidence accordingly.

If AODP audit scripts cannot run because adapter files are absent, review the scripts statically and cite `aodp/self-audit-results.yaml` as the latest provided audit evidence.
