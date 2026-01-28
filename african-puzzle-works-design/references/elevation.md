# Elevation & Shadow System

This document defines the elevation levels, shadow specifications, and depth hierarchy for the African Puzzle Works design system.

## Material Design Elevation

African Puzzle Works follows Material Design 3 elevation principles with custom shadow values optimized for the app's visual style.

## Elevation Levels

### 0dp - Flat Surface (No Elevation)

**Use Cases**:
- Disabled components
- Flat UI elements
- Background surfaces

**Shadow**: None

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    // No shadow
  ),
)
```

---

### 1dp - Minimal Elevation

**Use Cases**:
- Pressed cards
- Active buttons
- Dragged items (start)

**Shadow**: `0px 1px 2px rgba(0, 0, 0, 0.2)`

**Properties**:
- Offset: (0, 1)
- Blur: 2px
- Spread: 0px
- Color: Black at 20% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

### 2dp - Resting Elevation

**Use Cases**:
- Cards (default)
- Buttons (default)
- Input fields with elevation
- App bar (resting)

**Shadow**: `0px 2px 4px rgba(0, 0, 0, 0.15)`

**Properties**:
- Offset: (0, 2)
- Blur: 4px
- Spread: 0px
- Color: Black at 15% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        offset: const Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

**Material Widget**:
```dart
Material(
  elevation: 2,
  borderRadius: BorderRadius.circular(8),
  child: /* content */,
)
```

---

### 3dp - Raised Elevation

**Use Cases**:
- Hover states for cards
- Snackbars
- Menus (resting)

**Shadow**: `0px 3px 6px rgba(0, 0, 0, 0.16)`

**Properties**:
- Offset: (0, 3)
- Blur: 6px
- Spread: 0px
- Color: Black at 16% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.16),
        offset: const Offset(0, 3),
        blurRadius: 6,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

### 4dp - Hover Elevation

**Use Cases**:
- Card hover states
- Button hover states
- Raised interactive elements

**Shadow**: `0px 4px 8px rgba(0, 0, 0, 0.15)`

**Properties**:
- Offset: (0, 4)
- Blur: 8px
- Spread: 0px
- Color: Black at 15% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        offset: const Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

### 6dp - FAB & Important Elements

**Use Cases**:
- Floating Action Button (resting)
- Important raised elements
- Prominent cards

**Shadow**: `0px 6px 12px rgba(0, 0, 0, 0.25)`

**Properties**:
- Offset: (0, 6)
- Blur: 12px
- Spread: 0px
- Color: Black at 25% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: AppColors.success500,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 6),
        blurRadius: 12,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

### 8dp - Navigation & Modals

**Use Cases**:
- Bottom sheets
- Navigation drawers
- Dropdown menus
- Modal dialogs (lower layer)

**Shadow**: `0px 8px 16px rgba(0, 0, 0, 0.2)`

**Properties**:
- Offset: (0, 8)
- Blur: 16px
- Spread: 0px
- Color: Black at 20% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, 8),
        blurRadius: 16,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

### 12dp - FAB Hover & Overlays

**Use Cases**:
- FAB hover state
- Active dialogs
- Highest priority overlays

**Shadow**: `0px 12px 24px rgba(0, 0, 0, 0.3)`

**Properties**:
- Offset: (0, 12)
- Blur: 24px
- Spread: 0px
- Color: Black at 30% opacity

**Flutter**:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        offset: const Offset(0, 12),
        blurRadius: 24,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

---

## Component Elevation Mapping

### Cards

| State | Elevation | Shadow |
|-------|-----------|--------|
| Default | 2dp | `0px 2px 12px 2px rgba(0,0,0,0.25)` |
| Hover | 4dp | `0px 4px 16px 2px rgba(0,0,0,0.25)` |
| Pressed | 1dp | `0px 1px 8px 2px rgba(0,0,0,0.2)` |

**Special Note**: Cards use a modified shadow with spread radius (2px) for more prominent appearance.

```dart
// Card default state
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 2),
        blurRadius: 12,
        spreadRadius: 2, // Note: spread radius
      ),
    ],
  ),
)
```

### Buttons

| Type | State | Elevation | Shadow |
|------|-------|-----------|--------|
| Primary | Default | 2dp | `0px 2px 4px rgba(0,0,0,0.15)` |
| Primary | Hover | 4dp | `0px 4px 8px rgba(0,0,0,0.15)` |
| Primary | Pressed | 1dp | `0px 1px 2px rgba(0,0,0,0.2)` |
| Secondary | All | 0dp | None |
| Text | All | 0dp | None |

### Floating Action Button (FAB)

| State | Elevation | Shadow |
|-------|-----------|--------|
| Default | 6dp | `0px 6px 12px rgba(0,0,0,0.25)` |
| Hover | 12dp | `0px 12px 24px rgba(0,0,0,0.3)` |
| Pressed | 6dp | `0px 6px 12px rgba(0,0,0,0.25)` |

### App Bar / View Header

| State | Elevation | Shadow |
|-------|-----------|--------|
| Default | 0dp | None (uses gradient) |
| Scrolled | 2dp | `0px 2px 4px rgba(0,0,0,0.15)` |

**Note**: View headers typically use gradients instead of shadows for visual depth.

### Bottom Navigation

| State | Elevation | Shadow |
|-------|-----------|--------|
| Default | 8dp | `0px 8px 16px rgba(0,0,0,0.2)` |

### Modals & Overlays

| Component | Elevation | Shadow |
|-----------|-----------|--------|
| Snackbar | 3dp | `0px 3px 6px rgba(0,0,0,0.16)` |
| Bottom Sheet | 8dp | `0px 8px 16px rgba(0,0,0,0.2)` |
| Dialog | 12dp | `0px 12px 24px rgba(0,0,0,0.3)` |
| Context Menu | 8dp | `0px 8px 16px rgba(0,0,0,0.2)` |
| Dropdown Menu | 8dp | `0px 8px 16px rgba(0,0,0,0.2)` |

### Input Fields

| State | Elevation | Shadow |
|-------|-----------|--------|
| Default | 0dp | None (uses border) |
| Focused | 0dp | None |
| Error | 0dp | None |

**Note**: Input fields rely on borders for visual definition, not elevation.

## Elevation Best Practices

### Z-Axis Hierarchy

Components at higher elevations should be above those at lower elevations:

```
0dp  - Background, disabled elements
1dp  - Pressed states
2dp  - Resting surfaces (cards, buttons)
3dp  - Snackbars
4dp  - Hover states
6dp  - FAB
8dp  - Modals, bottom sheets
12dp - Dialogs, FAB hover
```

### Elevation Transitions

Animate elevation changes smoothly:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 150),
  curve: Curves.easeOut,
  decoration: BoxDecoration(
    boxShadow: isHovered
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ]
        : [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
  ),
)
```

