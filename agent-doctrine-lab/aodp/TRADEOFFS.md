# AODP Design Trade-Offs

**Status:** Active record  
**Version:** v1.8  
**Applies to:** AODP Core Protocol + all adapters  

---

## Trade-Off Record

```yaml
tradeoff:
  decision: "AODP v1.8 governance model"
  optimize_for:
    - cold_start_agent_safety
    - structural_operability
    - governance_repeatability
    - stateless_recovery
  preserve:
    - human_authority_over_mutations
    - traceability_across_sessions
    - backward_compatibility_during_migration
    - audit_verdict_integrity
  sacrifice_or_deprioritize:
    - agent_iteration_speed
    - author_creative_freedom
    - output_brevity
    - runtime_performance
    - flexibility_of_convention
  rejected_alternatives:
    - trusted_context_exception_for_approval_gates
    - prose_only_status_reporting
    - optional_approval_gates_for_low_risk
    - adapter_agnostic_unified_frontmatter
    - single_conformance_level_instead_of_ladder
  reason: >
    §0 governing principle: the most limited agent must operate safely.
    If the weakest plausible agent can run the workflow without human rescue,
    all stronger agents are covered by definition.
  acceptable_cost: >
    - 10–20% agent slowdown for prepare/approve/execute gates
    - ~15% token overhead for structured envelopes vs. prose
    - ~5% file-size overhead for AGENTS.md + journal.md + changes.jsonl
    - One-time migration cost from UBAP v1.6 / PARA
  unacceptable_cost: >
    - Unintended external mutation by autonomous agents
    - Silent failures without remediation paths
    - Cold-start agents stalled due to missing context
    - Operator unable to inspect or override agent decisions
  reopen_if:
    - Agent capability baseline shifts significantly (e.g., reliable long-context)
    - New runtime surfaces emerge not covered by current adapters
    - Audit false-positive rate exceeds 10% across artifacts
    - Maintenance capacity for adapters falls below 2 active reviewers
```

---

## Optimization: Cold-Start Agent Safety

**What this means:** Every artifact must be operable by an agent with no memory of prior sessions, no human in the loop, and no implicit context.

**What we pay:**
- AGENTS.md must be exhaustive (happy path + every failure mode)
- Every error needs a `remediation` field
- Every mutating operation needs a gate
- Names must be fully inferable

**Why it is worth it:** A stateless agent that can operate safely removes the human bottleneck for routine work. A stateless agent that cannot operate safely becomes a liability.

---

## Optimization: Structural Operability

**What this means:** Agents route on structure (`status`, `trace_id`, `data`) not on prose.

**What we pay:**
- Every output-producing operation must emit an envelope
- Envelope fields are mandatory even for trivial operations
- JSON overhead vs. plain text

**Why it is worth it:** A structured envelope is a contract. A contract can be validated, tested, and reasoned about mechanically. Prose cannot.

---

## Sacrifice: Agent Iteration Speed

**What we give up:** The fastest path from intent to execution.

**How it shows up:**
- Approval gates add steps
- Dry-run adds steps
- AGENTS.md must be read before operating
- Audit must pass before declaring done

**Mitigation:** The conformance ladder (Level 0 → 1 → 2 → 3) allows experimental work to proceed with lighter proof. Only Production-level artifacts require full-depth audit.

---

## Sacrifice: Author Creative Freedom

**What we give up:** Unlimited freedom in naming, file structure, and output shape.

**How it shows up:**
- `helper()` and `util()` are prohibited
- `DESIGN_BRIEF.md` is not acceptable; must be `<artifact>.design-brief.md`
- JSON field names are constrained
- Skill frontmatter has a closed key set

**Mitigation:** Adapters provide domain-specific freedom within bounded spaces. A webapp adapter can define CSS conventions; a CLI adapter can define flag patterns. Core remains strict; adapters are permissive within their scope.

---

## Rejected: Trusted Context Exception

**Why it was considered:** Some operations feel safe enough to skip approval gates when the agent "knows" the context.

**Why it was rejected:** §5 is explicit: *"There is no 'trusted context' exception — the pattern exists precisely because context cannot be trusted across agent sessions."* A session boundary resets all context. An exception that works in one session becomes a hazard in the next.

---

## Rejected: Adapter-Agnostic Unified Frontmatter

**Why it was considered:** A single frontmatter schema for all agents (Claude, Codex, Gemini, Kimi) would simplify skill authoring.

**Why it was rejected:** Each agent runtime has different capabilities, tool names, and invocation models. A lowest-common-denominator schema would force every agent to operate at the weakest runtime's level. The adapter model (per-agent frontmatter conventions) preserves each runtime's strengths while keeping core policy uniform.

**Seam:** The skill compiler stage (see `D:\ARH\06_context-pipeline\compile-skills\`) normalizes cross-agent skill metadata into a unified `skill_registry` table while preserving per-agent frontmatter at the source.

---

## When to Reopen

| Signal | Action |
|---|---|
| Agent models reliably handle 1M+ token context | Revisit AGENTS.md size budget and progressive disclosure thresholds |
| New surface type (e.g., browser extension, mobile app) | Create new adapter; do not stretch existing adapter scope |
| Audit false-positive rate > 10% | Review applicability logic in §9.1; may need N/A rule refinement |
| Adapter maintenance falls to < 2 reviewers | Deprecate least-used adapter or merge into broader adapter |
| Operator requests override capability > 2× per month | Add operator transparency surface (dashboard/TUI) to core |
