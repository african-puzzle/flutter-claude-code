# Icon System

This document defines the icon library, sizing system, color usage, and patterns for the African Puzzle Works design system.

## Icon Library

African Puzzle Works uses **Material Icons** from the Flutter `Icons` class.

### Primary Icons Used

#### Navigation
- `Icons.menu` - Hamburger menu (view headers)
- `Icons.arrow_back` - Back navigation
- `Icons.arrow_forward` - Forward navigation
- `Icons.close` - Close/dismiss
- `Icons.expand_more` - Dropdown/expand down
- `Icons.expand_less` - Collapse/expand up
- `Icons.chevron_right` - Navigate forward/disclosure
- `Icons.chevron_left` - Navigate backward

#### Actions
- `Icons.add` - Add new item
- `Icons.edit` - Edit content
- `Icons.delete` - Delete item
- `Icons.share` - Share content
- `Icons.search` - Search functionality
- `Icons.filter_list` - Filter options
- `Icons.more_vert` - More options (vertical)
- `Icons.more_horiz` - More options (horizontal)
- `Icons.refresh` - Refresh/reload
- `Icons.settings` - Settings/preferences

#### Status & Feedback
- `Icons.check` - Success/confirmation
- `Icons.check_circle` - Completed state
- `Icons.error` - Error state
- `Icons.warning` - Warning state
- `Icons.info` - Information
- `Icons.help` - Help/support
- `Icons.notification_important` - Alert notification

#### Content
- `Icons.image` - Image placeholder
- `Icons.photo_camera` - Camera/photo
- `Icons.videocam` - Video
- `Icons.attach_file` - File attachment
- `Icons.download` - Download content
- `Icons.upload` - Upload content
- `Icons.favorite` - Like/favorite
- `Icons.favorite_border` - Unlike/unfavorite

#### User & Account
- `Icons.person` - User profile
- `Icons.account_circle` - Account
- `Icons.lock` - Security/password
- `Icons.visibility` - Show/visible
- `Icons.visibility_off` - Hide/invisible
- `Icons.logout` - Sign out

#### Communication
- `Icons.mail` - Email/messages
- `Icons.phone` - Phone/call
- `Icons.chat` - Chat/messaging
- `Icons.notifications` - Notifications
- `Icons.notifications_active` - Active notifications

#### Bottom Navigation
- `Icons.home` - Home tab
- `Icons.explore` - Explore/discover tab
- `Icons.person` - Profile tab
- `Icons.extension` - Puzzles/games (specific to app)

## Icon Sizes

### Standard Sizes

**Extra Small (16px)**:
- Use for: Inline text icons, badges, small indicators
- Flutter: `size: 16`

**Small (20px)**:
- Use for: List item trailing icons, compact UI
- Flutter: `size: 20`

**Default (24px)**:
- Use for: Standard buttons, app bar actions, navigation
- Flutter: `size: 24` (default, can be omitted)

**Medium (32px)**:
- Use for: Large buttons, prominent actions
- Flutter: `size: 32`

**Large (48px)**:
- Use for: Empty states, feature highlights
- Flutter: `size: 48`

**Extra Large (64px)**:
- Use for: Onboarding, splash screens, major empty states
- Flutter: `size: 64`

### Touch Target Sizing

All interactive icons must have a **minimum 48dp × 48dp touch target** for accessibility.

```dart
// Icon button with proper touch target
IconButton(
  icon: Icon(Icons.menu, size: 24),
  padding: EdgeInsets.all(12), // Creates 48dp touch target
  onPressed: () {},
)

// Icon without touch target (decorative only)
Icon(Icons.check, size: 20)
```

## Icon Colors

### Semantic Color Mapping

**Primary Icons** (Main actions, selected states):
- Color: `#3D2664` (Primary 500)
- Token: `AppColors.primary500`
- Use: Active navigation items, primary actions, selected items

**On Primary** (Icons on primary colored backgrounds):
- Color: `#FFFFFF` (White)
- Token: `AppColors.basicWhite`
- Use: View header icons, FAB icons, primary button icons

**Subtle Icons** (Secondary information):
- Color: `#776793` (text-subtle)
- Token: `AppColors.textSubtle`
- Use: Unselected navigation, secondary actions, inactive items

