# Figma Sync Strategy

This document defines the programmatic strategy for keeping the African Puzzle Works design system synchronized with the Figma source of truth.

## Problem Statement

Static screenshots in `assets/screens/` can become stale when Figma designs change, leading to:
- Outdated component implementations
- Inconsistency between design and code
- Manual sync burden on the team

## Solution: Figma-First Live Fetching

### Primary Strategy: Live MCP Fetching

Instead of relying on static screenshots, Claude should **always fetch live design data from Figma** during implementation using the Figma MCP server.

## Implementation Workflow

### For Component Implementation

When implementing a component, Claude should:

1. **Fetch Live Screenshot**:
   ```
   Use mcp__figma__get_screenshot with:
   - fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
   - nodeId: [component-node-id]
   ```

2. **Fetch Design Context**:
   ```
   Use mcp__figma__get_design_context with:
   - fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
   - nodeId: [component-node-id]
   ```
   This returns:
   - Component structure
   - Measurements (padding, margins, dimensions)
   - Colors (hex values)
   - Typography (font family, size, weight, line height)
   - Spacing values

3. **Fetch Variable Definitions** (for tokens):
   ```
   Use mcp__figma__get_variable_defs with:
   - fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
   - nodeId: [component-node-id]
   ```
   This returns design token mappings.

4. **Fetch Metadata** (for structure overview):
   ```
   Use mcp__figma__get_metadata with:
   - fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
   - nodeId: [page-node-id]
   ```
   Use this to explore component hierarchy.

### For Screen Implementation

When implementing a screen:

1. **Fetch Live Screenshot First**:
   ```
   Get current visual state from Figma, not from static files
   ```

2. **Fetch Design Context**:
   ```
   Get measurements, colors, typography from live Figma data
   ```

3. **Cross-reference with Specs**:
   ```
   Compare live data with references/*.md specs
   If discrepancy detected, use Figma data (it's newer)
   ```

## Figma Component Registry

Maintain a registry of Figma node IDs for quick access:

### Design System Components

| Component | Node ID | Figma URL |
|-----------|---------|-----------|
| Buttons | 362-6 | https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6 |
| Bottom Sheets | 906-2533 | https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=906-2533 |
| View Headers | 7398-31867 | https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=7398-31867 |
| Primitives/Colors | 7353-10757 | https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=7353-10757 |
| Icons | 341-157 | https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=341-157 |

### Screen Examples

Add screen node IDs here as they're created in Figma.

## Agent Integration

### Update flutter-ui-designer Agent

The agent should follow this workflow:

```markdown
## Figma-First Implementation Workflow

1. **User provides Figma URL or mentions component name**

2. **Fetch Live Data**:
   - Use mcp__figma__get_screenshot to see current visual state
   - Use mcp__figma__get_design_context to get specifications
   - Use mcp__figma__get_variable_defs for design tokens

3. **Cross-Reference with Design System**:
   - Check if component exists in references/components.md
   - Compare live Figma specs with documented specs
   - If mismatch, flag the discrepancy and use Figma data

4. **Generate Widget Hierarchy**:
   - Use live measurements from Figma
   - Map colors to design tokens (but verify hex values)
   - Apply spacing from 8pt grid

5. **Note Any Changes**:
   - If Figma data differs from documented specs, note it
   - Suggest updating documentation if significant changes
```

### Update flutter-ui-implementer Agent

```markdown
## Implementation with Live Figma Data

1. **Before writing code, fetch latest from Figma**
2. **Use live measurements for pixel-perfect implementation**
3. **Verify colors match current Figma state**
4. **Flag if documented tokens don't match Figma values**
```

### Update flutter-design-iteration-coordinator Agent

```markdown
## Visual Comparison with Live Figma

1. **Fetch live Figma screenshot for comparison**
2. **Compare implementation screenshot with current Figma state**
3. **Don't use stale cached screenshots for validation**
4. **Report if Figma design has changed since implementation began**
```

## Automated Sync Checking

### Sync Verification Script

Create a script that periodically checks for design changes:

