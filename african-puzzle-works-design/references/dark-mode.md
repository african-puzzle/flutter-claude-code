# Dark Mode Design System

This document defines the dark theme specifications for the African Puzzle Works design system.

## Dark Mode Philosophy

African Puzzle Works dark mode follows Material Design 3 dark theme principles:

1. **Lower Luminance**: Reduced brightness for comfortable viewing in low-light
2. **Higher Contrast**: Increased contrast for text and important elements
3. **Elevation with Overlays**: Surface elevation shown through lighter tints
4. **Desaturated Colors**: Slightly muted accent colors to reduce eye strain

## Dark Theme Color Palette

### Surface Colors

| Token | Light Mode | Dark Mode | Usage |
|-------|------------|-----------|-------|
| `background` | `#F7F9FC` (Basic 200) | `#121212` | App background |
| `surface` | `#FFFFFF` (White) | `#1E1E1E` | Card backgrounds, sheets |
| `surfaceVariant` | `#F7F9FC` (Basic 200) | `#2C2C2C` | Elevated surfaces |
| `surfaceContainerLowest` | `#FFFFFF` | `#0F0F0F` | Lowest surface |
| `surfaceContainerLow` | `#FAFAFA` | `#1A1A1A` | Low elevation |
| `surfaceContainer` | `#F5F5F5` | `#212121` | Standard elevation |
| `surfaceContainerHigh` | `#EFEFEF` | `#2C2C2C` | High elevation |
| `surfaceContainerHighest` | `#E0E0E0` | `#373737` | Highest elevation |

### Primary Colors (Adjusted)

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `primary` | `#3D2664` | `#9B7FCC` | Lightened for contrast |
| `onPrimary` | `#FFFFFF` | `#1A0D2E` | Text on primary |
| `primaryContainer` | `#C5BED1` | `#2A1B47` | Subtle primary bg |
| `onPrimaryContainer` | `#3D2664` | `#D4C4F0` | Text on container |

### Secondary Colors

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `secondary` | `#D67F28` | `#FFB366` | Lightened orange |
| `onSecondary` | `#FFFFFF` | `#2E1506` | Text on secondary |
| `secondaryContainer` | `#FFF3E0` | `#4A2F0A` | Subtle secondary bg |
| `onSecondaryContainer` | `#D67F28` | `#FFD9A3` | Text on container |

### Text Colors

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `onBackground` | `#192038` (Basic 900) | `#E8E8E8` | Body text |
| `onSurface` | `#192038` | `#E8E8E8` | Text on surfaces |
| `onSurfaceVariant` | `#8F9BB3` (Basic 600) | `#B0B0B0` | Subtle text |
| `outline` | `#E4E9F2` (Basic 400) | `#3D3D3D` | Borders, dividers |
| `outlineVariant` | `#F7F9FC` | `#2C2C2C` | Subtle borders |

### Status Colors (Adjusted)

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `success` | `#00E096` | `#4DFFB8` | Lighter green |
| `warning` | `#FFC94D` | `#FFD670` | Slightly lighter |
| `danger` | `#FF7070` | `#FF8A8A` | Slightly lighter |
| `info` | `#0095FF` | `#4DB8FF` | Lighter blue |

## Dark Mode Hex Values

For direct usage in Flutter:

```dart
class DarkColors {
  // Surfaces
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color surfaceVariant = Color(0xFF2C2C2C);

  // Primary
  static const Color primary = Color(0xFF9B7FCC);
  static const Color onPrimary = Color(0xFF1A0D2E);
  static const Color primaryContainer = Color(0xFF2A1B47);
  static const Color onPrimaryContainer = Color(0xFFD4C4F0);

  // Secondary
  static const Color secondary = Color(0xFFFFB366);
  static const Color onSecondary = Color(0xFF2E1506);
  static const Color secondaryContainer = Color(0xFF4A2F0A);
  static const Color onSecondaryContainer = Color(0xFFFFD9A3);

  // Text
  static const Color onBackground = Color(0xFFE8E8E8);
  static const Color onSurface = Color(0xFFE8E8E8);
  static const Color onSurfaceVariant = Color(0xFFB0B0B0);

  // Borders
  static const Color outline = Color(0xFF3D3D3D);
  static const Color outlineVariant = Color(0xFF2C2C2C);

  // Status
  static const Color success = Color(0xFF4DFFB8);
  static const Color warning = Color(0xFFFFD670);
  static const Color danger = Color(0xFFFF8A8A);
  static const Color info = Color(0xFF4DB8FF);
}
```

## Component Adaptations

### Buttons

