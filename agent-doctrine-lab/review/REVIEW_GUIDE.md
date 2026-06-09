# Review Guide

Use this guide when reviewing the doctrine stack.

## Review Axes

| Axis | Question |
|---|---|
| Coherence | Do the three doctrine streams reinforce each other? |
| Agent operability | Can a cold-started agent understand what to read and what to do? |
| Naming quality | Do names reveal purpose, risk, lifecycle, and artifact type? |
| Governance fit | Does AODP operationalize the doctrine without becoming bureaucracy? |
| Context economy | Are reviewers given enough context without being forced through noise? |
| Evolvability | Can the doctrine be extended without corrupting the core? |
| Auditability | Is evidence preserved for current claims? |

## Specific Checks

```yaml
checks:
  design_doctrine:
    - ought_statement_present
    - finite_reality_present
    - tradeoff_logic_present
    - canonical_path_discipline_present
    - operator_transparency_present
    - governance_and_evolution_present
  naming_doctrine:
    - inferability_test_present
    - safety_verbs_present
    - false_synonym_rule_present
    - rename_as_migration_present
    - artifact_naming_patterns_present
  aodp:
    - core_principle_present
    - result_envelope_present
    - mutation_safety_present
    - governance_files_present
    - audit_evidence_present
```

## Reviewer Output

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
