# Design Tokens

This document contains all design tokens from the African Puzzle Works design system, organized by category.

## Color Palette

### Primary (Purple)
Deep purple colors for primary branding and UI elements.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Primary 100` | `#C5BED1` | Lightest primary tint |
| `Color/Fill/Primary 200` | `#9E93B2` | Light primary |
| `Color/Fill/Primary 300` | `#776793` | Medium-light primary |
| `Color/Fill/Primary 400` | `#5A477B` | Medium primary |
| `Color/Fill/Primary 500` | `#3D2664` | Base primary color |
| `Color/Fill/Primary 600` | `#37225C` | Medium-dark primary |
| `Color/Fill/Primary 700` | `#2F1C52` | Dark primary |
| `Color/Fill/Primary 800` | `#271748` | Darker primary |
| `Color/Fill/Primary 900` | `#1A0D36` | Darkest primary |

### Basic (Neutrals)
Grayscale colors for text, backgrounds, and UI elements.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Basic 100` | `#FFFFFF` | White, primary background |
| `Color/Fill/Basic 200` | `#F7F9FC` | Off-white background |
| `Color/Fill/Basic 300` | `#EDF1F7` | Light gray background |
| `Color/Fill/Basic 400` | `#E4E9F2` | Medium-light gray |
| `Color/Fill/Basic 500` | `#C5CEE0` | Medium gray |
| `Color/Fill/Basic 600` | `#8F9BB3` | Medium-dark gray |
| `Color/Fill/Basic 700` | `#2E3A59` | Dark gray |
| `Color/Fill/Basic 800` | `#222B45` | Darker gray |
| `Color/Fill/Basic 900` | `#192038` | Very dark gray |
| `Color/Fill/Basic 1000` | `#151A30` | Near black |
| `Color/Fill/Basic 1100` | `#101426` | Darkest gray |

### Success (Green/Teal)
Success states, confirmations, and positive actions.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Success 100` | `#EDFFF3` | Lightest success tint |
| `Color/Fill/Success 200` | `#B2FFD6` | Light success |
| `Color/Fill/Success 300` | `#8CFAC7` | Medium-light success |
| `Color/Fill/Success 400` | `#51F0B0` | Medium success |
| `Color/Fill/Success 500` | `#00E096` | Base success color |
| `Color/Fill/Success 600` | `#00B283` | Medium-dark success |
| `Color/Fill/Success 700` | `#008F72` | Dark success |
| `Color/Fill/Success 900` | `#00524C` | Darkest success |

### Info (Blue)
Informational messages and highlights.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Info 100` | `#F2F8FF` | Lightest info tint |
| `Color/Fill/Info 200` | `#C7E2FF` | Light info |
| `Color/Fill/Info 300` | `#94CBFF` | Medium-light info |
| `Color/Fill/Info 400` | `#42AAFF` | Medium info |
| `Color/Fill/Info 500` | `#0095FF` | Base info color |
| `Color/Fill/Info 600` | `#006FD6` | Medium-dark info |
| `Color/Fill/Info 700` | `#0057C2` | Dark info |
| `Color/Fill/Info 800` | `#0041A8` | Darker info |
| `Color/Fill/Info 900` | `#002885` | Darkest info |

### Warning (Yellow/Orange)
Warning states and cautionary messages.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Warning 100` | `#FFF4E5` | Lightest warning tint |
| `Color/Fill/Warning 200` | `#FFE4B8` | Light warning |
| `Color/Fill/Warning 300` | `#FFD28A` | Medium-light warning |
| `Color/Fill/Warning 400` | `#FFC05C` | Medium warning |
| `Color/Fill/Warning 500` | `#FFAA2E` | Base warning color |
| `Color/Fill/Warning 600` | `#FF9800` | Medium-dark warning |
| `Color/Fill/Warning 700` | `#E68900` | Dark warning |
| `Color/Fill/Warning 800` | `#CC7A00` | Darker warning |
| `Color/Fill/Warning 900` | `#B36B00` | Darkest warning |

### Danger (Red)
Error states, destructive actions, and alerts.

