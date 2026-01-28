# Responsive Design System

This document defines responsive behavior, breakpoints, and adaptive layouts for the African Puzzle Works mobile application.

## Target Devices

African Puzzle Works is a **mobile-first application** targeting:

- **iOS**: iPhone SE (2020) to iPhone 15 Pro Max
- **Android**: Small phones (360dp width) to large phones/small tablets (600dp width)

### Screen Size Ranges

| Category | Width Range | Height Range | Orientation |
|----------|-------------|--------------|-------------|
| Small Phone | 320-375dp | 568-667dp | Portrait |
| Medium Phone | 375-414dp | 667-896dp | Portrait |
| Large Phone | 414-480dp | 896-932dp | Portrait |
| Landscape | 667-932dp | 320-414dp | Landscape |

**Primary Target**: Medium Phone (375-414dp width) portrait orientation

## Breakpoints

### Width Breakpoints

```dart
class Breakpoints {
  // Mobile breakpoints
  static const double smallPhone = 360;     // Minimum supported
  static const double mediumPhone = 375;    // iPhone SE, 12 mini
  static const double largePhone = 414;     // iPhone 14 Pro, Pixel 7
  static const double extraLargePhone = 480; // iPhone 14 Pro Max, large Android

  // Landscape breakpoint (not primary target)
  static const double landscape = 600;
}
```

### Breakpoint Usage

```dart
double screenWidth = MediaQuery.of(context).size.width;

if (screenWidth < Breakpoints.mediumPhone) {
  // Small phone layout
} else if (screenWidth < Breakpoints.largePhone) {
  // Medium phone layout (default)
} else {
  // Large phone layout
}
```

Or use `LayoutBuilder`:

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 375) {
      return SmallPhoneLayout();
    } else if (constraints.maxWidth < 414) {
      return MediumPhoneLayout();
    } else {
      return LargePhoneLayout();
    }
  },
)
```

## Responsive Spacing

### Horizontal Padding

Adjust horizontal padding based on screen width:

```dart
double getHorizontalPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 360) {
    return 12; // Tight padding for very small phones
  } else if (width < 414) {
    return 16; // Standard padding
  } else {
    return 24; // More breathing room for large phones
  }
}

// Usage
Padding(
  padding: EdgeInsets.symmetric(
    horizontal: getHorizontalPadding(context),
  ),
  child: /* content */,
)
```

### Vertical Spacing

Scale vertical spacing slightly for larger screens:

```dart
class ResponsiveSpacing {
  static double xs(BuildContext context) => _scale(context, 4);
  static double sm(BuildContext context) => _scale(context, 8);
  static double md(BuildContext context) => _scale(context, 16);
  static double lg(BuildContext context) => _scale(context, 24);
  static double xl(BuildContext context) => _scale(context, 32);
  static double xxl(BuildContext context) => _scale(context, 48);

  static double _scale(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;

    if (width > 414) {
      return baseSize * 1.1; // 10% larger on big phones
    }
    return baseSize;
  }
}
```

## Typography Scaling

### Responsive Font Sizes

Font sizes remain mostly constant but can scale slightly for readability:

```dart
class ResponsiveTypography {
  static double scaleFont(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;

    // Don't scale for standard sizes
    if (width >= 375 && width <= 414) {
      return baseSize;
    }

    // Slightly smaller for very small phones
    if (width < 360) {
      return baseSize * 0.95;
    }

    // Slightly larger for extra large phones
    if (width > 414) {
      return baseSize * 1.05;
    }

    return baseSize;
  }
}

// Usage
Text(
  'Title',
  style: TextStyle(
    fontSize: ResponsiveTypography.scaleFont(context, 22),
  ),
)
```

**Important**: Use responsive font scaling sparingly. Fixed sizes are preferable for consistency.

## Component Adaptations

### View Header

View headers remain fixed height but adjust padding:

```dart
class ResponsiveViewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width < 360 ? 4.0 : 8.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 8,
      ),
      child: /* header content */,
    );
  }
}
```

### Cards

Cards adjust padding and image aspect ratios:

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardPadding = width < 360 ? 12.0 : 16.0;

    return Container(
      padding: EdgeInsets.all(cardPadding),
      child: /* card content */,
    );
  }
}
```

