# Quick Start Guide: Figma-to-Flutter Workflow

This guide shows the complete workflow for implementing African Puzzle Works components from Figma using Claude.

## 🎯 Core Principle

**Figma is the source of truth.** Claude always fetches live data during implementation, not static screenshots.

## 🚀 Happy Path: Component in Registry

```
User: "Implement the primary button"

Claude:
├─ ✓ Loads african-puzzle-works-design skill
├─ ✓ Checks FIGMA_REGISTRY.md → Buttons (node: 362-6)
├─ ✓ Fetches live screenshot via MCP
├─ ✓ Fetches design context (colors, spacing, measurements)
├─ ✓ Cross-references references/components.md for Flutter pattern
├─ ✓ Implements with live Figma values
└─ ✓ Maps to design tokens (AppColors, AppSpacing, etc.)

Result: Pixel-perfect, up-to-date implementation
```

## 🔀 Fallback Path: Component Not in Registry

```
User: "Implement the pricing card"

Claude:
├─ ✗ Not in FIGMA_REGISTRY.md
├─ ✓ Tries fuzzy match: "card" → No close matches
├─ ✓ Asks user how to proceed:
│   ├─ Option 1: Explore Figma file (uses metadata)
│   ├─ Option 2: User provides Figma URL
│   └─ Option 3: Use similar component
└─ [User selects option]

If user provides URL:
├─ ✓ Extracts fileKey + nodeId automatically
├─ ✓ Fetches live data
├─ ✓ Implements
└─ ✓ Offers to add to registry for future use

Result: Component implemented, registry improved
```

## 🎨 Multiple Variants Path

```
User: "Add a header to this calendar screen"

Claude:
├─ ✓ Checks registry → View Headers (7 variants)
├─ ✓ Analyzes context: "calendar screen"
├─ ✓ Suggests: Calendar View Header (variant 3 of 7)
├─ ✓ Asks confirmation:
│   "Based on 'calendar screen', I recommend Calendar View Header.
│    It includes: Purple gradient, menu icon, title, calendar nav.
│    Is this correct?"
│   ├─ Confirm
│   ├─ Choose different variant
│   └─ Provide custom URL
└─ [User confirms]

├─ ✓ Fetches Calendar View Header variant (node: 7398-31867)
├─ ✓ Implements with live data
└─ ✓ Pixel-perfect match

Result: Correct variant selected and implemented
```

## 📝 User Provides Figma URL

```
User: "Implement this: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=999-888"

Claude:
├─ ✓ Detects Figma URL
├─ ✓ Extracts fileKey: 8S2Jt5xKHfTmlI8rSR6AcX
├─ ✓ Extracts nodeId: 999:888
├─ ✓ Fetches live screenshot
├─ ✓ Fetches design context
├─ ✓ Shows preview: "I fetched this component. Is this correct?"
└─ [User confirms]

├─ ✓ Implements with live data
└─ 💡 Suggests: "This component isn't in registry. Add it?"

Result: Direct implementation, optional registry update
```

## 📊 Decision Tree

```
┌─────────────────────────────────────┐
│ User requests component             │
└───────────────┬─────────────────────┘
                │
                ▼
        ┌───────────────┐
        │ Figma URL     │
        │ provided?     │
        └───┬───────┬───┘
            │       │
         Yes│       │No
            │       │
            ▼       ▼
    ┌───────────┐ ┌──────────────────┐
    │ Extract   │ │ Check            │
    │ node ID   │ │ FIGMA_REGISTRY   │
    └─────┬─────┘ └────┬─────────┬───┘
          │            │         │
          │         Found│       │Not found
          │            │         │
          └────────────┼─────────┘
                       │         │
                       │         ▼
                       │  ┌──────────────┐
                       │  │ Fuzzy match? │
                       │  └───┬──────┬───┘
                       │      │      │
                       │   Match│    │No match
                       │      │      │
                       │      │      ▼
                       │      │  ┌────────────────┐
                       │      │  │ Explore Figma  │
                       │      │  │ or Ask User    │
                       │      │  └───────┬────────┘
                       │      │          │
                       └──────┴──────────┘
                              │
                              ▼
                       ┌──────────────┐
                       │ Multiple     │
                       │ variants?    │
                       └───┬──────┬───┘
                           │      │
                        Yes│      │No
                           │      │
                           ▼      │
                    ┌──────────┐  │
                    │ Ask user │  │
                    │ to select│  │
                    └─────┬────┘  │
                          │       │
                          └───────┘
                              │
                              ▼
                       ┌──────────────┐
                       │ Fetch live   │
                       │ Figma data   │
                       └──────┬───────┘
                              │
                              ▼
                       ┌──────────────┐
                       │ Implement    │
                       │ component    │
                       └──────────────┘
```

## 🛠️ MCP Tools Reference

### Primary Tools

