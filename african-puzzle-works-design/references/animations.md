# Animation Specifications

This document defines all animations, transitions, and motion patterns for the African Puzzle Works app. Use these specifications to create smooth, consistent user experiences.

## Animation Principles

### Core Guidelines
- **Duration**: Fast actions 100-200ms, Standard 200-300ms, Complex 300-500ms
- **Easing**: Use `Curves.easeInOut` for most animations, `Curves.easeOut` for entries, `Curves.easeIn` for exits
- **Performance**: Always use implicit animations when possible, only use explicit animations when necessary
- **Consistency**: Same animation for similar interactions across the app

### Material Motion System
African Puzzle Works follows Material Design 3 motion principles:
- **Emphasize**: Transitions should guide attention
- **Express**: Animations reflect the app's personality (smooth, professional)
- **Reduce**: Avoid unnecessary motion that distracts

## Component Animations

### Snackbar Animation

**Entry Animation** (Slide from bottom):
```dart
// Duration: 200ms
// Easing: Curves.easeOut
// Transform: translateY(100%) → translateY(0)

AnimationController(
  duration: const Duration(milliseconds: 200),
  vsync: this,
);

SlideTransition(
  position: Tween<Offset>(
    begin: const Offset(0, 1), // Start below screen
    end: Offset.zero,           // End at final position
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeOut,
  )),
  child: snackbar,
)
```

**Display Duration**: 3000ms (3 seconds)

**Exit Animation** (Slide to bottom):
```dart
// Duration: 200ms
// Easing: Curves.easeIn
// Transform: translateY(0) → translateY(100%)

SlideTransition(
  position: Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1), // Slide down off screen
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  )),
  child: snackbar,
)
```

**Dismiss on Swipe**:
- **Gesture**: Vertical drag down
- **Threshold**: 50px drag distance
- **Animation**: Follow finger, then animate completion
- **Duration**: Remaining distance / velocity (natural feel)

### Bottom Sheet Animation

**Entry Animation** (Slide from bottom with backdrop):
```dart
// Duration: 300ms
// Easing: Curves.easeOut
// Backdrop fade: 0 → 0.5 opacity
// Sheet slide: translateY(100%) → translateY(0)

showModalBottomSheet(
  context: context,
  transitionAnimationController: AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: Navigator.of(context),
  ),
  builder: (context) => BottomSheetContent(),
);

// Backdrop
FadeTransition(
  opacity: Tween<double>(begin: 0.0, end: 0.5).animate(
    CurvedAnimation(parent: controller, curve: Curves.easeOut),
  ),
  child: backdrop,
)

// Sheet
SlideTransition(
  position: Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeOut,
  )),
  child: sheet,
)
```

**Drag Interaction**:
- **Interactive**: User can drag sheet up/down
- **Snap Points**: Half-expanded, fully-expanded, dismissed
- **Velocity Threshold**: 700 px/s for snap decision
- **Spring**: Use spring physics for natural feel

**Exit Animation**:
- **Duration**: 250ms
- **Easing**: Curves.easeIn
- **Backdrop fade**: 0.5 → 0 opacity
- **Sheet slide**: translateY(0) → translateY(100%)

**Drag Handle Hint**:
- **Animation**: Subtle bounce on sheet appearance
- **Duration**: 400ms
- **Pattern**: Small up/down movement (±4px)
- **Delay**: 500ms after sheet appears

### Button Animations

**Press Animation** (Ripple + Scale):
```dart
// Ripple (Material InkWell)
InkWell(
  splashColor: AppColors.primary500.withOpacity(0.12),
  highlightColor: AppColors.primary500.withOpacity(0.08),
  onTap: onPressed,
  child: buttonContent,
)

// Optional: Scale down on press
AnimatedScale(
  scale: isPressed ? 0.98 : 1.0,
  duration: const Duration(milliseconds: 100),
  curve: Curves.easeInOut,
  child: button,
)
```