### Grid Layouts

Adjust grid columns based on available width:

```dart
int getGridCrossAxisCount(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 360) {
    return 2; // 2 columns for small phones
  } else if (width < 480) {
    return 2; // 2 columns for medium phones (default)
  } else {
    return 3; // 3 columns for large phones/landscape
  }
}

GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: getGridCrossAxisCount(context),
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.75,
  ),
  itemBuilder: (context, index) => /* grid item */,
)
```

### Bottom Navigation

Bottom navigation remains constant height but can adjust icon/label sizes:

```dart
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: MediaQuery.of(context).size.width < 360 ? 20 : 24,
      ),
      label: 'Home',
    ),
    // ... other items
  ],
)
```

### Buttons

Buttons maintain minimum tap target (48dp) but can adjust padding:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width < 360 ? 16 : 24,
      vertical: 12,
    ),
  ),
  child: const Text('Button'),
  onPressed: () {},
)
```

## Landscape Orientation

### Detection

```dart
bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}
```

### Landscape Adaptations

**View Header**: Consider hiding or collapsing when keyboard is visible

```dart
@override
Widget build(BuildContext context) {
  final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
  final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

  if (isLandscape && keyboardVisible) {
    return const SizedBox.shrink(); // Hide header in landscape + keyboard
  }

  return ViewHeader(/* ... */);
}
```

**Dialogs**: Use full-width in landscape

```dart
showDialog(
  context: context,
  builder: (context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: isLandscape ? 40 : 16,
        vertical: isLandscape ? 16 : 24,
      ),
      child: /* dialog content */,
    );
  },
);
```

**Lists**: Consider horizontal scrolling for content in landscape

```dart
ListView.builder(
  scrollDirection: isLandscape(context)
      ? Axis.horizontal
      : Axis.vertical,
  itemBuilder: (context, index) => /* item */,
)
```

## Safe Area Handling

Always respect device safe areas (notches, home indicators):

```dart
SafeArea(
  child: Scaffold(
    body: /* content */,
  ),
)
```

### Selective Safe Area

Apply safe area only where needed:

```dart
SafeArea(
  top: true,      // Respect top notch
  bottom: false,  // Don't add padding at bottom (for full-height images)
  child: /* content */,
)
```

### Manual Safe Area Padding

```dart
final topPadding = MediaQuery.of(context).padding.top;    // Notch/status bar
final bottomPadding = MediaQuery.of(context).padding.bottom; // Home indicator

Container(
  padding: EdgeInsets.only(
    top: topPadding + 16,      // Safe area + custom padding
    bottom: bottomPadding + 16,
  ),
  child: /* content */,
)
```

## Responsive Images

### Aspect Ratios

Maintain aspect ratios while filling available space:

```dart
AspectRatio(
  aspectRatio: 16 / 9, // or 1.0 for square, 4 / 3, etc.
  child: Image.network(
    imageUrl,
    fit: BoxFit.cover,
  ),
)
```

### Responsive Image Sizing

```dart
class ResponsiveImage extends StatelessWidget {
  final String url;

  const ResponsiveImage({required this.url});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imageWidth = width < 360 ? width - 32 : width - 48;

    return Image.network(
      url,
      width: imageWidth,
      fit: BoxFit.cover,
    );
  }
}
```

## Text Overflow Handling

### Single Line with Ellipsis

```dart
Text(
  'Very long title that might overflow on small screens',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(fontSize: 18),
)
```

### Multi-Line with Max Lines

```dart
Text(
  'Longer description that can wrap to multiple lines but has a maximum',
  maxLines: 3,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(fontSize: 14),
)
```

### Responsive Max Lines

```dart
Text(
  description,
  maxLines: MediaQuery.of(context).size.width < 360 ? 2 : 3,
  overflow: TextOverflow.ellipsis,
)
```

## Keyboard Handling

### Adjust for Keyboard

```dart
@override
Widget build(BuildContext context) {
  final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

  return Padding(
    padding: EdgeInsets.only(bottom: keyboardHeight),
    child: /* content */,
  );
}
```

### Scroll When Keyboard Appears

```dart
SingleChildScrollView(
  child: Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    child: Form(/* form fields */),
  ),
)
```

### Resize vs. Overlap

In `Scaffold`, control keyboard behavior:

```dart
Scaffold(
  resizeToAvoidBottomInset: true, // Resize content when keyboard appears (default)
  body: /* content */,
)
```

## Responsive Utilities

### MediaQuery Helpers

```dart
extension ResponsiveExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isSmallPhone => screenWidth < 360;
  bool get isMediumPhone => screenWidth >= 360 && screenWidth < 414;
  bool get isLargePhone => screenWidth >= 414;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
}