```python
#!/usr/bin/env python3
"""
Figma Sync Checker
Compares current Figma state with cached data to detect changes.
"""

import json
import os
from datetime import datetime

COMPONENTS = {
    "buttons": "362-6",
    "bottom-sheets": "906-2533",
    "view-headers": "7398-31867",
    "colors": "7353-10757",
    "icons": "341-157",
}

FILE_KEY = "8S2Jt5xKHfTmlI8rSR6AcX"
CACHE_FILE = "african-puzzle-works-design/.figma-cache.json"

def fetch_component_hash(file_key, node_id):
    """
    Fetch component data from Figma via MCP and generate hash.
    In practice, this would call the Figma API or MCP server.
    """
    # This is a placeholder - actual implementation would use Figma API
    # or trigger Claude with MCP tools
    pass

def check_for_changes():
    """
    Check if any components have changed in Figma.
    """
    # Load cache
    if os.path.exists(CACHE_FILE):
        with open(CACHE_FILE, 'r') as f:
            cache = json.load(f)
    else:
        cache = {}

    changes_detected = []

    for component_name, node_id in COMPONENTS.items():
        # Fetch current state from Figma
        current_hash = fetch_component_hash(FILE_KEY, node_id)

        # Compare with cached hash
        cached_hash = cache.get(component_name, {}).get('hash')

        if current_hash != cached_hash:
            changes_detected.append({
                'component': component_name,
                'node_id': node_id,
                'last_synced': cache.get(component_name, {}).get('last_synced'),
                'current_time': datetime.now().isoformat(),
            })

            # Update cache
            cache[component_name] = {
                'hash': current_hash,
                'last_synced': datetime.now().isoformat(),
            }

    # Save updated cache
    with open(CACHE_FILE, 'w') as f:
        json.dump(cache, f, indent=2)

    return changes_detected

if __name__ == "__main__":
    changes = check_for_changes()

    if changes:
        print(f"⚠️  {len(changes)} component(s) changed in Figma:")
        for change in changes:
            print(f"  - {change['component']} (node: {change['node_id']})")
        print("\nConsider updating documentation or re-fetching screenshots.")
    else:
        print("✅ All components in sync with Figma")
```

### GitHub Action for Automated Checks

Create `.github/workflows/figma-sync-check.yml`:

```yaml
name: Figma Sync Check

on:
  schedule:
    # Run daily at 9 AM UTC
    - cron: '0 9 * * *'
  workflow_dispatch: # Allow manual trigger

jobs:
  check-figma-sync:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Check Figma for changes
        run: |
          python scripts/figma-sync-check.py

      - name: Create issue if changes detected
        if: failure()
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: 'Figma Design Changes Detected',
              body: 'Components in Figma have changed. Consider updating documentation and re-generating code.',
              labels: ['design-sync', 'figma']
            })
```

## Best Practices

### For Developers Using Claude

1. **Always Provide Figma URLs**:
   ```
   "Implement this button: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6"
   ```
   Not: "Implement a button based on the screenshot"

2. **Let Claude Fetch Live Data**:
   ```
   "Get the latest design context from Figma for the View Header component"
   ```

3. **Verify Before Implementation**:
   ```
   "Check if the Figma design has changed since the last implementation"
   ```

### For Claude Agents

1. **Prefer MCP Tools Over Static Files**:
   - Use `mcp__figma__get_screenshot` instead of reading from `assets/screens/`
   - Use `mcp__figma__get_design_context` instead of only relying on `references/*.md`

2. **Cross-Reference and Flag Discrepancies**:
   ```markdown
   ⚠️ DESIGN CHANGE DETECTED:
   - Documented color: #3D2664 (Primary 500)
   - Current Figma color: #4A2F7A
   - Using Figma value (more recent)
   - Suggest updating references/tokens.md
   ```

3. **Cache Intelligently**:
   - Store fetched Figma data temporarily during a session
   - Don't re-fetch the same component multiple times in one session
   - But always fetch fresh for new sessions

## Static Screenshots: When to Use Them

Static screenshots are still useful for:

1. **Quick Reference**: Developers browsing the design system
2. **Offline Access**: When Figma MCP server is unavailable
3. **Historical Record**: Documenting design evolution
4. **Performance**: Faster loading than MCP calls for documentation

But they should be considered **supplementary**, not the source of truth.

## Versioning Strategy

### Track Figma Design Versions

Add to each reference file:

```markdown
<!-- Synced with Figma on: 2026-01-28 -->
<!-- Figma file version: 1.2.3 -->
<!-- Last verified node IDs match current Figma state -->
```

### Semantic Versioning for Design System

Use semantic versioning for the design system itself:

- **Major**: Breaking changes (color token renamed, component removed)
- **Minor**: New components, new variants
- **Patch**: Small tweaks (padding changed from 15px to 16px)

Track in `african-puzzle-works-design/VERSION`:
```
2.1.0
```

## Migration Path

### Phase 1: Immediate (Now)
- ✅ Document Figma node IDs in registry
- ✅ Update agent instructions to fetch live data
- ✅ Add Figma-first workflow to SKILL.md

### Phase 2: Short-term (Next Sprint)
- Create figma-sync-check.py script
- Set up GitHub Action for automated checks
- Add version tracking to reference files

### Phase 3: Long-term (Future)
- Build Figma webhook listener for real-time sync
- Automated PR creation when Figma changes detected
- Design system changelog generator from Figma history

## Emergency Fallback

If Figma MCP is unavailable:

1. Use static screenshots in `assets/screens/` as backup
2. Use documented specs in `references/*.md`
3. Flag implementation as "using cached/stale data"
4. Re-verify once MCP is available

## Success Metrics

Track:
- **Sync freshness**: Time since last Figma fetch
- **Discrepancy rate**: How often Figma differs from docs
- **Implementation accuracy**: Flutter UI fidelity to live Figma
- **Update frequency**: How often specs need updating

## Conclusion

By making Figma the primary source of truth and using MCP to fetch live data during implementation, we eliminate the stale screenshot problem. Static files become supplementary reference material, not the source of truth.

**Key Principle**: Always fetch, never assume.