**Primary Button (Dark Mode)**:
```dart
// Default state
backgroundColor: DarkColors.primary,          // #9B7FCC
foregroundColor: DarkColors.onPrimary,        // #1A0D2E

// Hover state
backgroundColor: Color(0xFFAB94D9),           // Lighter

// Pressed state
backgroundColor: Color(0xFF7B5FAC),           // Darker

// Disabled state
backgroundColor: Color(0xFF2C2C2C),
foregroundColor: Color(0xFF666666),
```

**Secondary Button (Dark Mode)**:
```dart
// Default state
borderColor: DarkColors.primary,
foregroundColor: DarkColors.primary,
backgroundColor: Colors.transparent,

// Hover state
backgroundColor: Color(0xFF2A1B47).withOpacity(0.12),

// Pressed state
backgroundColor: Color(0xFF2A1B47).withOpacity(0.16),
```

### Cards

**Dark Mode Card**:
```dart
Container(
  decoration: BoxDecoration(
    color: DarkColors.surface,                // #1E1E1E
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: DarkColors.outline.withOpacity(0.2), // Subtle border for definition
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.4),  // Stronger shadow in dark mode
        offset: const Offset(0, 2),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ],
  ),
  child: /* content */,
)
```

### Input Fields

**Dark Mode Input**:
```dart
// Default state
backgroundColor: DarkColors.surfaceVariant,   // #2C2C2C
borderColor: DarkColors.outline,              // #3D3D3D
textColor: DarkColors.onSurface,             // #E8E8E8
labelColor: DarkColors.onSurfaceVariant,     // #B0B0B0

// Focused state
backgroundColor: DarkColors.surface,          // #1E1E1E
borderColor: DarkColors.primary,              // #9B7FCC (2px)

// Error state
backgroundColor: Color(0xFF2B1616),           // Dark red tint
borderColor: DarkColors.danger,               // #FF8A8A
```

### Lists & Navigation

**List Item (Dark Mode)**:
```dart
// Default
backgroundColor: Colors.transparent,
textColor: DarkColors.onSurface,             // #E8E8E8
subtitleColor: DarkColors.onSurfaceVariant,  // #B0B0B0

// Hover
backgroundColor: Colors.white.withOpacity(0.05),

// Selected
backgroundColor: DarkColors.primary.withOpacity(0.12),
textColor: DarkColors.primary,                // #9B7FCC
```

**Bottom Navigation (Dark Mode)**:
```dart
backgroundColor: DarkColors.surface,          // #1E1E1E
selectedItemColor: DarkColors.primary,        // #9B7FCC
unselectedItemColor: DarkColors.onSurfaceVariant, // #B0B0B0
```

### View Header

**Dark Mode View Header**:
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF2A1B47),                    // Dark purple
        Color(0xFF1A0D2E),                    // Darker
      ],
    ),
  ),
  child: /* header content with white icons and text */,
)
```

## Elevation in Dark Mode

Dark mode uses **surface tint** overlays to show elevation:

| Elevation | Overlay | Resulting Color |
|-----------|---------|-----------------|
| 0dp | 0% | `#1E1E1E` (surface) |
| 1dp | 5% | `#232323` |
| 2dp | 7% | `#252525` |
| 3dp | 8% | `#272727` |
| 4dp | 9% | `#292929` |
| 6dp | 11% | `#2C2C2C` |
| 8dp | 12% | `#2E2E2E` |
| 12dp | 14% | `#313131` |

**Flutter Implementation**:
```dart
Material(
  elevation: 2,
  surfaceTintColor: DarkColors.primary,  // Tints surface with primary color
  child: /* content */,
)

// Or manual overlay
Container(
  color: Color.alphaBlend(
    DarkColors.primary.withOpacity(0.07),  // 7% overlay for 2dp
    DarkColors.surface,
  ),
)
```

## Images & Media

### Image Overlays

Add slight dimming overlay on images in dark mode:

```dart
Stack(
  children: [
    Image.network(imageUrl),
    Container(
      color: Colors.black.withOpacity(0.1), // 10% darker
    ),
  ],
)
```

### Icon Colors

Icons automatically adapt but can be manually controlled:

```dart
Icon(
  Icons.favorite,
  color: Theme.of(context).brightness == Brightness.dark
      ? DarkColors.primary
      : LightColors.primary,
)
```

## Contrast & Accessibility

### Text Contrast Ratios (Dark Mode)

Ensure WCAG AA compliance:

- **Body text** (`#E8E8E8` on `#1E1E1E`): 12.3:1 ✓
- **Subtle text** (`#B0B0B0` on `#1E1E1E`): 7.8:1 ✓
- **Primary** (`#9B7FCC` on `#1E1E1E`): 6.2:1 ✓

### Increased Contrast Mode

For accessibility, provide higher contrast option:

```dart
class HighContrastDarkColors {
  static const Color onBackground = Color(0xFFFFFFFF);  // Pure white
  static const Color primary = Color(0xFFB49ADB);       // Even lighter purple
  static const Color outline = Color(0xFF505050);       // Lighter borders
}
```

