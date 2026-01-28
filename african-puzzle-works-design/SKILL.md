---
name: african-puzzle-works-design
description: Design system tokens, component specifications, and Flutter theme for the African Puzzle Works mobile app. Use this skill when interpreting Figma screen designs, generating Flutter UI code, or validating implementation against design specs. This skill complements the flutter-ui agents by providing app-specific tokens, patterns, and theme configuration.
---

# African Puzzle Works Design System

## Overview

This skill provides design tokens, component specifications, and patterns for the African Puzzle Works Flutter app. Reference this when implementing screens from Figma or reviewing code for design compliance.

## Quick Start

- **Theme file**: Copy `assets/theme/app_theme.dart` to your project
- **Apply theme**:
  ```dart
  MaterialApp(
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.system,
  );
  ```

## Design Tokens

See [references/tokens.md](references/tokens.md) for complete token documentation:

### Colors
- **Primary** (Purple): Deep purple brand colors (#3D2664 as base)
- **Basic** (Neutrals): White to near-black grayscale (11 shades)
- **Success** (Green/Teal): Success states and positive actions (#00E096 as base)
- **Info** (Blue): Informational messages (#0095FF as base)
- **Warning** (Yellow/Orange): Warning states (#FFAA2E as base)
- **Danger** (Red): Error states and destructive actions (#FF7070 as base)

### Typography
- **Font Family**: Open Sans (single font family for consistency)
- **Heading Sizes**: h1 (60px) → h6 (20px)
- **Paragraph Sizes**: caption (10px), sm (12px), med (16px), lg (20px)
- **Weights**: Light (300), Regular (400), Semi Bold (600), Bold (700)

### Spacing (8pt Grid)
| Token | Value | Usage |
|-------|-------|-------|
| `spacing-xs` | 4px | Extra small gaps |
| `spacing-sm` | 8px | Small gaps, icon-to-text |
| `spacing-med` | 16px | Medium gaps, standard padding |
| `spacing-lrg` | 24px | Large gaps, section spacing |
| `spacing-xl` | 32px | Extra large spacing |
| `spacing-2xl` | 64px | Maximum spacing |

### Border Radius
| Token | Value | Usage |
|-------|-------|-------|
| `radius-minimal` | 4px | Subtle rounding |
| `radius-rounded` | 8px | Standard rounded corners |
| `radius-full` | 9999px | Fully rounded (pills, circles) |

### Border Width
| Token | Value | Usage |
|-------|-------|-------|
| `thin` | 0.5px | Hairline borders |
| `normal` | 1px | Standard borders |
| `thick` | 2px | Emphasized borders |

## Component Specifications

See [references/components.md](references/components.md) for detailed component specs:

### Buttons
- **Primary (Elevated)**: Purple background, white text, 8px radius
- **Secondary (Outlined)**: Purple outline, transparent background
- **Text Button**: Minimal styling for tertiary actions
- **Icon Button**: 24px icon, 8px padding
- **Segmented Button**: Toggle between options (FEMME/HOMME pattern)

### Input Fields
- **Text Input**: Light gray background, 8px radius, 16px horizontal padding
- **Focus State**: 2px primary purple border
- **Error State**: Red border and error message

### Cards
- **Standard Card**: White background, 2dp elevation, 8px radius, 16px padding

### Navigation
- **App Bar**: Purple background, centered white title, 56dp height
- **Bottom Nav**: 3-5 items, purple selected state, gray unselected
- **FAB**: Green circular button (Success 500 color) for primary actions

### List Items
- **List Tile**: 56dp minimum height, icon + text + trailing chevron
- **Spacing**: 8px between items

## Screen Patterns

See [references/patterns.md](references/patterns.md) for layout patterns:

### Common Patterns
1. **Standard Screen**: App bar + scrollable content with 16px padding
2. **List Screen**: Vertical list with separators
3. **Grid Screen**: 2-column grid for puzzle browsing (3:4 aspect ratio)
4. **Profile Screen**: Avatar header + list sections
5. **Modal Screen**: Full-screen dialog or overlay

### Layout Rules
- **Icon to title**: 8px spacing
- **Top padding to title**: 24px
- **Title to content**: 8px spacing
- **Horizontal title padding**: 24px
- **Screen edge padding**: 16-24px
- **Title truncation**: Ellipsis when exceeding container

### State Patterns
- **Loading**: Centered spinner + "Loading..." text
- **Empty**: Icon + message + optional action
- **Error**: Error icon + message + "RETRY" button

## Puzzle-Specific Patterns

### Puzzle Grid Cards
- **Layout**: 2 columns with 8px gap
- **Card Content**: Image + price badge overlay
- **Price Badge**: Orange background, rounded, bottom-right corner
- **Image Ratio**: ~0.75 (3:4)

### Screen Types Observed
1. **Splash/Branding**: Full-screen with centered logo
2. **Language Selection**: Modal with radio buttons
3. **Onboarding**: PageView with indicator dots
4. **Puzzle Browsing**: Grid of cards with pricing
5. **Profile/Account**: Avatar + navigation list
6. **Contacts**: List with FAB for adding

## Flutter Theme Implementation

See [references/flutter-theme.md](references/flutter-theme.md) or directly use [assets/theme/app_theme.dart](assets/theme/app_theme.dart).

### Theme Application
```dart
import 'package:african_puzzle/theme/app_theme.dart';

MaterialApp(
  title: 'African Puzzle Works',
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
  home: const HomeScreen(),
);
```

### Accessing Design Tokens in Code
```dart
// Colors
Container(
  color: AppColors.primary500,
  child: Text(
    'Title',
    style: TextStyle(color: AppColors.basicWhite),
  ),
);

// Spacing
Padding(
  padding: const EdgeInsets.all(AppSpacing.spacingMedium), // 16px
  child: Column(
    children: [
      Text('Item 1'),
      SizedBox(height: AppSpacing.spacingSmall), // 8px
      Text('Item 2'),
    ],
  ),
);

// Border Radius
Container(
  decoration: BoxDecoration(
    color: AppColors.surfaceCard,
    borderRadius: BorderRadius.circular(AppRadius.radiusRounded), // 8px
  ),
);

// Typography
Text(
  'Heading',
  style: TextStyle(
    fontFamily: AppTypography.fontFamily,
    fontSize: AppTypography.h3,
    fontWeight: FontWeight.w700,
  ),
);
```

## Integration with Flutter UI Agents

When the `flutter-ui-designer` or `flutter-ui-implementer` agents are working on African Puzzle Works screens:

### Design Analysis Phase
1. **Load this skill first** to get design system context
2. **Reference specific tokens** by their semantic names (e.g., `spacing-med`, `primary500`)
3. **Use component specs** for widget selection decisions
4. **Follow layout patterns** from `patterns.md`

### Implementation Phase
1. **Import theme file**: `import 'package:african_puzzle/theme/app_theme.dart';`
2. **Use token classes**: `AppColors`, `AppSpacing`, `AppRadius`, `AppTypography`
3. **Follow 8pt grid**: All spacing should be multiples of 8 (or 4 for half-steps)
4. **Apply theme**: Use `Theme.of(context)` where possible for automatic theming

### Example Workflow
```
User: "Implement this puzzle browsing screen from Figma"

Agent (with skill loaded):
1. Analyzes Figma design
2. Identifies: Grid layout, 2 columns, puzzle cards with images + price badges
3. References: patterns.md (Grid Screen pattern)
4. Uses tokens: AppSpacing.spacingSmall (8px gap), AppRadius.radiusRounded (8px)
5. Applies: AppColors.warning500 for price badge background
6. Implements with proper spacing, colors, and component structure
```

## Color Palette Reference

### Quick Color Guide
| Use Case | Color | Token |
|----------|-------|-------|
| Primary buttons | Deep purple | `AppColors.primary500` |
| App bar | Deep purple | `AppColors.primary500` |
| FAB | Green | `AppColors.success500` |
| Price badges | Orange | `AppColors.warning500` |
| Error messages | Red | `AppColors.danger500` |
| Success messages | Green | `AppColors.success500` |
| Info messages | Blue | `AppColors.info500` |
| Text on light | Dark gray | `AppColors.basic900` |
| Text on dark | White | `AppColors.basicWhite` |
| Backgrounds (light) | White | `AppColors.basic100` |
| Backgrounds (dark) | Near black | `AppColors.basic900` |
| Borders | Light gray | `AppColors.basic400` |
| Disabled | Light gray | `AppColors.basic300` |

## Design System Principles

1. **8pt Grid**: All spacing values are multiples of 8px (or 4px for half increments)
2. **Color Scales**: Each color family includes 9-11 shades for flexibility
3. **Semantic Tokens**: Use semantic tokens (e.g., `surface-card`, `spacing-med`) instead of primitive values
4. **Single Font Family**: Open Sans for consistency across the app
5. **Progressive Radius**: Scale from subtle (4px) to fully rounded (9999px)
6. **Accessibility**: Minimum touch target size of 48dp × 48dp
7. **Consistency**: Use design system components and patterns across all screens

## File Structure

```
african-puzzle-works-design/
├── SKILL.md                    # This file
├── references/
│   ├── tokens.md               # Complete design token documentation
│   ├── components.md           # Component specs with Flutter examples
│   ├── patterns.md             # Layout patterns and screen templates
│   └── flutter-theme.md        # Theme implementation guide
└── assets/
    ├── theme/
    │   └── app_theme.dart      # Ready-to-use Flutter theme file
    └── screens/                # Reference screenshots (to be added)
```

## Next Steps

### To Use This Skill
1. Copy `assets/theme/app_theme.dart` to your Flutter project
2. Import and apply the theme in your `MaterialApp`
3. Reference `references/tokens.md` when implementing designs
4. Follow patterns from `references/patterns.md` for screen layouts

### To Expand This Skill
1. Add more component specifications to `components.md`
2. Capture reference screenshots of key screens to `assets/screens/`
3. Document animation patterns and transitions
4. Add dark mode color variations
5. Include responsive breakpoints for tablet/web

## Resources

- **Figma Design System**: [African Puzzle Design System](https://www.figma.com/design/8S2Jt5xKHfTmlI8rSR6AcX/African-Puzzle-Design-System)
- **Flutter Theme Guide**: [references/flutter-theme.md](references/flutter-theme.md)
- **Component Library**: [references/components.md](references/components.md)
- **Layout Patterns**: [references/patterns.md](references/patterns.md)

---

**Version**: 1.0
**Last Updated**: 2026-01-28
**Maintainer**: African Puzzle Works Team