// Usage
if (context.isSmallPhone) {
  // Small phone specific code
}
```

### Responsive Widget Wrapper

```dart
class Responsive extends StatelessWidget {
  final Widget smallPhone;
  final Widget? mediumPhone;
  final Widget? largePhone;

  const Responsive({
    required this.smallPhone,
    this.mediumPhone,
    this.largePhone,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) {
      return smallPhone;
    } else if (width < 414) {
      return mediumPhone ?? smallPhone;
    } else {
      return largePhone ?? mediumPhone ?? smallPhone;
    }
  }
}

// Usage
Responsive(
  smallPhone: CompactLayout(),
  mediumPhone: StandardLayout(),
  largePhone: SpaciousLayout(),
)
```

## Testing Responsive Design

### Device Preview

Use `device_preview` package for testing multiple screen sizes:

```dart
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: HomeScreen(),
    );
  }
}
```

### Manual Testing

Test on these specific dimensions:

| Device | Width | Height | Notes |
|--------|-------|--------|-------|
| iPhone SE (2020) | 375 | 667 | Smallest common iPhone |
| iPhone 12/13 | 390 | 844 | Standard iPhone |
| iPhone 14 Pro Max | 430 | 932 | Largest iPhone |
| Pixel 5 | 393 | 851 | Medium Android |
| Galaxy S21 | 360 | 800 | Small Android |

## Responsive Best Practices

1. **Mobile-First**: Design for small screens first, enhance for larger
2. **Fixed Heights**: Avoid hardcoding heights; use flexible widgets
3. **Flexible Widths**: Use `Expanded`, `Flexible`, `MediaQuery` for widths
4. **Safe Areas**: Always respect safe areas with `SafeArea` or `MediaQuery.padding`
5. **Touch Targets**: Maintain 48dp minimum for interactive elements
6. **Text Overflow**: Always handle with `maxLines` and `overflow`
7. **Keyboard**: Test all forms with keyboard visible
8. **Orientation**: Test landscape orientation for critical screens
9. **Real Devices**: Test on actual devices, not just simulators

## Common Responsive Patterns

### Full-Width with Max Width

```dart
Center(
  child: Container(
    width: double.infinity,
    constraints: const BoxConstraints(maxWidth: 480),
    child: /* content */,
  ),
)
```

### Flexible Rows/Columns

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: /* takes 2/3 of space */,
    ),
    Expanded(
      flex: 1,
      child: /* takes 1/3 of space */,
    ),
  ],
)
```

### Adaptive Columns

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 360) {
      return Column(
        children: [widget1, widget2],
      );
    } else {
      return Row(
        children: [
          Expanded(child: widget1),
          Expanded(child: widget2),
        ],
      );
    }
  },
)
```

### Responsive Padding

```dart
Padding(
  padding: EdgeInsets.all(
    MediaQuery.of(context).size.width < 360 ? 12 : 16,
  ),
  child: /* content */,
)
```

## Responsive Checklist

- [ ] Tested on 360dp width (smallest)
- [ ] Tested on 375dp width (iPhone SE)
- [ ] Tested on 414dp width (iPhone 14 Pro)
- [ ] Tested on 430dp+ width (iPhone 14 Pro Max)
- [ ] Landscape orientation handled
- [ ] Safe areas respected (top notch, bottom home indicator)
- [ ] Keyboard doesn't obscure input fields
- [ ] Text doesn't overflow on small screens
- [ ] Touch targets are minimum 48dp
- [ ] Images scale properly
- [ ] No hardcoded widths (except for max constraints)
- [ ] Horizontal padding adjusts for screen size