| Token | Hex | Usage |
|-------|-----|-------|
| `Color/Fill/Danger 100` | `#FFEAEA` | Lightest danger tint |
| `Color/Fill/Danger 200` | `#FFCCCC` | Light danger |
| `Color/Fill/Danger 300` | `#FFADAD` | Medium-light danger |
| `Color/Fill/Danger 400` | `#FF8F8F` | Medium danger |
| `Color/Fill/Danger 500` | `#FF7070` | Base danger color |
| `Color/Fill/Danger 600` | `#FF5252` | Medium-dark danger |
| `Color/Fill/Danger 700` | `#E63E3E` | Dark danger |
| `Color/Fill/Danger 800` | `#CC2B2B` | Darker danger |
| `Color/Fill/Danger 900` | `#B31818` | Darkest danger |

### Brand Colors
Special brand colors for African Puzzle Works identity.

| Token | Value | Usage |
|-------|-------|-------|
| `Color/Brand/primary` | References `Color/Orange/300` | Primary brand color |
| `Color/Brand/secondary` | References `Color/Orange/100` | Secondary brand accent |

## Semantic Color Tokens

### Surface Colors
Background and surface colors for components.

| Token | Value | Usage |
|-------|-------|-------|
| `surface-card` | `Color/Basic/100` | Card backgrounds |
| `surface-error` | `Color/Danger/100` | Error backgrounds |
| `surface-input` | `Color/Basic/200` | Input field backgrounds |
| `surface-modal` | `Color/Basic/100` | Modal backgrounds |
| `surface-subtle` | `#3D2664` @ 4% opacity | Subtle background overlays |
| `surface-notification-success` | `Color/Primary/500` | Success notification backgrounds |
| `surface-notification-error` | `Color/Danger/100` | Error notification backgrounds |
| `surface-notification-note` | `Color/Primary/050` | Note notification backgrounds |
| `surface-warn` | `Color/Warning/100` | Warning backgrounds |
| `surface-disabled` | `Color/Basic/300` | Disabled state backgrounds |

## Typography

### Font Family
All text uses **Open Sans** font family.

| Token | Value |
|-------|-------|
| `font/family/Title` | Open Sans |
| `font/family/Body` | Open Sans |
| `font/family/Label` | Open Sans |

### Font Weight

| Token | Value | CSS Value |
|-------|-------|-----------|
| `font/weight/Light` | Light | 300 |
| `font/weight/Regular` | Regular | 400 |
| `font/weight/Italic` | Italic | 400 italic |
| `font/weight/Semi Bold` | Semi Bold | 600 |
| `font/weight/Bold` | Bold | 700 |
| `font/weight/Bold Italic` | Bold Italic | 700 italic |

### Font Size - Headings

| Token | Size (px) | Flutter (sp) | Usage |
|-------|-----------|--------------|-------|
| `font/size/heading/h1` | 60 | 60.0 | Largest heading |
| `font/size/heading/h2` | 48 | 48.0 | Second-level heading |
| `font/size/heading/h3` | 40 | 40.0 | Third-level heading |
| `font/size/heading/h4` | 32 | 32.0 | Fourth-level heading |
| `font/size/heading/h5` | 24 | 24.0 | Fifth-level heading |
| `font/size/heading/h6` | 20 | 20.0 | Smallest heading |

### Font Size - Paragraph

| Token | Size (px) | Flutter (sp) | Usage |
|-------|-----------|--------------|-------|
| `font/size/paragraph/caption` | 10 | 10.0 | Captions, fine print |
| `font/size/paragraph/sm` | 12 | 12.0 | Small body text |
| `font/size/paragraph/med` | 16 | 16.0 | Medium body text (default) |
| `font/size/paragraph/lg` | 20 | 20.0 | Large body text |

## Spacing

Based on an **8pt grid system**.

### Primitive Spacing Values