**Ripple Specifications**:
- **Duration**: 200ms (expansion), 150ms (fade out)
- **Start**: Touch point
- **Radius**: Expands to cover entire button
- **Color**: Primary color at 12% opacity (light), 20% (dark)
- **Shape**: Follows button border radius

**Disabled → Enabled Transition**:
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeInOut,
  color: isEnabled ? AppColors.primary500 : AppColors.basic300,
  child: buttonContent,
)
```

**Loading State**:
```dart
// Fade transition between text and spinner
AnimatedCrossFade(
  firstChild: Text('Submit'),
  secondChild: SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 2),
  ),
  crossFadeState: isLoading
    ? CrossFadeState.showSecond
    : CrossFadeState.showFirst,
  duration: const Duration(milliseconds: 200),
)
```

### Input Field Animations

**Focus Transition**:
```dart
// Border color and width change
AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeInOut,
  decoration: BoxDecoration(
    border: Border.all(
      color: isFocused ? AppColors.primary500 : AppColors.basic400,
      width: isFocused ? 2 : 1,
    ),
    borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
  ),
  child: input,
)
```

**Label Float**:
```dart
// Label moves up and shrinks on focus
AnimatedPositioned(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeOut,
  top: isFocused || hasText ? 8 : 16,
  left: 16,
  child: AnimatedDefaultTextStyle(
    duration: const Duration(milliseconds: 200),
    style: TextStyle(
      fontSize: isFocused || hasText ? 12 : 16,
      color: isFocused ? AppColors.primary500 : AppColors.basic600,
    ),
    child: Text('Label'),
  ),
)
```

**Error State Transition**:
```dart
// Shake animation for error
AnimatedBuilder(
  animation: controller,
  builder: (context, child) {
    return Transform.translate(
      offset: Offset(sin(controller.value * pi * 2) * 4, 0),
      child: child,
    );
  },
  child: inputField,
)

// Error message slide in
AnimatedSize(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeOut,
  child: hasError
    ? ErrorMessage(message: error)
    : const SizedBox.shrink(),
)
```

### Card Animations

**Hover/Press Elevation**:
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 150),
  curve: Curves.easeOut,
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(isHovered ? 0.3 : 0.25),
        blurRadius: isHovered ? 16 : 12,
        spreadRadius: isHovered ? 4 : 2,
        offset: Offset(0, isHovered ? 4 : 2),
      ),
    ],
  ),
  child: cardContent,
)
```

**Selection State**:
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeInOut,
  decoration: BoxDecoration(
    border: Border.all(
      color: isSelected ? AppColors.primary500 : Colors.transparent,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
  ),
  child: cardContent,
)
```

### List Animations

**Item Entry** (Staggered fade + slide):
```dart
ListView.builder(
  itemBuilder: (context, index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 200 + (index * 50)),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: ListItemWidget(index: index),
    );
  },
)
```

**Item Removal** (Slide out + size collapse):
```dart
AnimatedList(
  key: listKey,
  itemBuilder: (context, index, animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: ListItem(index: index),
      ),
    );
  },
)

// Remove item
listKey.currentState!.removeItem(
  index,
  (context, animation) => SizeTransition(
    sizeFactor: animation,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1, 0), // Slide right
      ).animate(animation),
      child: ListItem(index: index),
    ),
  ),
  duration: const Duration(milliseconds: 300),
);
```

**Pull-to-Refresh**:
```dart
RefreshIndicator(
  onRefresh: refreshData,
  displacement: 40,
  strokeWidth: 2.5,
  color: AppColors.primary500,
  // Standard Material animation (automatic)
  child: listView,
)
```

### Page Transitions

**Forward Navigation** (Slide from right):
```dart
PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => NewPage(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0), // Start off screen right
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      )),
      child: child,
    );
  },
  transitionDuration: const Duration(milliseconds: 300),
)
```

**Back Navigation** (Slide to right):
- **Duration**: 250ms (slightly faster than forward)
- **Easing**: Curves.easeInOut
- **Current page**: Slide right (off screen)
- **Previous page**: Revealed underneath

**Modal Page** (Slide up):
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    fullscreenDialog: true,
    pageBuilder: (context, animation, secondaryAnimation) => ModalPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start below
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        )),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  ),
);
```

