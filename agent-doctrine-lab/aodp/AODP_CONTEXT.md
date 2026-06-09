<!-- AODP GOVERNANCE ACTIVE -->
<!-- AODP v1.8 — artifact in scope. Read the section matching your task mode. -->

## AODP Gate — Artifact in Scope

This prompt references an AODP-governed artifact or workflow. Apply the section below that matches your **task mode**.

---

### Mode A — Audit / Review
*Use this when: assessing, auditing, checking, reviewing, or analyzing an existing artifact.*

Run the conformance audit:

```powershell
# Dry-run first (shows which checks would fire, no execution)
uv run --script "D:\ARH\00_charter\aodp\audit\aodp_audit.py" --type <surface_type> --target <artifact_path> --dry-run

# Full standard audit
uv run --script "D:\ARH\00_charter\aodp\audit\aodp_audit.py" --type <surface_type> --target <artifact_path> --depth standard
```

Surface types: `mcp` | `cli` | `webapp` | `skill` | `worker` | `contract` (alias `docs`) | `auto`

- Use `contract` (or `docs`) for design-brief / schema / documentation directories — they DEFINE
  envelopes/policies rather than emit them, so runtime envelope/exit-code checks are marked **N/A**
  (not failed). Audit the *implementing binary* as its own surface (e.g. `cli`/`mcp`).
- Use `auto` to let the auditor detect the surface and warn if your `--type` looks mismatched.
- v1.8 verdict semantics: checks are **applicable / N-A**; applicable checks are **blocking** or
  **advisory** (Production-only niceties are advisory — they cap the level but never fail the run).
  Score is `passed/applicable`. Don't game a red score by mis-typing the surface — pick the right one.

**Waiving a check** — use `--waive` to acknowledge an intentional deviation with documented rationale. Waiver is logged to `_agent-output/aodp_overrides.jsonl`, not hidden:

```powershell
uv run --script "...\aodp_audit.py" --type webapp --target <path> --waive webapp_no_hardcoded_secrets "client-side key, $3-cap, acknowledged in config.ts"
```

**Exit codes:** `0` = all pass · `1` = checks failed (audit ran correctly) · `2` = invocation error

---

### Mode B — Build / Design
*Use this when: creating, modifying, scaffolding, or implementing an artifact.*

Before writing code, verify:

1. **A design brief exists** at the artifact root, named `<artifact>.design-brief.md`
   (inferable per `reference\THE_ART_OF_NAMING.md` §4 — never a bare `DESIGN_BRIEF.md`,
   which is indistinguishable across search results). If absent, create one via `aodp-init.ps1`
   (below) or from the template at `templates\DESIGN_BRIEF.md`. Legacy flat `DESIGN_BRIEF.md`
   files are still detected for back-compat.

2. **Surface type is declared** — determines which adapter rules load (`mcp`/`cli`/`webapp`/`skill`/`worker`/`contract`)

3. **Risk class is declared** — determines whether approval gate + dry-run are required

Core invariants (apply to every artifact, no exceptions):

| Rule | Why |
|---|---|
| Structured envelope on all outputs (`status`, `trace_id`, `summary`, `data`) | Stateless agents route on structure, not prose |
| Every error includes `remediation` | Cold-started agent cannot self-correct without it |
| Mutating ops gated: verify → prepare → approve → execute | Protects against irreversible agent actions |
| Names describe intent, not topology (`resolve_recipients` not `helper`) | Agent must infer tool purpose from name alone |
| AGENTS.md covers happy path + every failure mode | Cold-started agent reads this first |

Initialize a new artifact directory:

```powershell
pwsh -File "D:\ARH\00_charter\aodp\aodp-init.ps1" -Target <artifact_path> -Surface <surface_type>
```

Run the audit before declaring done (see Mode A above).

---

### Adapter docs

| Surface | Doc |
|---|---|
| MCP server | `adapters/MCP_ADAPTER.md` |
| CLI tool | `adapters/CLI_ADAPTER.md` |
| Web app / PWA | `adapters/WEBAPP_ADAPTER.md` |
| Skill file | `adapters/SKILL_ADAPTER.md` |
| Worker / job | `adapters/WORKER_ADAPTER.md` |
| Contract / design / docs | `audit/AODP_QAQC_v1.8_REDESIGN.md` (checker: `audit/adapters/aodp_contract_audit.py`) |

Base: `D:\ARH\00_charter\aodp\adapters\`
<!-- END AODP GATE -->
