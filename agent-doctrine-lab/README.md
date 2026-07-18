# Agent Doctrine Lab

**Status:** Active doctrine repository scaffold  
**Scope:** Art of Design, Art of Naming, and Agent-Operable Design Protocol materials arranged for human and cloud-agent review.

This repository path is a review surface for three related doctrine streams:

1. **The Art of Design** — purpose-first system design under finite reality, trade-offs, canonical path discipline, operator transparency, context sufficiency, governance, and evolution.
2. **The Art of Naming** — naming as inference design: names as cognitive handles, search keys, safety signals, and governance anchors.
3. **AODP** — Agent-Operable Design Protocol, a governance layer for making artifacts safe and understandable to cold-started agents.

The repository is shaped for cloud agents that need to assess, review, critique, or extend the doctrine without reading a full conversation history.

---

## Read Order

| Order | File | Purpose |
|---:|---|---|
| 1 | `README.md` | Human entry and repository map |
| 2 | `AGENTS.md` | Cloud-agent operating instructions |
| 3 | `doctrine/THE_ART_OF_DESIGN.md` | Main design doctrine |
| 4 | `doctrine/THE_ART_OF_NAMING.md` | Main naming doctrine |
| 5 | `aodp/AODP_CORE.md` | Agent-operability protocol core |
| 6 | `aodp/TRADEOFFS.md` | Explicit optimize / preserve / sacrifice record |
| 7 | `review/REVIEW_GUIDE.md` | Review criteria and expected reviewer output |
| 8 | `meta/PROVENANCE.md` | Source and assembly notes |

---

## Intended Layout

```text
agent-doctrine-lab/
├── README.md
├── AGENTS.md
├── doctrine/
│   ├── THE_ART_OF_DESIGN.md
│   └── THE_ART_OF_NAMING.md
├── aodp/
│   ├── AODP_CORE.md
│   ├── AODP_CONTEXT.md
│   ├── TRADEOFFS.md
│   ├── JOURNAL.md
│   ├── self-audit-results.yaml
│   └── audit/
│       ├── aodp_audit.py
│       └── aodp_base_audit.py
├── review/
│   ├── REVIEW_GUIDE.md
│   └── REVIEW_PACKET.md
└── meta/
    ├── PROVENANCE.md
    └── changes.jsonl
```

---

## Doctrine Relationship

```text
THE_ART_OF_DESIGN
  └─ explains how to think before building

THE_ART_OF_NAMING
  └─ explains how names become inference, search, safety, and governance surfaces

AODP
  └─ turns these principles into agent-operable governance rules, checks, and audit evidence
```

A reviewer should not treat these as three unrelated essays. They form a stack:

```text
worldview -> naming discipline -> agent-operable governance
```

---

## Review North Star

```text
Can a cold-started cloud agent understand this repository,
identify the doctrine boundaries,
review the materials without hidden context,
and propose improvements without corrupting the core intent?
```

---

## Current Liens

- The active GitHub connector exposes file/commit operations on existing repositories, but not a create-repository action. This path is therefore staged under `arhsmoque/arh-artifacts` rather than a newly created repository.
- The complete assembled pack is also available as a downloadable ZIP from the ChatGPT sandbox.
- Replace this staged folder with a dedicated repository root once repo creation is available.

---

## Review Output Format

```yaml
review:
  reviewer: ""
  date: "YYYY-MM-DD"
  scope: "design | naming | aodp | whole_stack"
  verdict: "accept | accept_with_lien | revise | block"
  strengths: []
  risks: []
  gaps: []
  over_gating: []
  under_gating: []
  structural_recommendations: []
  suggested_patches: []
  must_not_break: []
```