### Hero Animations

**Image Expansion** (List to Detail):
```dart
// List item
Hero(
  tag: 'product-image-${product.id}',
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.network(product.imageUrl),
  ),
)

// Detail page
Hero(
  tag: 'product-image-${product.id}',
  child: Image.network(product.imageUrl),
)

// Automatic smooth transition between the two
```

**Flight Duration**: 300ms (Material default)

**Custom Hero Flight**:
```dart
Hero(
  tag: 'custom-hero',
  flightShuttleBuilder: (flightContext, animation, direction,
                         fromContext, toContext) {
    return ScaleTransition(
      scale: animation.drive(
        Tween<double>(begin: 0.8, end: 1.0).chain(
          CurveTween(curve: Curves.easeOut),
        ),
      ),
      child: toContext.widget,
    );
  },
  child: widget,
)
```

### FAB Animations

**Show/Hide on Scroll**:
```dart
AnimatedScale(
  scale: isVisible ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeInOut,
  child: FloatingActionButton(
    onPressed: onPressed,
    child: const Icon(Icons.add),
  ),
)
```

**Extended FAB Expand/Collapse**:
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  width: isExpanded ? 120 : 56,
  height: 56,
  curve: Curves.easeInOut,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.add),
      AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: isExpanded
          ? Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('Add'),
            )
          : const SizedBox.shrink(),
      ),
    ],
  ),
)
```

### Context Menu Animation

**Appear** (Fade + Scale):
```dart
// Duration: 150ms
// Entry: Scale from 0.8 to 1.0, Opacity 0 to 1

ScaleTransition(
  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ),
  ),
  child: FadeTransition(
    opacity: controller,
    child: contextMenu,
  ),
)
```

**Dismiss** (Fade out):
```dart
// Duration: 100ms
// Exit: Opacity 1 to 0 (no scale)

FadeTransition(
  opacity: Tween<double>(begin: 1.0, end: 0.0).animate(controller),
  child: contextMenu,
)
```

### Loading States

**Circular Progress Indicator**:
```dart
CircularProgressIndicator(
  strokeWidth: 2.5,
  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary500),
  // Rotation: Automatic, continuous
  // Speed: ~1.5 seconds per rotation
)
```

**Linear Progress Indicator**:
```dart
LinearProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary500),
  backgroundColor: AppColors.basic300,
  minHeight: 4,
  // Animation: Automatic, continuous
)
```

**Skeleton Loader** (Shimmer effect):
```dart
TweenAnimationBuilder<double>(
  tween: Tween(begin: -1.0, end: 2.0),
  duration: const Duration(milliseconds: 1500),
  curve: Curves.linear,
  onEnd: () => setState(() {}), // Repeat
  builder: (context, value, child) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            max(0.0, value - 0.3),
            max(0.0, value),
            min(1.0, value + 0.3),
          ],
          colors: const [
            Color(0xFFE4E9F2), // Basic 300
            Color(0xFFD4D9E2), // Lighter
            Color(0xFFE4E9F2), // Basic 300
          ],
        ),
      ),
    );
  },
)
```

### View Header Transitions

**Title Change** (Fade + Slide):
```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 200),
  transitionBuilder: (child, animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  },
  child: Text(
    title,
    key: ValueKey(title), // Key changes trigger animation
    style: headerTextStyle,
  ),
)
```

**Calendar Expand/Collapse**:
```dart
AnimatedSize(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  child: isExpanded
    ? CalendarGrid()
    : const SizedBox.shrink(),
)
```

### Badge Animations

**Count Update** (Scale pulse):
```dart
TweenAnimationBuilder<double>(
  tween: Tween(begin: 1.0, end: 1.2),
  duration: const Duration(milliseconds: 150),
  curve: Curves.easeOut,
  onEnd: () {
    // Scale back to 1.0
    setState(() {});
  },
  builder: (context, scale, child) {
    return Transform.scale(
      scale: scale,
      child: Badge(
        label: Text('$count'),
      ),
    );
  },
)
```

## Micro-interactions

### Haptic Feedback
```dart
// Light impact (button tap)
HapticFeedback.lightImpact();