| Tool | Purpose | When to Use |
|------|---------|-------------|
| `mcp__figma__get_screenshot` | Get visual snapshot | Always (for preview/validation) |
| `mcp__figma__get_design_context` | Get specs (colors, spacing, etc.) | Always (for implementation) |
| `mcp__figma__get_variable_defs` | Get design token mappings | For color palettes, token sync |
| `mcp__figma__get_metadata` | Explore component structure | When component not in registry |

### Example Calls

```python
# Get screenshot
mcp__figma__get_screenshot(
    fileKey="8S2Jt5xKHfTmlI8rSR6AcX",
    nodeId="362-6",
    clientLanguages="dart",
    clientFrameworks="flutter"
)

# Get design context
mcp__figma__get_design_context(
    fileKey="8S2Jt5xKHfTmlI8rSR6AcX",
    nodeId="362-6",
    clientLanguages="dart",
    clientFrameworks="flutter"
)

# Explore structure
mcp__figma__get_metadata(
    fileKey="8S2Jt5xKHfTmlI8rSR6AcX",
    nodeId="0:1"  # Page/root node
)
```

## 📚 Key Files Reference

| File | Purpose | When to Use |
|------|---------|-------------|
| `SKILL.md` | Main skill overview | Start here - overview of entire system |
| `FIGMA_REGISTRY.md` | Component → Node ID mapping | Look up node IDs for MCP calls |
| `references/figma-sync-strategy.md` | Sync strategy details | Understand the Figma-first approach |
| `references/figma-fallback-strategy.md` | Fallback workflows | Handle edge cases, ambiguity |
| `references/components.md` | Component specs | Flutter implementation patterns |
| `references/measurements.md` | Precise dimensions | Pixel-perfect implementation |
| `references/tokens.md` | Design tokens | Color, spacing, typography values |

## 🎓 Usage Examples

### Example 1: Simple Button

```
User: "Implement the primary button"

Expected Flow:
1. Claude loads african-puzzle-works-design skill
2. Checks FIGMA_REGISTRY.md → Buttons (362-6)
3. Fetches screenshot + design context
4. Implements ElevatedButton with:
   - Background: AppColors.primary500 (#3D2664)
   - Text: White
   - Padding: 24px horizontal (AppSpacing.spacingLarge)
   - Border radius: 8px (AppRadius.radiusRounded)
   - Elevation: 2dp
```

### Example 2: View Header with Variants

```
User: "Add a header for the search screen"

Expected Flow:
1. Claude identifies "search screen" context
2. Checks FIGMA_REGISTRY.md → View Headers (7 variants)
3. Suggests: Search View Header (variant 4)
4. Asks: "Should I use Search View Header with search icon and input field?"
5. User confirms
6. Fetches specific variant from Figma
7. Implements with:
   - Purple gradient background
   - Search icon (left)
   - Search input field (center)
   - Clear icon (right)
```

### Example 3: Custom Component with URL

```
User: "Use this card design: https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX?node-id=1234-5678"

Expected Flow:
1. Claude detects Figma URL
2. Extracts: fileKey + nodeId automatically
3. Fetches live data
4. Shows screenshot: "Is this the correct card?"
5. User confirms
6. Implements with live measurements
7. Asks: "Add this to FIGMA_REGISTRY.md as 'Custom Card'?"
```

### Example 4: Component Not Found

```
User: "Implement the subscription card"

Expected Flow:
1. Claude checks FIGMA_REGISTRY.md → Not found
2. Tries fuzzy match: "card" → No specific match
3. Asks user:
   "I couldn't find 'subscription card'. Would you like to:
    1. Explore Figma for available cards
    2. Provide a Figma URL
    3. Use a similar component (e.g., Puzzle Card)"
4. User selects "Provide Figma URL"
5. User pastes URL
6. Claude extracts node ID and proceeds
```

## ⚠️ Common Pitfalls & Solutions

| Pitfall | Solution |
|---------|----------|
| Using static screenshots | Always fetch live from Figma via MCP |
| Hardcoding colors | Use design tokens (AppColors.*) |
| Guessing variant | Ask user when multiple variants exist |
| Skipping registry lookup | Always check FIGMA_REGISTRY.md first |
| Not confirming ambiguous requests | Use AskUserQuestion for clarity |
| Forgetting to cross-reference | Check references/*.md for patterns |

## 🎯 Success Metrics

A successful implementation has:

✅ **Live Figma data fetched** - Not using cached screenshots
✅ **Design tokens used** - AppColors, AppSpacing, AppRadius
✅ **Pixel-perfect accuracy** - Matches current Figma state
✅ **Correct variant** - If multiple exist, right one selected
✅ **Documentation updated** - New components added to registry

## 🔗 Related Documentation

- [Main Skill Documentation](SKILL.md)
- [Figma Component Registry](FIGMA_REGISTRY.md)
- [Figma Sync Strategy](references/figma-sync-strategy.md)
- [Figma Fallback Strategy](references/figma-fallback-strategy.md)
- [Component Specifications](references/components.md)

---

**Last Updated**: 2026-01-28
**Version**: 2.0.0
**Maintained By**: African Puzzle Works Team
