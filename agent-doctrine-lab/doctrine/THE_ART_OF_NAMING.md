# The Art of Naming

**Status:** Recovered baseline from uploaded corpus snippets and AODP references  
**Scope:** Naming doctrine for agent-operable systems, tools, files, schemas, protocols, dashboards, hooks, and governance surfaces.

## 0. What This Doctrine Is

The Art of Naming treats names as inference design.

A name is not decoration. A name is a cognitive handle that helps a human or agent decide what to open, call, trust, modify, ignore, search for, or review.

In agent-operated systems, poor names create operational risk because agents route on names before they have full context.

The core rule:

```text
A name should help the least-context reader make the right first decision.
```

## 1. Names Are Interfaces

A public name is part of the system interface. This applies to files, tools, commands, functions, schemas, events, hooks, dashboards, views, reports, protocols, and handoff packets.

A good name exposes:

- what the thing is;
- what it acts on;
- whether it reads, prepares, applies, verifies, deletes, migrates, or archives;
- whether it is stable or temporary;
- whether it is broad or narrow;
- whether it requires approval;
- which lifecycle stage it belongs to.

## 2. User-Facing vs Agent-Facing Names

User-facing names may be friendly, loose, and natural. Agent-facing names should be precise, stable, literal, and low ambiguity.

A user may say:

```text
check what broke
```

An agent-facing operation should be named:

```text
diagnose_recent_failure
```

A user may say:

```text
make the edit safely
```

The agent-facing path should separate:

```text
prepare_patch
apply_patch
```

Use user-facing language at the interaction boundary. Use agent-facing precision at the execution boundary.

## 3. Name by Outcome, Not Backend

Bad names expose topology. Better names expose intent.

Weak:

```text
github_api_call
mcp_search_handler
db_processor
script_runner
json_service
hook_handler
```

Stronger:

```text
list_open_issues
find_relevant_files
summarize_run_artifacts
record_task_event
prepare_patch
verify_result_envelope
```

Backend-shaped names make agents think in implementation mechanics. Outcome-shaped names make agents think in user goals and system responsibilities.

Use backend terms only when the backend is the user-visible domain.

Acceptable:

```text
inspect_git_status
query_duckdb_table
validate_json_schema
```

## 4. Run the Inferability Test

Given only the name, can a new agent infer:

- whether it reads or mutates;
- what object it acts on;
- whether it is broad or narrow;
- what output shape is likely;
- whether it needs approval;
- whether it is temporary or stable;
- whether it belongs to research, design, build, runtime, governance, or migration?

If not, rename.

A good name should survive low context. A weak name depends on nearby explanation.

Inferability examples:

| Name | Likely inference |
|---|---|
| `read_span` | Read a bounded span of content |
| `find_files_by_name` | Locate files using name/path terms |
| `search_file_content` | Search inside file contents |
| `inspect_file_metadata` | Return metadata without content mutation |
| `prepare_patch` | Stage a change, probably dry-run or preview |
| `apply_patch` | Mutate files by applying a prepared patch |
| `verify_build_output` | Check build output against expectations |
| `archive_completed_task` | Move a completed task out of active state |
| `migrate_result_schema` | Change schema with compatibility concern |

Poor inferability examples:

```text
process
handle
manager
runner
helper
service
do_task
execute
sync
fix
```

## 5. Avoid Vague Nouns

Avoid vague nouns unless the domain responsibility is precise.

Weak nouns:

```text
manager
helper
util
runner
processor
handler
service
engine
system
module
thing
worker
```

These words often hide responsibility. They can be used when qualified and accurate.

Acceptable:

```text
task_session_manager
policy_decision_engine
event_recording_worker
schema_validation_service
```

But prefer action or responsibility when naming an operation:

```text
open_task_session
evaluate_policy_decision
record_event
validate_schema
```

## 6. Name for the Least-Context Reader

Assume the next reader has no memory of the conversation.

Names should remain useful to:

| Reader | Naming need |
|---|---|
| First-time user | Plain recognition |
| Maintainer | Responsibility and lifecycle clues |
| Weak agent | Low-ambiguity operation selection |
| Strong agent | Architectural boundary preservation |
| Stateless agent | Context recovery from names alone |
| Search/index system | Keyword-rich retrieval |
| Reviewer/auditor | Safety, authority, and migration visibility |

The least-context reader test is simple:

```text
Would this name still make sense if copied into a different folder, search result, or handoff packet?
```

## 7. Name Files as Searchable Artifacts

File names are part of the interface.

Weak:

```text
DESIGN_BRIEF.md
notes.md
final.md
protocol.md
schema.json
output.md
```