// Medium impact (toggle switch, selection)
HapticFeedback.mediumImpact();

// Heavy impact (long press, context menu)
HapticFeedback.heavyImpact();

// Selection (picker scroll)
HapticFeedback.selectionClick();
```

**When to Use**:
- Button press: Light impact
- Context menu open: Medium impact
- Delete confirmation: Heavy impact
- Picker scrolling: Selection click

### Sound Effects
- **Button tap**: Subtle click (optional, off by default)
- **Error**: System error sound
- **Success**: System success sound
- **Keep sounds minimal** and respect system settings

## Animation Performance Guidelines

### Best Practices
1. **Use Implicit Animations**: `AnimatedContainer`, `AnimatedOpacity`, etc.
2. **Avoid Expensive Operations**: Don't animate complex layouts or heavy widgets
3. **RepaintBoundary**: Wrap animated widgets to isolate repaints
4. **Transform Instead of Layout**: Use `Transform` instead of changing size/position
5. **Optimize Images**: Use cached images, appropriate resolutions

### Performance Optimization
```dart
// Good: Transform (GPU accelerated)
Transform.translate(
  offset: Offset(0, animation.value),
  child: widget,
)

// Avoid: Layout changes (CPU intensive)
Padding(
  padding: EdgeInsets.only(top: animation.value),
  child: widget,
)

// Isolate repaints
RepaintBoundary(
  child: AnimatedWidget(),
)
```

### Testing Animations
- **Timeline**: Use Flutter DevTools Timeline to check for jank
- **FPS Target**: Maintain 60 FPS (16ms per frame)
- **Slow Animations**: Use `timeDilation = 5.0` to debug
- **Real Devices**: Always test on physical devices, not just simulators

## Accessibility Considerations

### Reduced Motion
```dart
// Respect system preference for reduced motion
final reducedMotion = MediaQuery.of(context).disableAnimations;

AnimatedContainer(
  duration: reducedMotion
    ? Duration.zero
    : const Duration(milliseconds: 300),
  child: widget,
)
```

### Animation Toggle
- **Provide setting**: Allow users to disable animations app-wide
- **Essential Only**: Keep essential feedback animations (button press)
- **Reduce Duration**: Halve animation durations when reduced motion enabled

## Animation Timing Summary

| Animation Type | Duration | Curve | Notes |
|----------------|----------|-------|-------|
| Button ripple | 200ms | Linear | Material standard |
| Button scale | 100ms | easeInOut | Subtle press |
| Page transition | 300ms | easeInOut | Forward navigation |
| Page back | 250ms | easeInOut | Slightly faster |
| Modal appear | 300ms | easeOut | From bottom |
| Bottom sheet | 300ms | easeOut | With backdrop |
| Snackbar entry | 200ms | easeOut | Slide from bottom |
| Snackbar exit | 200ms | easeIn | Slide to bottom |
| Input focus | 200ms | easeInOut | Border + color |
| Card hover | 150ms | easeOut | Elevation change |
| List item enter | 200ms + 50ms/item | easeOut | Staggered |
| Loading spinner | 1500ms | Linear | Continuous rotation |
| Shimmer | 1500ms | Linear | Continuous loop |
| Hero transition | 300ms | fastOutSlowIn | Material default |
| Badge pulse | 150ms + 150ms | easeOut | Scale up then down |
| FAB show/hide | 200ms | easeInOut | Scale in/out |
| Context menu | 150ms | easeOut | Fade + scale |

## Code Examples Reference

All animation code examples in this document follow Flutter best practices and can be used directly in the African Puzzle Works app. For more complex animations, consult the Flutter animations documentation at flutter.dev/docs/development/ui/animations.
