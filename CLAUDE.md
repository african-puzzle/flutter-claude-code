# African Puzzle Works - Design System Skill Project

## Project Overview

This is a forked version of the [flutter-claude-code](https://github.com/cleydson/flutter-claude-code) repository, extended with a custom design system skill for the **African Puzzle Works** mobile app.

### Goal
Create a Claude Code skill that:
1. Extracts design tokens and component specs from the Figma design system
2. Provides these as context to the existing Flutter UI agents
3. Ensures generated Flutter code matches the African Puzzle Works design system

### Key Context
- **App Name:** African Puzzle Works
- **Framework:** Flutter
- **Design System:** Large (30+ components)
- **Spacing System:** 8pt grid
- **Target:** Mobile (iOS and Android)

---

## Skill Structure to Create

Create the following structure in this repository:

```
african-puzzle-works-design/
├── SKILL.md
├── references/
│   ├── tokens.md           # Colors, typography, spacing, radii, shadows
│   ├── components.md       # Component specs with Flutter widget mappings
│   ├── patterns.md         # Layout patterns, screen templates
│   └── flutter-theme.md    # ThemeData configuration guide
└── assets/
    ├── screens/            # Exported screen PNGs for visual reference
    └── theme/
        └── app_theme.dart  # Ready-to-use Flutter theme file
```

---

## SKILL.md Template

Use this template for the main skill file:

```yaml
---
name: african-puzzle-works-design
description: Design system tokens, component specifications, and Flutter theme 
  for the African Puzzle Works mobile app. Use this skill when interpreting 
  Figma screen designs, generating Flutter UI code, or validating implementation 
  against design specs. This skill complements the flutter-ui agents by providing 
  app-specific tokens, patterns, and theme configuration.
---
```

```markdown
# African Puzzle Works Design System

## Overview

This skill provides design tokens, component specifications, and patterns 
for the African Puzzle Works Flutter app. Reference this when implementing 
screens from Figma or reviewing code for design compliance.

## Quick Start

- **Theme file**: Copy `assets/theme/app_theme.dart` to your project
- **Screen references**: See `assets/screens/` for visual reference PNGs

## Design Tokens

See [references/tokens.md](references/tokens.md) for:
- Color palette (semantic naming + hex values)
- Typography scale (font families, sizes, weights, line heights)
- Spacing system (based on 8pt grid)
- Border radii
- Elevation/shadow values

## Component Specifications

See [references/components.md](references/components.md) for:
- Button variants and states
- Card styles
- Input fields
- Navigation patterns (app bar, bottom nav)
- List items
- Modals and dialogs

## Screen Patterns

See [references/patterns.md](references/patterns.md) for:
- Standard screen layouts
- Navigation flow
- Loading/error/empty states
- Puzzle-specific UI patterns

## Flutter Theme Implementation

See [references/flutter-theme.md](references/flutter-theme.md) for:
- Complete ThemeData configuration
- ColorScheme setup
- TextTheme definitions
- Component theme overrides

## Integration with Flutter UI Agents

When the flutter-ui-designer or flutter-ui-implementer agents are working 
on African Puzzle Works screens:

1. Load this skill first to get design system context
2. Reference specific tokens by their semantic names
3. Use the component specs for widget selection decisions
4. Apply the theme from `assets/theme/app_theme.dart`
```

---

## Figma MCP Integration

### Setup
The Figma MCP server should already be configured. Verify with:
```bash
claude mcp list
```

If not configured, add it:
```bash
claude mcp add --transport http figma https://mcp.figma.com/mcp
```

### Extracting Design Tokens

Use the `get_variable_defs` tool to extract tokens from Figma:

**Prompt template:**
> "Get the variable definitions from this Figma frame: [FIGMA_LINK]"

This returns colors, spacing, typography, and other variables.

### Extracting Component Structure

Use the `get_design_context` tool for component specs:

**Prompt template:**
> "Get the design context for this component: [FIGMA_COMPONENT_LINK]"

### Capturing Screen References

Use the `get_screenshot` tool:

**Prompt template:**
> "Get a screenshot of this screen: [FIGMA_SCREEN_LINK]"

---

## Workflow for Generating the Skill

### Phase 1: Extract from Figma
1. Get Figma link to design system/tokens page
2. Run: "Get the variable definitions from [link]"
3. Save output to `references/tokens.md`

### Phase 2: Document Components
1. Get Figma links to each component category
2. Run: "Get the design context for [component link]"
3. Compile into `references/components.md`

### Phase 3: Generate Flutter Theme
1. Use extracted tokens to generate `app_theme.dart`
2. Include ColorScheme, TextTheme, and component themes
3. Save to `assets/theme/app_theme.dart`

### Phase 4: Capture Screen References
1. Export key screens using `get_screenshot`
2. Save PNGs to `assets/screens/`

### Phase 5: Package the Skill
Run the skill packaging script:
```bash
python scripts/package_skill.py african-puzzle-works-design
```

---

## Known Design System Details (from conversation)

### Spacing
- Based on 8pt grid
- 8px between icons and titles
- 24px above title to top of view
- 8px below title to bottom view
- 24px horizontal padding for titles

### Typography Rules
- Title truncation with ellipsis when exceeding container
- Centered titles with max width constraints

### Color Palette (observed, needs confirmation)
- Deep purple/navy for primary surfaces
- Orange/amber for branding and accents
- Teal/cyan for status bar and success states
- Green for FABs and positive actions
- White for text on dark backgrounds

### Screen Types Identified
- Splash/branding screens
- Language selection modal
- Onboarding/instruction flow
- Content browsing (puzzle grids with pricing)
- Profile/account screens with navigation lists
- Contacts screen with FAB

### Component Patterns Observed
- App bar: back arrow + title + actions
- Bottom navigation: 3 items with icons
- List items: icon + text + chevron
- Cards: image + price badge
- Floating action button: green with "+" icon
- Modal dialogs: radio selections

---

## References

- [Flutter Claude Code Skills](https://github.com/cleydson/flutter-claude-code)
- [Figma MCP Server Guide](https://github.com/figma/mcp-server-guide)
- [Skill Creator Documentation](/mnt/skills/examples/skill-creator/SKILL.md)

---

## Next Steps

1. Share your Figma design system link
2. Extract tokens using Figma MCP
3. Generate the skill files
4. Test with the flutter-ui agents
