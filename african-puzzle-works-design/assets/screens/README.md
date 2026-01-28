# Screen References & Assets

This directory contains reference screenshots, redlines, and examples for the African Puzzle Works design system.

## Directory Structure

```
assets/screens/
├── components/          # Individual component screenshots
│   ├── buttons/        # Button variants and states
│   ├── view-headers/   # View header variants
│   ├── bottom-sheets/  # Bottom sheet examples
│   ├── cards/          # Card styles and layouts
│   ├── inputs/         # Input field variants
│   ├── navigation/     # Navigation components (bottom nav, tabs)
│   ├── snackbars/      # Snackbar/toast examples
│   └── context-menu/   # Context menu and dropdown examples
├── screens/            # Full screen screenshots
├── redlines/           # Annotated designs with measurements
└── examples/           # Implementation examples and variations
```

## Purpose

### Components Directory
Contains isolated screenshots of individual UI components showing:
- All visual states (default, hover, pressed, disabled, etc.)
- Variants (primary, secondary, outlined, etc.)
- Different sizes (small, medium, large, etc.)
- Light and dark mode versions

**Use these for**: Component implementation reference, visual QA, state verification

### Screens Directory
Contains full-screen screenshots of complete views showing:
- Complete user flows
- Layout composition
- Component combinations
- Navigation patterns
- Real content examples

**Use these for**: Screen implementation, layout reference, user flow understanding

### Redlines Directory
Contains annotated designs with:
- Precise measurements (padding, margins, dimensions)
- Spacing indicators
- Typography specifications
- Color values
- Component boundaries

**Use these for**: Pixel-perfect implementation, measurement verification, spacing validation

### Examples Directory
Contains:
- Edge case examples (long text, empty states, errors)
- Responsive behavior demonstrations
- Animation sequences
- Interaction patterns

**Use these for**: Edge case handling, responsive design, animation implementation

## Exporting from Figma

### Component Screenshots

1. **Navigate to Component**: Open the African Puzzle Works Design System Figma file
2. **Select Component**: Click on the component or variant you want to export
3. **Export Settings**:
   - Format: PNG
   - Scale: 2x (for retina displays)
   - Suffix: `@2x`
4. **Naming Convention**: `component-name-variant-state@2x.png`
   - Examples:
     - `button-primary-default@2x.png`
     - `button-primary-hover@2x.png`
     - `view-header-default@2x.png`
     - `card-puzzle-default@2x.png`
5. **Save Location**: Save to appropriate subdirectory in `components/`

### Full Screen Screenshots

1. **Select Screen Frame**: Select the entire frame/artboard
2. **Export Settings**:
   - Format: PNG
   - Scale: 1x (full size)
3. **Naming Convention**: `screen-name-variant.png`
   - Examples:
     - `home-default.png`
     - `profile-dark-mode.png`
     - `puzzle-detail-loading.png`
4. **Save Location**: Save to `screens/`

### Redlines

1. **Use Figma Plugins**: Recommended plugins:
   - Redlines
   - Measure
   - Annotate
2. **Export Settings**:
   - Format: PNG
   - Scale: 1x or 2x
   - Include all annotations
3. **Naming Convention**: `redline-component-name.png` or `redline-screen-name.png`
4. **Save Location**: Save to `redlines/`

## Naming Conventions

### General Rules
- Use lowercase
- Use hyphens for spaces
- Be descriptive but concise
- Include variant and state when applicable

### Component Naming Pattern
```
[component]-[variant]-[state]@2x.png
```

Examples:
- `button-primary-default@2x.png`
- `button-secondary-hover@2x.png`
- `input-text-focused@2x.png`
- `card-puzzle-selected@2x.png`

### Screen Naming Pattern
```
[screen-name]-[variant].png
```

Examples:
- `home-default.png`
- `profile-empty-state.png`
- `puzzle-detail-loading.png`
- `settings-dark-mode.png`

### Redline Naming Pattern
```
redline-[component-or-screen]-[what-it-shows].png
```

Examples:
- `redline-button-spacing.png`
- `redline-view-header-measurements.png`
- `redline-home-layout.png`

## Using MCP Figma Integration

The African Puzzle Works design system integrates with Claude Code's Figma MCP server for automated screenshot generation.

### Getting Screenshots via MCP

**Command**:
```
Get a screenshot of this Figma component: [FIGMA_URL]
```

**Example**:
```
Get a screenshot of https://figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=7398-31867
```

This will:
1. Fetch the component screenshot from Figma
2. Return the image for viewing and analysis
3. Allow saving to appropriate directory

### Extracting Component Specs

**Command**:
```
Get design context for this component: [FIGMA_URL]
```

This returns:
- Component structure
- Measurements
- Colors
- Typography
- Spacing values
- Asset references

## Recommended Screenshots to Export

### Component References

1. **bottom-sheets.png** ✅ (Exported)
   - Frame: `Bottom Sheets` (node-id: 906:2533)
   - Link: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=906-2533
   - Shows: Action sheet, Selection sheet, Calendar sheet, Price sheet variations

2. **buttons.png** ✅ (Exported)
   - Frame: `Buttons` (node-id: 362:6)
   - Link: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=362-6
   - Shows: Primary, Secondary, Text, Icon, Segmented button variations

3. **primitives-colors.png** ✅ (Exported)
   - Frame: `Primitives` (node-id: 7353:10757)
   - Link: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=7353-10757
   - Shows: Color palette with all shades (Primary, Basic, Success, Info, Warning, Danger)

4. **icons.png** ✅ (Exported - white-icons.png and dark-icons.png)
   - Frame: `Icons & Flags` (node-id: 341:157)
   - Link: https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System?node-id=341-157
   - Shows: White, Dark, and Other icon sets

### Screen Examples

5. **splash-screen.png** ✅ (Exported) - Branding/splash screen
6. **language-selection-modal.png** ✅ (Exported) - Language modal
7. **profile.png** ✅ (Exported) - Profile/account screen
8. **contacts.png** ✅ (Exported) - Contacts list with FAB
9. **contact-profile.png** ✅ (Exported) - Contact detail
10. **modal.png** ✅ (Exported) - Modal examples

## File Organization Best Practices

1. **Group by Type**: Keep components, screens, and redlines separate
2. **Consistent Naming**: Follow naming conventions strictly
3. **Version Control**: When updating, replace old file with new (don't keep multiple versions)
4. **Dark Mode**: Include `-dark-mode` suffix for dark theme variants
5. **Clean Up**: Remove outdated or unused screenshots regularly

## Current Status

### Components (Exported)
- ✅ Buttons
- ✅ Bottom Sheets
- ✅ Colors/Primitives
- ✅ Icons (White & Dark)
- ⏳ View Headers (needs individual state exports)
- ⏳ Cards (needs screenshots)
- ⏳ Input Fields (needs screenshots)
- ⏳ Navigation (needs screenshots)

### Screens (Exported)
- ✅ Splash Screen
- ✅ Language Selection Modal
- ✅ Profile
- ✅ Contacts
- ✅ Contact Profile
- ⏳ Other screens need exports

### Redlines
- ⏳ All redlines need creation

### Examples
- ⏳ Edge case examples needed

## Integration with Design System

These screenshots directly support:

1. **flutter-ui-designer**: Visual reference for widget selection
2. **flutter-ui-implementer**: Pixel-perfect implementation guide
3. **flutter-ui-comparison**: Visual comparison for accuracy verification
4. **flutter-design-iteration-coordinator**: Iterative refinement process

---

**Last Updated**: 2026-01-28
**Maintained By**: African Puzzle Works Design Team
