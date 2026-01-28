# Figma Component Registry

This file maps African Puzzle Works design system components to their Figma node IDs for quick MCP access.

## Figma File

- **File Key**: `8S2Jt5xKHfTmlI8rSR6AcX`
- **File Name**: African Puzzle Design System
- **Base URL**: `https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System`

## Design System Components

### Buttons
- **Node ID**: `362-6`
- **Full URL**: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=362-6
- **Contains**: Primary, Secondary, Text, Icon, Segmented button variants with all states
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
```
Screenshot: mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="362-6")
Context: mcp__figma__get_design_context(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="362-6")
```

### Bottom Sheets
- **Node ID**: `906-2533`
- **Full URL**: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=906-2533
- **Contains**: Action sheet, Selection sheet, Calendar sheet, Price sheet variations
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
```
Screenshot: mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="906-2533")
Context: mcp__figma__get_design_context(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="906-2533")
```

### View Headers
- **Node ID**: `7398-31867`
- **Full URL**: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=7398-31867
- **Contains**: 7 header variants (Default, Project, Calendar, Search, Tabs, Album, Contact)
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
```
Screenshot: mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="7398-31867")
Context: mcp__figma__get_design_context(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="7398-31867")
```

### Primitives / Colors
- **Node ID**: `7353-10757`
- **Full URL**: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=7353-10757
- **Contains**: Complete color palette with all shades (Primary, Basic, Success, Info, Warning, Danger)
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
```
Screenshot: mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="7353-10757")
Variables: mcp__figma__get_variable_defs(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="7353-10757")
```

### Icons & Flags
- **Node ID**: `341-157`
- **Full URL**: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=341-157
- **Contains**: White, Dark, and Other icon sets
- **Last Verified**: 2026-01-28

**MCP Fetch Commands**:
```
Screenshot: mcp__figma__get_screenshot(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="341-157")
Context: mcp__figma__get_design_context(fileKey="8S2Jt5xKHfTmlI8rSR6AcX", nodeId="341-157")
```

## Screen Examples

### TODO: Add Screen Node IDs

As screens are created in Figma, add them here with:
- Screen name
- Node ID
- Full URL
- Description
- Last verified date

Example format:
```markdown
### Home Screen
- **Node ID**: `[to-be-added]`
- **Full URL**: [to-be-added]
- **Contains**: [description]
- **Last Verified**: [date]
```

## Usage Instructions

### For Claude Agents

When implementing a component:

1. **Look up the component in this registry**
2. **Fetch live data using MCP tools**:
   ```
   Get screenshot: Use node ID from registry
   Get specs: Use get_design_context with same node ID
   Get tokens: Use get_variable_defs if needed
   ```
3. **Use the live data for implementation**, not static screenshots
4. **Cross-reference with `references/*.md` for additional context**

### For Developers

When adding a new component to Figma:

1. Create the component in Figma
2. Get the node ID from the Figma URL
3. Add entry to this registry
4. Update `references/components.md` with specifications
5. Optional: Export static screenshot to `assets/screens/` for quick reference

### Getting Node IDs from Figma

The node ID is in the Figma URL after `node-id=`:

```
https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=362-6
                                                         ^^^^^^
                                                       Node ID
```

Note: Figma uses both `-` and `:` as separators. Both formats work:
- `362-6` (hyphen format, used in URLs)
- `362:6` (colon format, sometimes used in Figma API)

MCP tools accept both formats.

## Maintenance

### When to Update This File

- ✅ When adding new components to Figma
- ✅ When restructuring Figma file (node IDs may change)
- ✅ When component locations move in Figma
- ✅ Quarterly verification of all node IDs

### Verification Checklist

Run this checklist quarterly or when Figma file is restructured:

- [ ] All node IDs resolve to correct components
- [ ] URLs open to correct Figma frames
- [ ] No broken or outdated references
- [ ] New components have been added
- [ ] Deprecated components have been removed
- [ ] Last verified dates are updated

### Figma File Version

Track major Figma file changes here:

- **v1.0.0** (2026-01-15): Initial design system
- **v1.1.0** (2026-01-28): Added View Headers, Bottom Sheets
- **Current**: v1.1.0

## Troubleshooting

### "Component not found" Error

If MCP tools return "component not found":

1. Check if node ID is still valid (may have changed)
2. Verify file key is correct
3. Ensure you have access to the Figma file
4. Try both hyphen and colon formats (`362-6` vs `362:6`)

### Node ID Changed

If Figma components are restructured:

1. Open Figma file
2. Navigate to component
3. Copy new node ID from URL
4. Update this registry
5. Notify team of the change
6. Re-fetch any cached data

## Related Files

- `references/figma-sync-strategy.md` - Strategy for keeping design system in sync
- `references/components.md` - Detailed component specifications
- `assets/screens/README.md` - Screenshot organization and naming
- `SKILL.md` - Main skill documentation with Figma integration

---

**Last Updated**: 2026-01-28
**Maintained By**: African Puzzle Works Design Team