| Token | Value (px) | Flutter (dp) | Multiplier |
|-------|------------|--------------|------------|
| `Spacing/none` | 0 | 0.0 | 0× |
| `Spacing/half` | 4 | 4.0 | 0.5× |
| `Spacing/one` | 8 | 8.0 | 1× (base) |
| `Spacing/two` | 16 | 16.0 | 2× |
| `Spacing/three` | 24 | 24.0 | 3× |
| `Spacing/four` | 32 | 32.0 | 4× |
| `Spacing/six` | 48 | 48.0 | 6× |
| `Spacing/eight` | 64 | 64.0 | 8× |
| `Spacing/twelve` | 96 | 96.0 | 12× |
| `Spacing/sixteen` | 128 | 128.0 | 16× |
| `Spacing/twenty` | 160 | 160.0 | 20× |
| `Spacing/double-variable` | 200 | 200.0 | 25× |

### Semantic Spacing Tokens

| Token | References | Value (px) | Usage |
|-------|------------|------------|-------|
| `spacing-xs` | `Spacing/half` | 4 | Extra small spacing |
| `spacing-sm` | `Spacing/one` | 8 | Small spacing |
| `spacing-med` | `Spacing/two` | 16 | Medium spacing |
| `spacing-lrg` | `Spacing/three` | 24 | Large spacing |
| `spacing-xl` | `Spacing/four` | 32 | Extra large spacing |
| `spacing-2xl` | `Spacing/eight` | 64 | 2× extra large spacing |

## Border Radius

### Primitive Radius Values

| Token | Value (px) | Flutter (dp) | Usage |
|-------|------------|--------------|---------|
| `Radius/none` | 0 | 0.0 | No rounding |
| `Radius/xs` | 2 | 2.0 | Extra small radius |
| `Radius/sm` | 4 | 4.0 | Small radius |
| `Radius/med` | 8 | 8.0 | Medium radius |
| `Radius/lg` | 12 | 12.0 | Large radius |
| `Radius/xl` | 16 | 16.0 | Extra large radius |
| `Radius/xxl` | 20 | 20.0 | 2× extra large radius |
| `Radius/3xl` | 24 | 24.0 | 3× extra large radius |
| `Radius/4xl` | 32 | 32.0 | 4× extra large radius |
| `Radius/full` | 9999 | 9999.0 | Fully rounded (pill shape) |

### Semantic Radius Tokens

| Token | References | Value (px) | Usage |
|-------|------------|------------|-------|
| `radius-minimal` | `Radius/sm` | 4 | Subtle corner rounding |
| `radius-rounded` | `Radius/med` | 8 | Standard rounded corners |
| `radius-full` | `Radius/large` | 12+ | Fully rounded elements |

## Border Width

| Token | Value (px) | Flutter (dp) | Usage |
|-------|------------|--------------|-------|
| `Border/thin` | 0.5 | 0.5 | Hairline borders |
| `Border/normal` | 1 | 1.0 | Standard borders |
| `Border/thick` | 2 | 2.0 | Emphasized borders |
| `Border/thicker` | 3 | 3.0 | Strong borders |
| `Border/thickest` | 4 | 4.0 | Maximum border width |

## Usage in Flutter

### Accessing Tokens in Code

```dart
// Colors
Color primaryColor = Color(0xFF3D2664); // Primary 500
Color backgroundColor = Color(0xFFFFFFFF); // Basic 100

// Spacing
double spacingSmall = 8.0; // Spacing/one
double spacingMedium = 16.0; // Spacing/two
double spacingLarge = 24.0; // Spacing/three

// Border Radius
BorderRadius radiusSmall = BorderRadius.circular(4.0); // Radius/sm
BorderRadius radiusMedium = BorderRadius.circular(8.0); // Radius/med
BorderRadius radiusFull = BorderRadius.circular(9999.0); // Radius/full

// Typography
TextStyle heading1 = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 60.0,
  fontWeight: FontWeight.w700,
);

TextStyle bodyMedium = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);
```

## Design System Notes

1. **8pt Grid**: All spacing values are multiples of 8px (or 4px for half increments)
2. **Color Scales**: Each color family includes 9-11 shades for flexibility
3. **Semantic Tokens**: Use semantic tokens (e.g., `surface-card`, `spacing-med`) instead of primitive values in implementation
4. **Open Sans**: Single font family for consistency across the app
5. **Border Radius**: Progressive scale from subtle (4px) to fully rounded (9999px)
