# Precise Measurements

This document provides exact pixel measurements for all components in the African Puzzle Works design system. Use these specifications to achieve pixel-perfect implementation.

## View Header Components

### Status Bar
- **Height**: 24px (fixed, system-controlled)
- **Content**: Time, Wi-Fi, signal, battery icons
- **Font**: Roboto Regular 13px
- **Color**: White (#FFFFFF)
- **Background**: Transparent (overlaid on gradient)

### Navigation Bar (Header UI)
- **Total Height**: 32px
- **Horizontal Padding**: 8px (left and right)
- **Vertical Padding**: 8px (top and bottom)
- **Gap Between Elements**: 4px

**Left Icon Container:**
- **Size**: 32px × 32px
- **Icon Size**: 24px × 24px (menu) or 28px × 28px (alternative)
- **Alignment**: Center aligned in container
- **Color**: White (#FFFFFF)

**Title:**
- **Font**: Open Sans Bold
- **Size**: 22px
- **Line Height**: 32px (145% of font size)
- **Color**: White (#FFFFFF)
- **Text Shadow**: 0px 2px 3px rgba(0,0,0,0.5)
- **Alignment**: Center (horizontally and vertically)
- **Max Width**: Container width minus icon containers and gaps
- **Overflow**: Ellipsis

**Right Icon Container:**
- **Size**: 32px × 32px (for 24px icons) or flexible
- **Icon Size**: 24px × 24px (standard) or 20px × 20px (smaller icons)
- **Alignment**: Center aligned in container
- **Color**: White (#FFFFFF)

**Background Gradient:**
- **Type**: Linear gradient
- **Direction**: Top to bottom
- **Start Color**: #3D2664 (Primary 500)
- **End Color**: #2A1B47 (Primary 700 approximation)
- **Stops**: 0% and 100%

### Sub-Header Components

**Calendar Sub-Header:**
- **Month Navigation Row**:
  - Height: 48px
  - Horizontal padding: 8px
  - Vertical padding: 16px
  - Left arrow: 24px × 24px
  - Right arrow: 24px × 24px
  - Month label: 18px Bold Open Sans
  - Chevron icon: 24px × 24px
  - Gap between elements: 16px

**Calendar Grid:**
- **Day Names Row**:
  - Height: 42px
  - Font: 15px Semi Bold Open Sans
  - Color: #3D2664 (Primary 500)
  - Alignment: Center in 42px × 42px cells
  - Gap between cells: 4px

**Date Numbers:**
- **Cell Size**: 42px × 42px
- **Font**: 18px Bold Open Sans
- **Color (unselected)**: #3D2664 (Primary 500)
- **Color (selected)**: #FFFFFF (White)
- **Selected Background**: #3D2664 (Primary 500)
- **Border Radius (selected)**: 4px
- **Gap**: 4px between cells

**Search Sub-Header:**
- **Height**: 64px
- **Padding**: 12px (top and bottom), 8px (left and right)
- **Search Bar**:
  - Height: 40px
  - Width: 344px (container - 16px padding)
  - Background: #F7F9FC (Basic 200)
  - Border: 1px solid #8F9BB3 (Basic 600)
  - Border Radius: 20px (pill shape)
  - Icon: 24px × 24px, positioned right
  - Icon margin-right: 12px
  - Input padding: 16px (left), 40px (right to accommodate icon)

**Price Meter + RDV Button Sub-Header:**
- **Height**: 64px (48px content + 16px padding)
- **Padding**: 12px (top and bottom), 16px (left and right)
- **Price Meter**:
  - Width: 80px
  - Height: 40px
  - Border: 1px solid #3D2664 (Primary 500)
  - Border Radius: 10px
  - Icon: 24px × 24px (coins icon)
  - Text: 15px Bold Open Sans
  - Color: #3D2664
  - Gap between icon and text: 8px
  - Content alignment: Center

**RDV Button:**
- **Height**: 48px
- **Horizontal Padding**: 16px
- **Vertical Padding**: 8px
- **Gap between icon and text**: 12px
- **Icon**: 24px × 24px (alarm icon)
- **Text**: "RDV" - 18px Bold Open Sans
- **Color**: #3D2664 (Primary 500)
- **Background**: rgba(61, 38, 100, 0.04) (Surface subtle)
- **Border**: 1px solid #3D2664
- **Border Radius**: 4px

## Button Components

### Primary Button (Elevated)
- **Height**: 48px (giant), 40px (large), 32px (medium), 24px (small)
- **Horizontal Padding**: 24px (giant), 16px (large/medium), 12px (small)
- **Vertical Padding**: 16px (giant), 12px (large), 8px (medium), 4px (small)
- **Border Radius**: 8px (rounded), 4px (minimal), 9999px (pill)
- **Font**: Open Sans Semi Bold
- **Font Size**: 18px (giant), 16px (large), 14px (medium), 12px (small)
- **Line Height**: 24px (giant/large), 20px (medium), 16px (small)
- **Text Color**: #FFFFFF (White)
- **Background**: #3D2664 (Primary 500)
- **Elevation**: 2dp (shadow)
- **Icon to Text Gap**: 12px (if icon present)
- **Icon Size**: 24px × 24px (giant/large), 20px × 20px (medium), 16px × 16px (small)
- **Minimum Tap Target**: 48dp × 48dp

### Secondary Button (Outlined)
- **Height**: Same as primary
- **Horizontal Padding**: Same as primary
- **Vertical Padding**: Same as primary
- **Border**: 1px solid #3D2664 (Primary 500)
- **Border Radius**: 8px (rounded)
- **Font**: Open Sans Semi Bold
- **Font Size**: Same as primary
- **Text Color**: #3D2664 (Primary 500)
- **Background**: Transparent or rgba(61, 38, 100, 0.04)
- **Elevation**: 0dp (flat)

### Text Button
- **Height**: Auto (content-based)
- **Horizontal Padding**: 16px
- **Vertical Padding**: 8px
- **Border**: None
- **Border Radius**: 4px (for ripple)
- **Font**: Open Sans Semi Bold
- **Font Size**: 16px
- **Text Color**: #3D2664 (Primary 500)
- **Background**: Transparent
- **Minimum Tap Target**: 48dp × 48dp

### Icon Button
- **Container Size**: 48px × 48px (minimum tap target)
- **Icon Size**: 24px × 24px
- **Padding**: 12px all around
- **Border Radius**: 24px (circular ripple)
- **Icon Color**: Varies by context
- **Background**: Transparent
- **Ripple**: Circular

## Input Field Components

### Text Input (Default)
- **Height**: 48px (standard), 56px (large)
- **Horizontal Padding**: 16px (left and right)
- **Vertical Padding**: 12px (top and bottom)
- **Border**: 1px solid #E4E9F2 (Basic 400)
- **Border Radius**: 8px
- **Background**: #F7F9FC (Basic 200)
- **Font**: Open Sans Regular
- **Font Size**: 16px
- **Line Height**: 24px
- **Text Color**: #192038 (Basic 900)
- **Placeholder Color**: #8F9BB3 (Basic 600)

**With Label:**
- **Label Font**: Open Sans Regular 14px
- **Label Color**: #8F9BB3 (Basic 600)
- **Label Margin Bottom**: 8px

**With Prefix Icon:**
- **Icon Size**: 24px × 24px
- **Icon Margin Right**: 12px
- **Icon Color**: #8F9BB3 (Basic 600)

**With Suffix Icon:**
- **Icon Size**: 24px × 24px
- **Icon Margin Left**: 12px
- **Icon Color**: #8F9BB3 (Basic 600)

**Focus State:**
- **Border**: 2px solid #3D2664 (Primary 500)
- **Background**: #FFFFFF (White)
- **Border adjusts height by 1px** (2px border vs 1px border)

**Error State:**
- **Border**: 2px solid #FF7070 (Danger 500)
- **Background**: #FFF5F5 (light red tint)
- **Error Message**:
  - Font: Open Sans Regular 12px
  - Color: #FF7070 (Danger 500)
  - Margin Top: 4px

## Card Components

### Standard Card
- **Border Radius**: 8px
- **Padding**: 16px (all sides)
- **Background**: #FFFFFF (White)
- **Elevation**: 2dp
- **Shadow**: 0px 2px 12px 2px rgba(0,0,0,0.25)
- **Border**: None (unless specified)
- **Gap Between Cards**: 8px (in lists) or 16px (standalone)

**Card with Image:**
- **Image Aspect Ratio**: 16:9 or 3:4 (puzzle cards)
- **Image Border Radius**: 8px 8px 0 0 (top corners only)
- **Content Padding**: 16px (below image)

**Puzzle Card (Grid):**
- **Aspect Ratio**: 0.75 (3:4)
- **Image**: Covers full card
- **Price Badge Overlay**:
  - Position: Bottom right corner
  - Margin: 8px from edges
  - Background: #FFAA2E (Warning 500)
  - Padding: 6px horizontal, 4px vertical
  - Border Radius: 4px
  - Font: 14px Bold Open Sans
  - Text Color: #FFFFFF

## List Item Components

### Standard List Tile
- **Minimum Height**: 56dp
- **Horizontal Padding**: 16px
- **Vertical Padding**: 8px
- **Leading Icon**:
  - Size: 24px × 24px
  - Margin Right: 16px
  - Color: Varies
- **Title**:
  - Font: Open Sans Regular 16px
  - Color: #192038 (Basic 900)
  - Max Lines: 1
  - Overflow: Ellipsis
- **Subtitle** (if present):
  - Font: Open Sans Regular 14px
  - Color: #8F9BB3 (Basic 600)
  - Max Lines: 2
  - Overflow: Ellipsis
  - Margin Top: 4px
- **Trailing Icon**:
  - Size: 24px × 24px
  - Margin Left: 16px
  - Color: #8F9BB3 (Basic 600)
- **Divider** (if between items):
  - Height: 1px
  - Color: #E4E9F2 (Basic 400)
  - Margin: 0 16px (inset)

### List with Avatar
- **Avatar Size**: 40px × 40px (standard), 48px × 48px (large)
- **Avatar Border Radius**: 20px or 24px (circular)
- **Avatar Margin Right**: 16px
- **Content Alignment**: Center vertically with avatar

## Bottom Navigation Bar

### Container
- **Height**: 56px
- **Background**: #FFFFFF (White)
- **Top Border**: 1px solid #E4E9F2 (Basic 400)
- **Shadow**: 0px -2px 12px 2px rgba(0,0,0,0.25) (top shadow)

### Navigation Items
- **Item Width**: Flexible, evenly distributed (25% each for 4 items)
- **Minimum Width**: 72px
- **Height**: 56px
- **Padding**: 8px top, 2px bottom
- **Icon Size**: 24px × 24px
- **Icon Color**: #776793 (text-subtle)
- **Label Font**: Open Sans Bold 10px
- **Label Line Height**: 16px
- **Label Color**: #776793 (text-subtle)
- **Gap between icon and label**: 2px
- **Content Alignment**: Center (horizontally and vertically)
- **Ripple**: Full item area

**Badge** (if present):
- **Size**: 16px × 16px (minimum)
- **Background**: #FF7070 (Danger 500)
- **Font**: 10px Bold Open Sans
- **Text Color**: #FFFFFF
- **Position**: Top right of icon
- **Offset**: -2px from top and right edges

## Bottom Sheet Components

### Container
- **Width**: Full screen width (360px on standard phone)
- **Max Height**: 90% of screen height
- **Border Radius**: 20px 20px 0 0 (top corners only)
- **Background**: #FFFFFF (White)
- **Shadow**: 0px 8px 16px rgba(0,0,0,0.2)

### Drag Handle
- **Width**: 40px
- **Height**: 4px
- **Border Radius**: 2px (pill shape)
- **Background**: #E4E9F2 (Basic 400)
- **Position**: Top center
- **Margin**: 8px from top

### Content Padding
- **Horizontal**: 16px
- **Top**: 8px (below drag handle) or 16px (without drag handle)
- **Bottom**: 16px + safe area bottom

### Action Grid (for Action Bottom Sheet)
- **Columns**: 3
- **Item Size**: 88px × 88px
- **Gap**: 16px (horizontal and vertical)
- **Icon Size**: 32px × 32px
- **Icon Color**: #3D2664 (Primary 500)
- **Label Font**: 12px Regular Open Sans
- **Label Color**: #192038 (Basic 900)
- **Label Margin Top**: 8px
- **Alignment**: Center

## Context Menu (Long-Press)

### Container
- **Width**: 345px
- **Height**: 56px (single row)
- **Border Radius**: 4px
- **Background**: #FFFFFF (White)
- **Shadow**: 0px 4px 12px rgba(0,0,0,0.25)
- **Position**: Above selected item or centered

### Menu Items
- **Item Width**: Flexible, evenly distributed (57.5px each for 6 items)
- **Height**: 56px
- **Padding**: 8px
- **Gap between items**: 0 (items touch)
- **Icon Size**: 24px × 24px
- **Icon Color**: #192038 (Basic 900) or #FF7070 (Danger for delete)
- **Label Font**: 10px Bold Open Sans
- **Label Color**: #192038 (Basic 900) or #FF7070 (Danger)
- **Gap between icon and label**: 4px
- **Alignment**: Center (horizontally and vertically)

**Divider** (optional between items):
- **Width**: 1px
- **Height**: 40px
- **Color**: #E4E9F2 (Basic 400)

## Snackbar Components

### Container
- **Width**: Full screen width minus 16px padding on each side (328px on 360px screen)
- **Height**: Auto (minimum 48px)
- **Border Radius**: 4px
- **Padding**: 14px horizontal, 12px vertical
- **Position**: Bottom, 16px from screen edge (or above bottom nav if present)

**Confirmation Snackbar:**
- **Background**: #3D2664 (Primary 500)
- **Icon**: Check circle, 20px × 20px
- **Icon Color**: #FFFFFF
- **Icon Margin Right**: 12px
- **Text Color**: #FFFFFF
- **Font**: 14px Regular Open Sans

**Warning Snackbar:**
- **Background**: #FF7070 (Danger 500)
- **Icon**: Error outline, 20px × 20px
- **Icon Color**: #FFFFFF
- **Icon Margin Right**: 12px
- **Text Color**: #FFFFFF
- **Font**: 14px Regular Open Sans

**Information Snackbar:**
- **Background**: #FFFFFF (White) or #F7F9FC (Basic 200)
- **Border**: 1px solid #E4E9F2 (Basic 400)
- **Icon**: Info outline, 20px × 20px
- **Icon Color**: #3D2664 (Primary 500)
- **Icon Margin Right**: 12px
- **Text Color**: #192038 (Basic 900)
- **Font**: 14px Regular Open Sans

## Floating Action Button (FAB)

### Standard FAB
- **Size**: 56px × 56px (standard), 48px × 48px (small), 64px × 64px (large)
- **Border Radius**: 28px, 24px, or 32px (circular)
- **Background**: #00E096 (Success 500 - green)
- **Icon Size**: 24px × 24px
- **Icon Color**: #FFFFFF (White)
- **Elevation**: 6dp (default), 12dp (hover)
- **Position**: Bottom right, 16px from edges
- **Shadow**: 0px 6px 12px rgba(0,0,0,0.25)

### Extended FAB
- **Height**: 48px
- **Horizontal Padding**: 20px
- **Border Radius**: 24px (pill)
- **Icon Size**: 24px × 24px
- **Icon Margin Right**: 12px
- **Label Font**: 14px Semi Bold Open Sans
- **Label Color**: #FFFFFF

## Avatar Components

### Circular Avatar
- **Sizes**: 24px, 32px, 40px, 48px, 64px, 88px, 120px
- **Border Radius**: 50% (circular)
- **Border**: Optional, 2px solid #FFFFFF (on colored backgrounds)
- **Placeholder Icon**: 50% of avatar size
- **Placeholder Background**: #E4E9F2 (Basic 400)
- **Placeholder Icon Color**: #8F9BB3 (Basic 600)

## Spacing System Reference

### Standard Spacing Values
- **spacing-xs**: 4px (0.5× base)
- **spacing-sm**: 8px (1× base)
- **spacing-med**: 16px (2× base)
- **spacing-lrg**: 24px (3× base)
- **spacing-xl**: 32px (4× base)
- **spacing-2xl**: 64px (8× base)

### Common Usage Patterns
- **Icon to text**: 8px (spacing-sm) or 12px
- **Between list items**: 8px (spacing-sm)
- **Card padding**: 16px (spacing-med)
- **Screen edge padding**: 16px (spacing-med) or 24px (spacing-lrg)
- **Section spacing**: 24px (spacing-lrg) or 32px (spacing-xl)
- **Button padding**: 16px horizontal (spacing-med), 12px vertical
- **Input padding**: 16px horizontal, 12px vertical

## Typography Line Height Reference

| Font Size | Line Height | Ratio | Usage |
|-----------|-------------|-------|-------|
| 10px | 16px | 1.6 | Small labels, captions |
| 12px | 16px | 1.33 | Body small, helper text |
| 14px | 20px | 1.43 | Body medium, input text |
| 16px | 24px | 1.5 | Body large, list items |
| 18px | 24px | 1.33 | Subtitle, button text |
| 20px | 28px | 1.4 | H6, section headers |
| 22px | 32px | 1.45 | H5, page headers |
| 24px | 32px | 1.33 | H4 |
| 28px | 36px | 1.29 | H3 |
| 36px | 44px | 1.22 | H2 |
| 60px | 72px | 1.2 | H1, display |

## Border Radius Reference

| Token | Value | Usage |
|-------|-------|-------|
| `radius-none` | 0px | Square corners |
| `radius-xs` | 2px | Very subtle |
| `radius-minimal` | 4px | Subtle rounding (badges, selected states) |
| `radius-rounded` | 8px | Standard rounded (buttons, cards, inputs) |
| `radius-large` | 12px | More rounded (larger cards) |
| `radius-xl` | 16px | Very rounded |
| `radius-2xl` | 20px | Extra rounded (bottom sheets) |
| `radius-pill` | 9999px | Fully rounded (pills, search bars) |

## Common Measurement Patterns

### Card with Image and Content
```
Card (total)
├── Image (AspectRatio 16:9 or 3:4)
└── Content Padding: 16px
    ├── Title
    ├── Gap: 8px
    ├── Subtitle
    ├── Gap: 16px
    └── Actions
```

### List Item with Icon and Text
```
ListTile (height: 56dp minimum)
├── Leading Icon: 24×24, margin-right: 16px
├── Title: 16px font
├── (Optional) Subtitle: 14px font, margin-top: 4px
└── Trailing Icon: 24×24, margin-left: 16px
```

### Button with Icon and Text
```
Button (height: 48px)
├── Horizontal padding: 24px
├── Icon: 24×24
├── Gap: 12px
└── Text: 18px Bold
```

### View Header Structure
```
View Header
├── Status Bar: 24px
└── Navigation Bar: 32px
    ├── Padding: 8px
    ├── Left Icon: 32×32 container, 24×24 icon
    ├── Gap: 4px
    ├── Title: Flexible, centered
    ├── Gap: 4px
    └── Right Icon: 32×32 container, 24×24 icon
```

## Notes on Precision

- All measurements are in pixels (px) or density-independent pixels (dp) for Flutter
- When converting to Flutter: 1px = 1dp on standard density devices
- Use `const` values for all spacing to enable compiler optimization
- Always align to the 8pt grid system when possible
- Use 4px for half-increments when necessary
- Minimum tap target for interactive elements: 48dp × 48dp (accessibility requirement)