**Body Icons** (Default state):
- Color: `#192038` (Basic 900)
- Token: `AppColors.basic900`
- Use: List item icons, content icons, default actions

**Disabled Icons**:
- Color: `#E4E9F2` (Basic 300)
- Token: `AppColors.basic300`
- Opacity: 38%
- Use: Disabled buttons, inactive features

**Success Icons**:
- Color: `#00E096` (Success 500)
- Token: `AppColors.success500`
- Use: Confirmation, completed tasks, positive feedback

**Danger/Error Icons**:
- Color: `#FF7070` (Danger 500)
- Token: `AppColors.danger500`
- Use: Errors, warnings, delete actions, destructive operations

**Warning Icons**:
- Color: `#FFC94D` (Warning 500)
- Token: `AppColors.warning500`
- Use: Caution states, alerts, important notices

### Flutter Implementation

```dart
// Primary icon
Icon(
  Icons.favorite,
  size: 24,
  color: AppColors.primary500,
)

// Icon with theme color
Icon(
  Icons.check,
  size: 24,
  color: Theme.of(context).colorScheme.primary,
)

// Icon button with color
IconButton(
  icon: const Icon(Icons.menu, size: 24),
  color: AppColors.basicWhite,
  onPressed: () {},
)
```

## Icon Usage Patterns

### App Bar / View Header Icons

**Left Icon** (Navigation):
- Size: 24px
- Container: 32px × 32px
- Color: White (`#FFFFFF`)
- Common: `Icons.menu`, `Icons.arrow_back`

**Right Icons** (Actions):
- Size: 24px
- Container: 32px × 32px
- Color: White (`#FFFFFF`)
- Gap: 4px between multiple icons
- Common: `Icons.search`, `Icons.more_vert`, `Icons.settings`

```dart
AppBar(
  leading: IconButton(
    icon: const Icon(Icons.menu, size: 24),
    color: Colors.white,
    onPressed: () {},
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.search, size: 24),
      color: Colors.white,
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.more_vert, size: 24),
      color: Colors.white,
      onPressed: () {},
    ),
  ],
)
```

### Bottom Navigation Icons

**Size**: 24px
**Color**: `#776793` (text-subtle) for both selected and unselected
**Label**: 10px Bold, same color as icon

```dart
BottomNavigationBarItem(
  icon: Icon(Icons.home, size: 24),
  label: 'Home',
)
```

### List Item Icons

**Leading Icon**:
- Size: 24px
- Color: Context-dependent (primary, subtle, or body)
- Alignment: Centered vertically

**Trailing Icon**:
- Size: 20px (smaller for disclosure)
- Color: `#776793` (text-subtle)
- Common: `Icons.chevron_right`

```dart
ListTile(
  leading: Icon(
    Icons.person,
    size: 24,
    color: AppColors.primary500,
  ),
  title: const Text('Profile'),
  trailing: Icon(
    Icons.chevron_right,
    size: 20,
    color: AppColors.textSubtle,
  ),
)
```

### Button Icons

**Icon + Text Buttons**:
- Icon size: 20px (small), 24px (medium/large)
- Gap: 8px between icon and text
- Alignment: Centered

**Icon-Only Buttons**:
- Icon size: 24px
- Container: 48px × 48px (touch target)
- No text label

```dart
// Icon + text button
ElevatedButton.icon(
  icon: const Icon(Icons.add, size: 20),
  label: const Text('Add Item'),
  onPressed: () {},
)

// Icon-only button
IconButton(
  icon: const Icon(Icons.add, size: 24),
  onPressed: () {},
  tooltip: 'Add Item', // For accessibility
)
```

### Floating Action Button (FAB)

**Icon Size**: 24px
**Icon Color**: White (`#FFFFFF`)
**Common Icons**: `Icons.add`, `Icons.edit`, `Icons.phone`

```dart
FloatingActionButton(
  onPressed: () {},
  backgroundColor: AppColors.success500,
  child: const Icon(
    Icons.add,
    size: 24,
    color: Colors.white,
  ),
)
```

### Empty State Icons