## Theme Detection & Switching

### Automatic Theme Detection

```dart
MaterialApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system, // Follows system setting
)
```

### Manual Theme Toggle

```dart
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
```

### Checking Current Theme

```dart
bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

// Usage
final textColor = isDarkMode(context)
    ? DarkColors.onSurface
    : LightColors.onSurface;
```

## Complete Dark Theme Configuration

```dart
final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    // Surfaces
    background: DarkColors.background,
    surface: DarkColors.surface,
    surfaceVariant: DarkColors.surfaceVariant,

    // Primary
    primary: DarkColors.primary,
    onPrimary: DarkColors.onPrimary,
    primaryContainer: DarkColors.primaryContainer,
    onPrimaryContainer: DarkColors.onPrimaryContainer,

    // Secondary
    secondary: DarkColors.secondary,
    onSecondary: DarkColors.onSecondary,
    secondaryContainer: DarkColors.secondaryContainer,
    onSecondaryContainer: DarkColors.onSecondaryContainer,

    // Text
    onBackground: DarkColors.onBackground,
    onSurface: DarkColors.onSurface,
    onSurfaceVariant: DarkColors.onSurfaceVariant,

    // Borders & Dividers
    outline: DarkColors.outline,
    outlineVariant: DarkColors.outlineVariant,

    // Status
    error: DarkColors.danger,
    onError: Color(0xFF1A0000),
  ),
  scaffoldBackgroundColor: DarkColors.background,

  // AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: DarkColors.primaryContainer,
    foregroundColor: DarkColors.onPrimaryContainer,
    elevation: 0,
  ),

  // Card
  cardTheme: CardTheme(
    color: DarkColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: DarkColors.outline.withOpacity(0.2),
        width: 1,
      ),
    ),
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.primary,
      foregroundColor: DarkColors.onPrimary,
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: DarkColors.primary,
      side: BorderSide(color: DarkColors.primary),
    ),
  ),

  // Input Fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: DarkColors.surfaceVariant,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: DarkColors.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DarkColors.primary, width: 2),
    ),
  ),

  // Bottom Navigation
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DarkColors.surface,
    selectedItemColor: DarkColors.primary,
    unselectedItemColor: DarkColors.onSurfaceVariant,
    elevation: 8,
  ),
);
```

## Testing Dark Mode

### Test Cases

1. **Visual Inspection**: Check all screens in dark mode
2. **Contrast**: Verify text is readable on all backgrounds
3. **Images**: Ensure images aren't too bright
4. **Transitions**: Test smooth transitions between light/dark
5. **Status Bar**: Ensure system UI adapts correctly
6. **Elevation**: Verify surface hierarchy is clear

### Testing Checklist

- [ ] All text is readable (meets WCAG AA)
- [ ] Primary colors have sufficient contrast
- [ ] Cards are distinguishable from background
- [ ] Borders are visible but subtle
- [ ] Icons are appropriately colored
- [ ] Images have appropriate brightness
- [ ] Shadows/elevation work correctly
- [ ] Status bar adapts to theme
- [ ] Navigation bar adapts to theme
- [ ] Transitions between themes are smooth
- [ ] No pure white (#FFFFFF) used except intentionally
- [ ] No pure black (#000000) used as surface color

## Dark Mode Best Practices

1. **Never Use Pure Black**: Use `#121212` or similar for backgrounds
2. **Add Surface Borders**: Dark surfaces need subtle borders for definition
3. **Lighten Accent Colors**: Make colors 20-30% lighter than light mode
4. **Increase Shadow Opacity**: Shadows need 1.5-2x opacity in dark mode
5. **Test on Real Devices**: Dark mode looks different on OLED vs LCD
6. **Respect System Setting**: Default to `ThemeMode.system`
7. **Smooth Transitions**: Animate theme changes with 200ms duration
8. **Test Edge Cases**: Check loading states, errors, empty states

## Common Dark Mode Mistakes

1. **Pure black backgrounds**: Use `#121212` instead
2. **Same colors as light mode**: Adjust saturation and lightness
3. **Insufficient contrast**: Text must be lighter
4. **Missing borders**: Surfaces blend together without borders
5. **Too bright images**: Add subtle overlay
6. **Weak shadows**: Increase shadow opacity
7. **Inconsistent elevation**: Maintain clear hierarchy

## Platform-Specific Considerations

### iOS

```dart
// Match iOS system UI colors
SystemChrome.setSystemUIOverlayStyle(
  SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,      // Light icons
    statusBarIconBrightness: Brightness.light, // Light icons
  ),
);
```

### Android

```dart
// Edge-to-edge on Android
SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ),
);
```