Stronger:

```text
arh-governance-model.design-brief.md
sentinel-stage1-shadow-parity.report.md
THE_ART_OF_DESIGN.md
THE_ART_OF_NAMING.md
result_envelope.schema.json
ATBIP_HANDOFF_agent_filesystem_read.md
```

For repeatable artifact types, prefer a predictable suffix:

```text
<artifact>.design-brief.md
<artifact>.decision-record.md
<artifact>.handoff.md
<artifact>.review.md
<artifact>.schema.json
<artifact>.runbook.md
```

Avoid a directory full of identical filenames unless the path alone is guaranteed to be available to the reader.

## 8. Use Safety Verbs

Verbs should reveal risk and lifecycle stage.

Prefer:

```text
inspect_
read_
find_
search_
prepare_
verify_
apply_
archive_
delete_
migrate_
```

Safety should be visible before execution.

## 9. Avoid False Synonyms

Do not create multiple names for the same concept unless each name represents a real operational distinction.

Weak synonym set:

```text
search_files
find_files
locate_files
discover_files
```

Better if distinctions are real:

```text
find_files_by_name
search_file_content
list_recent_files
inspect_file_metadata
```

User-facing synonyms are allowed. Agent-facing synonyms should be rare.

## 10. Preserve Names During Mechanical Porting

During mechanical porting, preserve source names unless blocked by syntax, reserved words, public API requirements, safety clarity, target ecosystem conventions, or explicit migration decision.

Use this rule:

```text
Port first.
Prove parity.
Then rename at the boundary if needed.
```

## 11. Rename as Migration

Renaming a public tool, command, schema, resource path, filename convention, event name, or protocol artifact is a migration.

Public renames require:

- reason;
- old name;
- new name;
- compatibility impact;
- alias or fallback when practical;
- deprecation note;
- version bump when behavior or contract changes;
- recipe update;
- documentation update;
- journal entry.

Use a rename record:

```yaml
rename_record:
  old_name: ""
  new_name: ""
  artifact_type: "file | command | tool | schema | resource | protocol | event | hook | view"
  reason: ""
  compatibility_impact: ""
  alias_or_fallback: ""
  deprecation_note: ""
  version_impact: ""
  recipes_updated: []
  journal_entry: true
```

Public names are part of the system memory. Renaming without migration breaks that memory.

## 12. Naming Patterns by Artifact Type

### Protocols and doctrines

```text
THE_ART_OF_NAMING.md
THE_ART_OF_DESIGN.md
AGENT_TOOL_BUILD_IMPLEMENTATION_PROTOCOL.md
RESEARCH_TO_BUILD_SYNTHESIS_PROTOCOL.md
```

### Runtime skills

```text
SKILL.md
art-of-design/SKILL.md
tool-salvaging/SKILL.md
```

### Schemas

```text
result_envelope.schema.json
command_ledger.schema.json
event_record.schema.json
governance_matrix.schema.json
```

### Handoff packets

```text
ATBIP_HANDOFF_agent_filesystem_read.md
sentinel-stage1-shadow-parity.handoff.md
```

### Design briefs

```text
arh-governance-model.design-brief.md
observability-layer.design-brief.md
context-architecture.design-brief.md
```

### Decision records

```text
sentinel-hook-boundary.decision-record.md
dashboard-signal-priority.decision-record.md
```

### Reports

```text
sentinel-stage1-shadow-parity.report.md
aodp-audit-mission-hq.report.md
```

### Commands and tools

```text
find_relevant_files
read_span
prepare_patch
apply_patch
verify_build_output
summarize_run_artifacts
diagnose_recent_failure
```

### Hooks

```text
pretooluse_policy_gate
posttooluse_event_recorder
userpromptsubmit_context_injector
stop_session_recorder
```

### Dashboards and views

```text
management_risk_overview
operator_failure_drilldown
agent_trace_evidence_view
governance_exception_audit_view
```

## 13. Naming Review Checklist

Before accepting a public name, ask:

```text
Can a future agent infer purpose, scope, and risk from the name?
Would a human search for this file or tool using this name?
Does the name reveal read, prepare, apply, verify, delete, or migrate behavior?
Does it avoid false synonyms?
Does it avoid backend-shaped phrasing unless backend is the domain?
Would the name still make sense in a search result without its folder path?
```

## 14. Compact Thesis

Names are not labels. Names are operational memory.

A good name lowers discovery cost, reduces wrong-tool selection, reveals safety posture, supports search, preserves boundary clarity, and helps future agents recover context.

Naming is not cosmetic.

Naming is inference design.