**Size**: 64px
**Color**: `#8F9BB3` (Basic 600)
**Opacity**: 60%
**Common**: `Icons.inbox`, `Icons.search_off`, `Icons.wifi_off`

```dart
Icon(
  Icons.inbox,
  size: 64,
  color: AppColors.basic600.withOpacity(0.6),
)
```

### Error State Icons

**Size**: 64px
**Color**: `#FF7070` (Danger 500)
**Common**: `Icons.error_outline`, `Icons.warning_amber`

```dart
Icon(
  Icons.error_outline,
  size: 64,
  color: AppColors.danger500,
)
```

## Accessibility Guidelines

### Semantic Labels

Always provide semantic labels for icon buttons:

```dart
IconButton(
  icon: const Icon(Icons.delete),
  onPressed: () {},
  tooltip: 'Delete item', // Screen reader announcement
)
```

### Decorative Icons

Icons that are purely decorative (next to text) should be hidden from screen readers:

```dart
Row(
  children: [
    Icon(
      Icons.check,
      size: 20,
      semanticLabel: '', // Empty = decorative
    ),
    const SizedBox(width: 8),
    const Text('Completed'),
  ],
)
```

### Color Contrast

Ensure icons meet WCAG AA contrast ratios:
- **Normal icons**: 3:1 contrast ratio minimum
- **Active/important icons**: 4.5:1 contrast ratio recommended

## Icon States

### Default
- Full opacity (100%)
- Color as defined by context

### Hover (web/desktop)
- Background circle: `rgba(0, 0, 0, 0.04)` or `rgba(255, 255, 255, 0.08)`
- Icon color: Same as default
- Cursor: pointer

### Pressed
- Background circle: `rgba(0, 0, 0, 0.08)` or `rgba(255, 255, 255, 0.12)`
- Icon color: Same as default
- Ripple effect

### Disabled
- Opacity: 38%
- Color: `#E4E9F2` (Basic 300)
- Cursor: not-allowed
- No interaction

### Loading
- Replace icon with circular progress indicator
- Size: Same as icon
- Color: Same as icon

```dart
IconButton(
  icon: isLoading
      ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.basicWhite,
          ),
        )
      : const Icon(Icons.refresh, size: 24),
  onPressed: isLoading ? null : () {},
)
```

## Custom Icon Guidelines

If Material Icons don't meet design needs:

### SVG Icons
- Use `flutter_svg` package
- Size: 24px default artboard
- Color: Use `ColorFilter.mode()` for tinting
- Export: SVG 1.1, flatten transforms, outline strokes

```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  'assets/icons/custom_icon.svg',
  width: 24,
  height: 24,
  colorFilter: ColorFilter.mode(
    AppColors.primary500,
    BlendMode.srcIn,
  ),
)
```

### Image Icons
- Use only if SVG not possible
- Format: PNG with transparency
- Density: Provide @1x, @2x, @3x variants
- Size: 24px @1x, 48px @2x, 72px @3x

## Performance Considerations

### Icon Caching
Material Icons are automatically cached by Flutter. Custom icons should be preloaded:

```dart
Future<void> precacheIcons(BuildContext context) async {
  await Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/icons/custom_icon.svg',
      ),
      context,
    ),
  ]);
}
```

### Icon Fonts
For large custom icon sets, consider using icon fonts:
- Lighter than SVG/PNG
- Easily scalable
- Apply colors dynamically
- Use `flutter_icon_font` package

## Common Mistakes to Avoid

1. **Wrong size**: Always specify icon size explicitly for consistency
2. **Missing touch target**: Interactive icons must have 48dp minimum tap area
3. **Poor contrast**: Check icon color against background
4. **No semantic label**: Provide tooltips for icon-only buttons
5. **Inconsistent usage**: Use same icon for same action across app
6. **Non-standard icons**: Prefer Material Icons for familiarity

## Icon Testing Checklist

- [ ] Icon displays at correct size
- [ ] Icon has proper color for context
- [ ] Interactive icon has 48dp touch target
- [ ] Icon button has tooltip/semantic label
- [ ] Icon meets contrast ratio requirements
- [ ] Icon scales properly on different screen densities
- [ ] Icon animates smoothly in state transitions
- [ ] Icon is accessible to screen readers