### Accessibility

- Use elevation to convey hierarchy, not as the sole indicator
- Ensure sufficient color contrast at all elevation levels
- Don't rely solely on shadows for critical UI elements

### Performance

- Minimize number of elevated surfaces on screen
- Use `Material` widget for better performance than `Container` + `BoxShadow`
- Avoid animating elevation on long lists (use static elevation)

```dart
// Preferred for performance
Material(
  elevation: 2,
  child: /* content */,
)

// Less performant
Container(
  decoration: BoxDecoration(
    boxShadow: [/* manual shadow */],
  ),
)
```

## Special Shadow Cases

### Text Shadows

Used for text overlaid on images or complex backgrounds:

**Light Text on Dark/Image Background**:
- Shadow: `0px 2px 3px rgba(0, 0, 0, 0.5)`

```dart
Text(
  'Title',
  style: TextStyle(
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.5),
        offset: const Offset(0, 2),
        blurRadius: 3,
      ),
    ],
  ),
)
```

### Inner Shadows

For inset/recessed elements (rare, typically not used in Material Design):

```dart
// Simulated with gradients or borders
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black.withOpacity(0.05),
        Colors.transparent,
      ],
      stops: const [0.0, 0.1],
    ),
  ),
)
```

### Colored Shadows

For brand elements or special emphasis (use sparingly):

```dart
Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.primary500.withOpacity(0.3),
        offset: const Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  ),
)
```

## Dark Mode Adjustments

In dark mode, shadows are less visible. Compensate by:

1. **Increasing shadow opacity**: 1.5x the light mode opacity
2. **Using lighter shadow colors**: Dark grey instead of black
3. **Adding subtle borders**: 1px border in `rgba(255, 255, 255, 0.1)`

```dart
final isDark = Theme.of(context).brightness == Brightness.dark;

Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: (isDark ? Colors.black : Colors.black)
            .withOpacity(isDark ? 0.4 : 0.25),
        offset: const Offset(0, 2),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ],
    border: isDark
        ? Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          )
        : null,
  ),
)
```

## Elevation Testing Checklist

- [ ] Shadows render correctly on light background
- [ ] Shadows render correctly on dark background
- [ ] Elevation hierarchy is visually clear
- [ ] Shadow transitions are smooth (150-200ms)
- [ ] No performance issues with multiple shadows
- [ ] Shadows don't cause z-index conflicts
- [ ] Elevated elements are accessible
- [ ] Color contrast meets WCAG standards at all elevations

## Common Mistakes to Avoid

1. **Too many elevation levels**: Stick to the defined levels
2. **Shadows on transparent backgrounds**: Ensure containers have background colors
3. **Inconsistent shadows**: Use defined elevations, not custom values
4. **Heavy shadows everywhere**: Use elevation purposefully for hierarchy
5. **Animating shadows on scroll**: Causes performance issues
6. **No elevation in dark mode**: Dark mode needs stronger/modified shadows

## Flutter Shadow Constants

Create reusable shadow constants for consistency:

```dart
class AppShadows {
  static List<BoxShadow> elevation0 = [];

  static List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  static List<BoxShadow> elevation4 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 4),
      blurRadius: 8,
    ),
  ];

  static List<BoxShadow> elevation6 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      offset: const Offset(0, 6),
      blurRadius: 12,
    ),
  ];

  static List<BoxShadow> elevation8 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      offset: const Offset(0, 8),
      blurRadius: 16,
    ),
  ];

  static List<BoxShadow> elevation12 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 12),
      blurRadius: 24,
    ),
  ];

  // Card-specific shadows with spread
  static List<BoxShadow> cardDefault = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      offset: const Offset(0, 2),
      blurRadius: 12,
      spreadRadius: 2,
    ),
  ];

  static List<BoxShadow> cardHover = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 2,
    ),
  ];
}

// Usage
Container(
  decoration: BoxDecoration(
    boxShadow: AppShadows.elevation2,
  ),
)
```
