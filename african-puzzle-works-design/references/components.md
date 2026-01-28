# Component Specifications

This document provides specifications and Flutter widget mappings for African Puzzle Works UI components.

## Buttons

### Primary Button (Elevated)
Filled button with primary color background, used for primary CTAs.

**Visual Characteristics:**
- Background: `Color/Fill/Primary 500` (#3D2664)
- Foreground: `Color/Fill/Basic 100` (White)
- Padding: `24px horizontal` × `16px vertical`
- Border Radius: `8px` (radius-rounded)
- Typography: `16px Semi Bold Open Sans`
- States: Default, Hover, Pressed, Disabled

**Flutter Implementation:**
```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary500,
    foregroundColor: AppColors.basicWhite,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingLarge,
      vertical: AppSpacing.spacingMedium,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
  ),
  child: const Text('LABEL'),
);
```

### Secondary Button (Outlined)
Outlined button with transparent background, used for secondary actions.

**Visual Characteristics:**
- Background: Transparent
- Border: `1px` solid `Color/Fill/Primary 500`
- Foreground: `Color/Fill/Primary 500`
- Padding: `24px horizontal` × `16px vertical`
- Border Radius: `8px`
- Typography: `16px Semi Bold Open Sans`

**Flutter Implementation:**
```dart
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary500,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingLarge,
      vertical: AppSpacing.spacingMedium,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
    side: BorderSide(
      color: AppColors.primary500,
      width: AppBorders.normal,
    ),
  ),
  child: const Text('LABEL'),
);
```

### Text Button
Minimal button with no background or border, used for tertiary actions.

**Visual Characteristics:**
- Background: Transparent
- Foreground: `Color/Fill/Primary 500`
- Padding: `16px horizontal` × `8px vertical`
- Typography: `16px Semi Bold Open Sans`

**Flutter Implementation:**
```dart
TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primary500,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
  ),
  child: const Text('LABEL'),
);
```

### Icon Buttons
Small circular or square buttons with icons, used for actions in compact spaces.

**Visual Characteristics:**
- Size: `24px × 24px` icon
- Padding: `8px all around`
- States: Default, Pressed

**Flutter Implementation:**
```dart
IconButton(
  icon: const Icon(Icons.edit),
  onPressed: () {},
  color: AppColors.primary500,
  iconSize: AppSpacing.spacingLarge,
);
```

### Segmented Button
Toggle buttons for switching between options (e.g., FEMME / HOMME).

**Visual Characteristics:**
- Background (selected): `Color/Fill/Primary 500`
- Background (unselected): Transparent
- Border: `1px` solid `Color/Fill/Primary 500`
- Foreground (selected): White
- Foreground (unselected): `Color/Fill/Primary 500`
- Border Radius: `8px`
- Typography: `16px Semi Bold Open Sans`

**Flutter Implementation:**
```dart
SegmentedButton<int>(
  segments: const [
    ButtonSegment(value: 0, label: Text('FEMME'), icon: Icon(Icons.female)),
    ButtonSegment(value: 1, label: Text('HOMME'), icon: Icon(Icons.male)),
  ],
  selected: {selectedValue},
  onSelectionChanged: (Set<int> newSelection) {},
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary500;
      }
      return Colors.transparent;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.basicWhite;
      }
      return AppColors.primary500;
    }),
  ),
);
```

## Input Fields

### Text Input
Standard text input field for form data entry.

**Visual Characteristics:**
- Background: `Color/Fill/Basic 200` (surface-input)
- Border: `1px` solid `Color/Fill/Basic 400`
- Focus Border: `2px` solid `Color/Fill/Primary 500`
- Border Radius: `8px`
- Padding: `16px horizontal` × `8px vertical`
- Typography: `16px Regular Open Sans`

**Flutter Implementation:**
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Label',
    hintText: 'Placeholder',
    filled: true,
    fillColor: AppColors.surfaceInput,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.basic400,
        width: AppBorders.normal,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.primary500,
        width: AppBorders.thick,
      ),
    ),
  ),
);
```

## Cards

### Standard Card
Container for grouped content with elevation.

**Visual Characteristics:**
- Background: `Color/Fill/Basic 100` (surface-card)
- Elevation: `2dp`
- Border Radius: `8px`
- Padding: `16px all around`

**Flutter Implementation:**
```dart
Card(
  color: AppColors.surfaceCard,
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
  ),
  child: Padding(
    padding: const EdgeInsets.all(AppSpacing.spacingMedium),
    child: Column(
      children: [
        // Card content
      ],
    ),
  ),
);
```

## Navigation

### App Bar
Top navigation bar with title and actions.

**Visual Characteristics:**
- Background: `Color/Fill/Primary 500`
- Foreground: White
- Height: `56dp` (default)
- Elevation: `0` (flat design)
- Title: Centered
- Typography: `20px Semi Bold Open Sans`
- Icons: `24px` white

**Flutter Implementation:**
```dart
AppBar(
  backgroundColor: AppColors.primary500,
  foregroundColor: AppColors.basicWhite,
  centerTitle: true,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
  ),
  title: const Text('Title'),
  actions: [
    IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
);
```

### Bottom Navigation Bar (Bottom App Bar)

Primary navigation bar fixed at the bottom of the screen for navigating between main app sections.

**Visual Characteristics:**
- Background: White (`AppColors.basic100`)
- Top Border: `1px solid` light gray (`AppColors.basic400`)
- Shadow: `0px 2px 12px rgba(0,0,0,0.25)` (top shadow)
- Height: `56px`
- Item Layout: Horizontal row with even spacing
- Gap Between Items: `24px`

**Navigation Items:**
- Item Width: Minimum `72px`
- Icon Size: `24px × 24px` (primary icon) or `19.2px × 19.2px` (secondary size)
- Icon Color: `#776793` (text-subtle, purple-gray)
- Label Typography: `10px Bold Open Sans`, line-height 16px
- Label Color: `#776793` (text-subtle)
- Selected State: Icon and label remain same color (subtle highlight)
- Item Padding: `8px` top, `2px` bottom
- Icon-to-Label Spacing: `2px`

**Standard Navigation Items for African Puzzle Works:**

1. **Album** (Puzzles/Content)
   - Icon: Book/Album icon
   - Label: "Album"
   - Route: Main puzzle browsing/library

2. **Rendez-vous** (Appointments/Schedule)
   - Icon: Clock/Alarm icon
   - Label: "Rendez-vous"
   - Route: Schedule or appointments

3. **Programmes** (Programs/Projects)
   - Icon: Layers/Stack icon
   - Label: "Programmes"
   - Route: Programs or projects section

4. **Contacts**
   - Icon: People/Users icon
   - Label: "Contacts"
   - Route: Contacts list

**Flutter Implementation:**

**Basic Implementation:**
```dart
Scaffold(
  body: _pages[_currentIndex],
  bottomNavigationBar: Container(
    decoration: BoxDecoration(
      color: AppColors.basicWhite,
      border: Border(
        top: BorderSide(
          color: AppColors.basic400,
          width: 1,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 12,
          offset: const Offset(0, -2), // Negative Y for top shadow
        ),
      ],
    ),
    child: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: const Color(0xFF776793),
      unselectedItemColor: const Color(0xFF776793),
      selectedLabelStyle: TextStyle(
        fontFamily: AppTypography.fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1.6,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: AppTypography.fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1.6,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book, size: 24),
          label: 'Album',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm, size: 24),
          label: 'Rendez-vous',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers, size: 24),
          label: 'Programmes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people, size: 24),
          label: 'Contacts',
        ),
      ],
    ),
  ),
);
```

**Custom Implementation (Design-Accurate):**

For more precise control over styling:

```dart
class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.basicWhite,
        border: Border(
          top: BorderSide(
            color: AppColors.basic400,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Icons.menu_book,
            label: 'Album',
            index: 0,
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.access_alarm,
            label: 'Rendez-vous',
            index: 1,
            isSelected: currentIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.layers,
            label: 'Programmes',
            index: 2,
            isSelected: currentIndex == 2,
          ),
          _buildNavItem(
            icon: Icons.people,
            label: 'Contacts',
            index: 3,
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    const itemColor = Color(0xFF776793); // text-subtle

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          height: 56,
          padding: const EdgeInsets.only(top: 8, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: itemColor,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: itemColor,
                  height: 1.6,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage:
Scaffold(
  body: _pages[_currentIndex],
  bottomNavigationBar: CustomBottomAppBar(
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() => _currentIndex = index);
    },
  ),
);
```

**Stateful Navigation Example:**

```dart
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AlbumPage(),
    const RendezVousPage(),
    const ProgrammesPage(),
    const ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
```

**Bottom App Bar with Badge (Notifications):**

```dart
Widget _buildNavItemWithBadge({
  required IconData icon,
  required String label,
  required int index,
  required bool isSelected,
  int? badgeCount,
}) {
  const itemColor = Color(0xFF776793);

  return Expanded(
    child: InkWell(
      onTap: () => onTap(index),
      child: Container(
        height: 56,
        padding: const EdgeInsets.only(top: 8, bottom: 2),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: itemColor),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: itemColor,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            if (badgeCount != null && badgeCount > 0)
              Positioned(
                top: 0,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.danger500,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    badgeCount > 9 ? '9+' : badgeCount.toString(),
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.basicWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
```

### Bottom App Bar Guidelines

**Layout Specifications:**
- **Number of Items**: Exactly 4 items (Album, Rendez-vous, Programmes, Contacts)
- **Item Distribution**: Even spacing with `MainAxisAlignment.spaceEvenly`
- **Min Touch Target**: Each item should be at least 48dp × 48dp (already met with 72px × 56px)
- **Shadow Direction**: Top shadow (negative Y offset) to elevate above content

**Typography:**
- **Font**: Open Sans Bold
- **Size**: 10px
- **Line Height**: 16px (1.6 ratio)
- **Color**: #776793 (consistent for both selected and unselected)

**Color Specifications:**
- **Background**: `AppColors.basicWhite` (#FFFFFF)
- **Border**: `AppColors.basic400` (#E4E9F2)
- **Icons**: #776793 (text-subtle)
- **Labels**: #776793 (text-subtle)
- **Shadow**: rgba(0, 0, 0, 0.25) with 12px blur

**States:**
- **Default**: Purple-gray icons and labels
- **Selected**: No visual change (uses same color)
- **Pressed**: Ink ripple effect
- **Note**: This design uses subtle selection without color change for a unified look

**Best Practices:**
1. **Fixed Position**: Always anchor to bottom of screen
2. **Persistent**: Show on all main screens, hide on detail views
3. **IndexedStack**: Use `IndexedStack` to preserve page state when switching
4. **Safe Area**: Respect bottom safe area on devices with notches
5. **Navigation Logic**: Handle back button to return to first tab
6. **Badge Counts**: Show notification badges for pending items
7. **Accessibility**: Ensure labels are readable and icons are recognizable

**Alternative Implementations:**

For multilingual support with longer labels:

```dart
Widget _buildNavItem({
  required IconData icon,
  required String label,
  required int index,
  required bool isSelected,
}) {
  return Expanded(
    child: InkWell(
      onTap: () => onTap(index),
      child: Container(
        height: 56,
        padding: const EdgeInsets.only(top: 8, bottom: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: const Color(0xFF776793)),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF776793),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
```

### View Header (Page Header)

Consistent header component used across all views in the app, combining status bar, navigation UI, and optional sub-headers for view-specific content.

**Common Pattern:**

Every view header consists of two main parts:
1. **Header UI**: Status bar + Navigation bar (64px total height)
2. **Sub-Header** (Optional): View-specific content (variable height)

**Visual Characteristics:**

**Status Bar** (24px height):
- Background: Transparent with purple gradient overlay
- Content: Time, Wi-Fi, signal, battery icons
- Text Color: White
- Typography: Roboto Regular 13px

**Header Navigation UI** (32px height):
- Background: Purple gradient (`Color/Gradient/Background Mask/Dark`)
- Padding: 8px horizontal, 8px vertical
- Left Icon: 32px × 32px (menu or back arrow)
- Title: Centered, 22px Bold Open Sans, white with text shadow
- Text Shadow: `0px 2px 3px rgba(0,0,0,0.5)`
- Right Icon: 24px × 24px (help, more, lock, etc.)
- Icon Spacing: 4px gap between elements

**Total Header Height:**
- Basic (no sub-header): 64px (24px status + 32px nav + 8px bottom padding)
- With sub-header: 64px + sub-header height

---

#### View Header Variants

**1. Default Header**

Basic header with menu icon, centered title, and optional right action.

```dart
class DefaultViewHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onActionPressed;
  final IconData? actionIcon;

  const DefaultViewHeader({
    Key? key,
    required this.title,
    this.onMenuPressed,
    this.onActionPressed,
    this.actionIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3D2664), // Primary 500
            Color(0xFF2A1B47), // Darker shade
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacingSmall,
            vertical: AppSpacing.spacingSmall,
          ),
          child: Row(
            children: [
              // Left Icon (Menu)
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                child: IconButton(
                  icon: const Icon(Icons.menu, size: 24),
                  color: AppColors.basicWhite,
                  padding: EdgeInsets.zero,
                  onPressed: onMenuPressed,
                ),
              ),
              const SizedBox(width: AppSpacing.spacingXs),
              // Centered Title
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.basicWhite,
                    height: 32 / 22,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpacing.spacingXs),
              // Right Icon (Action)
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                child: actionIcon != null
                    ? IconButton(
                        icon: Icon(actionIcon, size: 24),
                        color: AppColors.basicWhite,
                        padding: EdgeInsets.zero,
                        onPressed: onActionPressed,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage:
DefaultViewHeader(
  title: 'Title',
  onMenuPressed: () => _openDrawer(),
  onActionPressed: () => _showHelp(),
  actionIcon: Icons.help_outline,
)
```

---

**2. Project Header (with Price Meter and RDV Button)**

Header with sub-header containing a price counter and appointment button.

```dart
class ProjectViewHeader extends StatelessWidget {
  final String title;
  final int priceValue;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onMorePressed;
  final VoidCallback? onRdvPressed;

  const ProjectViewHeader({
    Key? key,
    required this.title,
    this.priceValue = 0,
    this.onMenuPressed,
    this.onMorePressed,
    this.onRdvPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header UI
        DefaultViewHeader(
          title: title,
          onMenuPressed: onMenuPressed,
          onActionPressed: onMorePressed,
          actionIcon: Icons.more_vert,
        ),
        // Sub-header with Price and RDV
        Container(
          color: AppColors.basicWhite,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacingMedium,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price Meter
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary500,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.attach_money, size: 24, color: AppColors.primary500),
                    const SizedBox(width: AppSpacing.spacingSmall),
                    Text(
                      priceValue.toString(),
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary500,
                        height: 20 / 15,
                      ),
                    ),
                  ],
                ),
              ),
              // RDV Button
              ElevatedButton.icon(
                onPressed: onRdvPressed,
                icon: const Icon(Icons.access_alarm, size: 24),
                label: const Text('RDV'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.basic100.withOpacity(0.04),
                  foregroundColor: AppColors.primary500,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.spacingMedium,
                    vertical: AppSpacing.spacingSmall,
                  ),
                  side: BorderSide(color: AppColors.primary500, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
                  ),
                  textStyle: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 24 / 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

---

**3. Calendar List Header**

Header with integrated calendar grid for date selection.

```dart
class CalendarViewHeader extends StatelessWidget {
  final String title;
  final DateTime currentMonth;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  const CalendarViewHeader({
    Key? key,
    required this.title,
    required this.currentMonth,
    this.selectedDate,
    this.onDateSelected,
    this.onPreviousMonth,
    this.onNextMonth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header UI
        DefaultViewHeader(
          title: title,
          actionIcon: Icons.more_vert,
        ),
        // Calendar Sub-header
        Container(
          color: AppColors.basicWhite,
          child: Column(
            children: [
              // Month Navigation
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacingSmall,
                  vertical: AppSpacing.spacingMedium,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, size: 24),
                      onPressed: onPreviousMonth,
                      color: AppColors.primary500,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_getMonthName(currentMonth.month)} ${currentMonth.year}',
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary500.withOpacity(0.7),
                              height: 24 / 18,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.chevron_down, size: 24, color: AppColors.primary500),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right, size: 24),
                      onPressed: onNextMonth,
                      color: AppColors.primary500,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Calendar Grid
              Padding(
                padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                child: _buildCalendarGrid(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    // Calendar grid implementation
    // Shows day names and date numbers in 7-column grid
    return Column(
      children: [
        // Day names row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam']
              .map((day) => SizedBox(
                    width: 42,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary500,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 4),
        // Date grid (simplified - implement full calendar logic)
        SizedBox(
          height: 200,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: 35,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = selectedDate?.day == day;

              return GestureDetector(
                onTap: () {
                  if (onDateSelected != null) {
                    onDateSelected!(DateTime(currentMonth.year, currentMonth.month, day));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary500 : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? AppColors.basicWhite : AppColors.primary500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
                    'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];
    return months[month - 1].toUpperCase();
  }
}
```

---

**4. Search Header**

Header with integrated search bar.

```dart
class SearchViewHeader extends StatelessWidget {
  final String title;
  final String searchHint;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onMenuPressed;

  const SearchViewHeader({
    Key? key,
    required this.title,
    this.searchHint = 'Search...',
    this.searchController,
    this.onSearchChanged,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header UI
        DefaultViewHeader(
          title: title,
          onMenuPressed: onMenuPressed,
          actionIcon: Icons.help_outline,
        ),
        // Search Sub-header
        Container(
          height: 64,
          color: AppColors.basicWhite,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacingSmall,
            vertical: 12,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC), // Basic 200
              border: Border.all(
                color: const Color(0xFF8F9BB3), // Basic 600
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: onSearchChanged,
                    decoration: InputDecoration(
                      hintText: searchHint,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacingMedium,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.search,
                    size: 24,
                    color: AppColors.basic600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```

---

**5. Tabbed List Header**

Header with tab navigation for filtering or categorizing content.

```dart
class TabbedListViewHeader extends StatelessWidget {
  final String title;
  final List<TabItem> tabs;
  final int selectedTabIndex;
  final Function(int)? onTabSelected;

  const TabbedListViewHeader({
    Key? key,
    required this.title,
    required this.tabs,
    this.selectedTabIndex = 0,
    this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header UI
        DefaultViewHeader(
          title: title,
          actionIcon: Icons.help_outline,
        ),
        // Tab Bar Sub-header
        Container(
          color: AppColors.basicWhite,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final tab = tabs[index];
              final isSelected = index == selectedTabIndex;

              return Expanded(
                child: InkWell(
                  onTap: () => onTabSelected?.call(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(tab.icon, size: 24, color: const Color(0xFF776793)),
                        const SizedBox(width: 4),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w300, // Light
                            color: const Color(0xFF776793), // text-subtle
                          ),
                        ),
                        if (tab.badgeCount != null && tab.badgeCount! > 0)
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.danger500,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              tab.badgeCount.toString(),
                              style: TextStyle(
                                fontFamily: AppTypography.fontFamily,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.basicWhite,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class TabItem {
  final IconData icon;
  final String label;
  final int? badgeCount;

  const TabItem({
    required this.icon,
    required this.label,
    this.badgeCount,
  });
}
```

---

**6. Album Header (with Avatar and Name)**

Header for album/portfolio views with centered avatar and name.

```dart
class AlbumViewHeader extends StatelessWidget {
  final String albumName;
  final ImageProvider? avatarImage;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLockPressed;

  const AlbumViewHeader({
    Key? key,
    required this.albumName,
    this.avatarImage,
    this.onMenuPressed,
    this.onLockPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Stack(
        children: [
          Column(
            children: [
              // Header UI (104px)
              Container(
                height: 104,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3D2664),
                      Color(0xFF2A1B47),
                    ],
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            // Menu Icon
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: const Icon(Icons.menu, size: 24),
                                color: AppColors.basicWhite,
                                padding: EdgeInsets.zero,
                                onPressed: onMenuPressed,
                              ),
                            ),
                            const Spacer(),
                            // Lock Icon
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: const Icon(Icons.lock, size: 24),
                                color: AppColors.basicWhite,
                                padding: EdgeInsets.zero,
                                onPressed: onLockPressed,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Name Section (64px)
              Container(
                height: 64,
                color: AppColors.basicWhite,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  albumName,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary500,
                    height: 32 / 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // Avatar (overlapping)
          Positioned(
            top: 72,
            left: 148,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.basicWhite, width: 2),
                image: avatarImage != null
                    ? DecorationImage(
                        image: avatarImage!,
                        fit: BoxFit.cover,
                      )
                    : null,
                color: avatarImage == null ? AppColors.basic400 : null,
              ),
              child: avatarImage == null
                  ? Icon(Icons.person, size: 32, color: AppColors.basicWhite)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

**7. Contact/Client Header (with Avatar and Phone)**

Header for contact detail views with large avatar and contact button.

```dart
class ContactViewHeader extends StatelessWidget {
  final String contactName;
  final String phoneNumber;
  final ImageProvider? avatarImage;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMorePressed;
  final VoidCallback? onPhonePressed;

  const ContactViewHeader({
    Key? key,
    required this.contactName,
    required this.phoneNumber,
    this.avatarImage,
    this.onBackPressed,
    this.onMorePressed,
    this.onPhonePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.basicWhite,
      child: Column(
        children: [
          // Header UI
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3D2664),
                  Color(0xFF2A1B47),
                ],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    // Back Arrow
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, size: 24),
                        color: AppColors.basicWhite,
                        padding: EdgeInsets.zero,
                        onPressed: onBackPressed,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Contact Name
                    Expanded(
                      child: Text(
                        contactName,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.basicWhite,
                          height: 32 / 22,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 2),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // More Icon
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: const Icon(Icons.more_vert, size: 24),
                        color: AppColors.basicWhite,
                        padding: EdgeInsets.zero,
                        onPressed: onMorePressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Avatar
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: avatarImage != null
                  ? DecorationImage(
                      image: avatarImage!,
                      fit: BoxFit.cover,
                    )
                  : null,
              color: avatarImage == null ? AppColors.basic400 : null,
            ),
            child: avatarImage == null
                ? Icon(Icons.person, size: 44, color: AppColors.basicWhite)
                : null,
          ),
          const SizedBox(height: 16),
          // Phone Button
          ElevatedButton(
            onPressed: onPhonePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.basic100.withOpacity(0.04),
              foregroundColor: AppColors.primary500,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spacingMedium,
                vertical: AppSpacing.spacingSmall,
              ),
              side: BorderSide(color: AppColors.primary500, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  phoneNumber,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 24 / 18,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.phone, size: 24),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
```

---

### View Header Guidelines

**Layout Specifications:**
- **Status Bar**: Always 24px height, transparent background
- **Navigation UI**: 32px height with 8px padding
- **Icon Sizes**: Left icon 32px, right icon 24px, menu items 24px
- **Title**: Centered, max width with ellipsis overflow
- **Shadow**: Text shadow on title for readability (0px 2px 3px rgba(0,0,0,0.5))

**Color Specifications:**
- **Background Gradient**: Deep purple gradient from Primary 500 to darker
- **Text Color**: White with shadow for all header text
- **Icon Color**: White for all header icons
- **Sub-header Background**: White (`AppColors.basicWhite`)

**Typography:**
- **Title**: 22px Bold Open Sans, line-height 32px
- **Sub-header Labels**: 16px Light Open Sans or as specified per variant
- **Status Bar**: 13px Roboto Regular

**States:**
- **Scrolling**: Some headers may hide on scroll (configurable)
- **Collapsed**: Calendar and tabs can collapse to basic header
- **Expanded**: Default state showing full sub-header content

**Best Practices:**
1. **Consistency**: Use appropriate variant for each screen type
2. **Gradients**: Always use purple gradient for header background
3. **Safe Area**: Respect top safe area for notches and status bars
4. **Icon Clarity**: Use recognizable icons for all actions
5. **Title Length**: Keep titles concise, allow ellipsis for long text
6. **Sub-header Shadows**: Add elevation shadow to sub-headers (0px 2px 12px rgba(0,0,0,0.25))
7. **Accessibility**: Ensure all interactive elements have minimum 48dp touch targets

**Common Patterns:**
- **Menu Icon**: Standard hamburger menu for navigation drawer
- **Back Arrow**: Use for detail/sub-pages
- **More Icon**: Three-dot vertical menu for contextual actions
- **Help Icon**: Question mark for help/info
- **Lock Icon**: For privacy or restricted content

## Floating Action Button (FAB)

Primary action button that floats above content.

**Visual Characteristics:**
- Background: `Color/Fill/Success 500` (#00E096 - Green)
- Foreground: White
- Size: `56dp × 56dp`
- Elevation: `4dp`
- Shape: Circle
- Icon: `24px` white

**Flutter Implementation:**
```dart
FloatingActionButton(
  onPressed: () {},
  backgroundColor: AppColors.success500,
  foregroundColor: AppColors.basicWhite,
  child: const Icon(Icons.add),
);
```

## Badges and Chips

### Badge
Small status indicator, often used with icons.

**Visual Characteristics:**
- Background: Varies by type (Success, Warning, Danger, Info)
- Size: `8px × 8px` (dot) or auto-width with padding
- Border Radius: `full` (pill shape)
- Typography: `10px Bold Open Sans`

**Flutter Implementation:**
```dart
Badge(
  label: const Text('0'),
  backgroundColor: AppColors.danger500,
  textColor: AppColors.basicWhite,
  child: const Icon(Icons.notifications),
);
```

## Dialogs and Modals

### Modal Dialog
Overlay dialog for focused user interaction.

**Visual Characteristics:**
- Background: `Color/Fill/Basic 100` (surface-modal)
- Border Radius: `8px`
- Padding: `24px all around`
- Max Width: `280dp`
- Elevation: `24dp`

**Flutter Implementation:**
```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    backgroundColor: AppColors.surfaceModal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
    title: const Text('Title'),
    content: const Text('Dialog content'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('CANCEL'),
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('OK'),
      ),
    ],
  ),
);
```

## List Items

### Standard List Tile
List item with icon, text, and optional trailing widget.

**Visual Characteristics:**
- Height: `56dp` minimum
- Padding: `16px horizontal`
- Leading Icon: `24px`
- Title Typography: `16px Regular Open Sans`
- Subtitle Typography: `12px Regular Open Sans`
- Trailing: Icon or text

**Flutter Implementation:**
```dart
ListTile(
  leading: const Icon(Icons.person),
  title: const Text('Title'),
  subtitle: const Text('Subtitle'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {},
);
```

## Bottom Sheets

Bottom sheets are modal surfaces that slide up from the bottom of the screen, used for actions, selections, and contextual information.

### Action Bottom Sheet

Modal with a grid of action items, each with an icon and label.

**Visual Characteristics:**
- Background: White with rounded top corners
- Border Radius: `8px` top corners only
- Items: Grid layout (3-4 columns)
- Item Size: `80px × 80px` icon area
- Item Label: `22px Bold Open Sans`, Primary color
- Item Spacing: `8px` horizontal gap
- Padding: `16px` all around
- Close Handle: Optional drag indicator at top

**Common Actions:**
- Photo, Contacts, Text, Audio
- Avatar, Name, Cover
- File, Video, Gallery

**Flutter Implementation:**
```dart
void showActionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.radiusRounded),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Optional drag handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: AppSpacing.spacingMedium),
            decoration: BoxDecoration(
              color: AppColors.basic400,
              borderRadius: BorderRadius.circular(AppRadius.radiusFull),
            ),
          ),
          // Action grid
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: AppSpacing.spacingSmall,
            crossAxisSpacing: AppSpacing.spacingSmall,
            children: [
              _buildActionItem(Icons.camera_alt, 'Photo'),
              _buildActionItem(Icons.contacts, 'Contacts'),
              _buildActionItem(Icons.text_fields, 'Text'),
              _buildActionItem(Icons.mic, 'Audio'),
              _buildActionItem(Icons.person, 'Avatar'),
              _buildActionItem(Icons.image, 'Cover'),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionItem(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.basic200,
          borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
        ),
        child: Icon(
          icon,
          size: 40,
          color: AppColors.primary500,
        ),
      ),
      const SizedBox(height: AppSpacing.spacingXs),
      Text(
        label,
        style: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.basic900,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
```

### Selection Bottom Sheet

Bottom sheet with radio button or checkbox options for user selection.

**Visual Characteristics:**
- Background: White
- Title: `20px Bold Open Sans`, centered or left-aligned
- Options: List of items with radio buttons or checkboxes
- Item Height: `56dp` minimum
- Padding: `16px` horizontal, `8px` between items
- Close Button: X icon in top-right corner

**Example Use Cases:**
- Notification settings (Due day, 1 day before, 3 days before, 1 week before)
- Time selections
- Filter options

**Flutter Implementation:**
```dart
void showSelectionBottomSheet(BuildContext context) {
  String selectedOption = 'due_day';

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.radiusRounded),
      ),
    ),
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.all(AppSpacing.spacingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show Notification:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spacingSmall),
            // Radio options
            RadioListTile<String>(
              title: const Text('Due day'),
              value: 'due_day',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() => selectedOption = value!);
              },
              activeColor: AppColors.primary500,
            ),
            RadioListTile<String>(
              title: const Text('1 day before'),
              value: '1_day',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() => selectedOption = value!);
              },
              activeColor: AppColors.primary500,
            ),
            RadioListTile<String>(
              title: const Text('3 days before'),
              value: '3_days',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() => selectedOption = value!);
              },
              activeColor: AppColors.primary500,
            ),
            RadioListTile<String>(
              title: const Text('1 week before'),
              value: '1_week',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() => selectedOption = value!);
              },
              activeColor: AppColors.primary500,
            ),
          ],
        ),
      ),
    ),
  );
}
```

### Calendar Bottom Sheet

Bottom sheet with a date picker calendar widget.

**Visual Characteristics:**
- Background: White
- Header: Month/Year selector with navigation arrows
- Calendar Grid: 7 columns (days of week)
- Day Cell Size: `42px × 42px`
- Selected Date: Primary purple background with white text
- Today Indicator: Small dot or badge
- Border Radius: `8px` top corners
- Padding: `16px` all around

**Additional Elements:**
- Day/Night/Period selector below calendar
- Toggle for reminder on/off
- Bell icon for notification settings

**Flutter Implementation:**
```dart
void showCalendarBottomSheet(BuildContext context) {
  DateTime selectedDate = DateTime.now();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.radiusRounded),
      ),
    ),
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.all(AppSpacing.spacingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48),
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spacingSmall),
            // Calendar widget
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              onDateChanged: (date) {
                setState(() => selectedDate = date);
              },
            ),
            const Divider(),
            // Time period selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPeriodButton(context, 'Matin', '00:00 - 12:00'),
                _buildPeriodButton(context, 'Après-midi', '12:00 - 18:00'),
                _buildPeriodButton(context, 'Soir', '18:00 - 00:00'),
              ],
            ),
            const SizedBox(height: AppSpacing.spacingSmall),
            // Reminder toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: AppColors.primary500,
                    ),
                    const SizedBox(width: AppSpacing.spacingSmall),
                    const Text('Reminder: On'),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_off_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPeriodButton(BuildContext context, String label, String time) {
  return Column(
    children: [
      Icon(
        label == 'Matin' ? Icons.wb_sunny :
        label == 'Après-midi' ? Icons.wb_twilight :
        Icons.nightlight_round,
        color: AppColors.primary500,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      Text(
        time,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.basic600,
        ),
      ),
    ],
  );
}
```

### Price Display Bottom Sheet

Small bottom sheet showing price or cost information.

**Visual Characteristics:**
- Background: White
- Border Radius: `8px` top corners
- Content: Icon + Price value
- Icon: Coin or currency icon
- Price: Large text (`32px Bold Open Sans`)
- Label: "PRIX" or currency label above price
- Padding: `24px` all around
- Close Button: X icon in top-left corner

**Flutter Implementation:**
```dart
void showPriceBottomSheet(BuildContext context, int price) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.radiusRounded),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(AppSpacing.spacingLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: AppSpacing.spacingMedium),
          // Price label
          Text(
            'PRIX',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.basic600,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: AppSpacing.spacingSmall),
          // Coin icon and price
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/coin.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: AppSpacing.spacingSmall),
              Text(
                price.toString(),
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
```

### Bottom Sheet Design Guidelines

**General Specifications:**
- **Background**: White (`AppColors.basic100`)
- **Border Radius**: `8px` on top corners only
- **Elevation**: `16dp` shadow
- **Max Height**: 80% of screen height
- **Padding**: `16px` standard, `24px` for larger sheets
- **Drag Handle**: Optional 4px height, 40px width bar in light gray

**Interaction Patterns:**
- Swipe down to dismiss
- Tap outside to dismiss (optional)
- Close button (X) for explicit dismissal
- Backdrop with semi-transparent overlay

**Item Sizing:**
- **Action Items**: `80px × 80px` icon area + label
- **List Items**: `56dp` minimum height
- **Calendar Cells**: `42px × 42px`
- **Touch Targets**: Minimum `48dp × 48dp`

**Spacing:**
- Between items: `8px`
- Section padding: `16px`
- Top padding (after handle): `8-16px`

## Snackbars

Snackbars are brief messages that appear at the bottom of the screen to provide feedback about an operation. They automatically dismiss after a timeout or when tapped by the user.

### Snackbar Variants

African Puzzle Works uses three snackbar types for different feedback scenarios.

#### 1. Confirmation Snackbar

Success feedback for completed actions.

**Visual Characteristics:**
- Background: `Color/Fill/Primary 500` (#3D2664) - Purple
- Text Color: White
- Icon: White checkmark circle (24px)
- Border Radius: `4px`
- Shadow: `0px 2px 12px rgba(0,0,0,0.25)`
- Width: `344px`
- Min Height: `56px`
- Padding: `16px horizontal`, `8px vertical`
- Gap: `24px` between icon and text
- Typography: `16px Light Open Sans`, line-height 24px

#### 2. Warning Snackbar

Error or warning feedback.

**Visual Characteristics:**
- Background: `Color/Fill/Danger 100` (#FFE8E8) - Light pink
- Border: `1px solid Color/Fill/Danger 700` (#760000) - Dark red
- Text Color: `Color/Fill/Danger 700` (#760000)
- Icon: Red checkmark circle (24px)
- Other specs same as Confirmation

#### 3. Information Snackbar

Informational or neutral feedback.

**Visual Characteristics:**
- Background: Light purple/gray (#E2DFE8)
- Border: `1px solid Color/Fill/Primary 500` (#3D2664)
- Text Color: `Color/Fill/Primary 500` (#3D2664)
- Icon: Purple checkmark circle (24px)
- Other specs same as Confirmation

### Animation Pattern

**Entry Animation:**
- Direction: Slides up from bottom of screen
- Duration: `200ms`
- Curve: Ease in-out
- Starting position: Below screen edge
- Ending position: `16px` from bottom edge

**Exit Animation:**
- Direction: Slides down to bottom
- Duration: `200ms`
- Curve: Ease in-out

**Display Duration:**
- Auto-dismiss after `3000ms` (3 seconds)
- OR dismiss immediately when user taps the snackbar
- Dismiss when user navigates away from screen

### Flutter Implementation

**Basic Snackbar (Confirmation):**
```dart
void showConfirmationSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.basicWhite,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.spacingLarge),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.paragraphMed,
              fontWeight: FontWeight.w300,
              color: AppColors.basicWhite,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.primary500,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(AppSpacing.spacingMedium),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
    ),
    duration: const Duration(milliseconds: 3000),
    dismissDirection: DismissDirection.down,
    // Animation configuration
    animation: CurvedAnimation(
      parent: const AlwaysStoppedAnimation(1.0),
      curve: Curves.easeInOut,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Usage
showConfirmationSnackbar(context, 'Change saved.');
```

**Warning Snackbar:**
```dart
void showWarningSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.error_outline,
          color: AppColors.danger700,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.spacingLarge),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.paragraphMed,
              fontWeight: FontWeight.w300,
              color: AppColors.danger700,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.danger100,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(AppSpacing.spacingMedium),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
      side: BorderSide(
        color: AppColors.danger700,
        width: AppBorders.normal,
      ),
    ),
    duration: const Duration(milliseconds: 3000),
    dismissDirection: DismissDirection.down,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
```

**Information Snackbar:**
```dart
void showInfoSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.info_outline,
          color: AppColors.primary500,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.spacingLarge),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.paragraphMed,
              fontWeight: FontWeight.w300,
              color: AppColors.primary500,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: const Color(0xFFE2DFE8),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(AppSpacing.spacingMedium),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
      side: BorderSide(
        color: AppColors.primary500,
        width: AppBorders.normal,
      ),
    ),
    duration: const Duration(milliseconds: 3000),
    dismissDirection: DismissDirection.down,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
```

**Snackbar with Action Button:**
```dart
void showSnackbarWithAction(BuildContext context) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.basicWhite,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.spacingLarge),
        const Expanded(
          child: Text('Change saved.'),
        ),
      ],
    ),
    backgroundColor: AppColors.primary500,
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'UNDO',
      textColor: AppColors.basicWhite,
      onPressed: () {
        // Handle action
      },
    ),
    duration: const Duration(milliseconds: 3000),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
```

**Custom Animated Snackbar Helper:**
```dart
class AppSnackbar {
  static const Duration _animationDuration = Duration(milliseconds: 200);
  static const Duration _displayDuration = Duration(milliseconds: 3000);
  static const Curve _animationCurve = Curves.easeInOut;

  static void showConfirmation(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _buildSnackbarContent(
          icon: Icons.check_circle,
          iconColor: AppColors.basicWhite,
          message: message,
          textColor: AppColors.basicWhite,
        ),
        backgroundColor: AppColors.primary500,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.spacingMedium),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacingMedium,
          vertical: AppSpacing.spacingSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
        ),
        duration: _displayDuration,
        dismissDirection: DismissDirection.down,
      ),
    );
  }

  static void showWarning(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _buildSnackbarContent(
          icon: Icons.error_outline,
          iconColor: AppColors.danger700,
          message: message,
          textColor: AppColors.danger700,
        ),
        backgroundColor: AppColors.danger100,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.spacingMedium),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacingMedium,
          vertical: AppSpacing.spacingSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
          side: BorderSide(
            color: AppColors.danger700,
            width: AppBorders.normal,
          ),
        ),
        duration: _displayDuration,
        dismissDirection: DismissDirection.down,
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _buildSnackbarContent(
          icon: Icons.info_outline,
          iconColor: AppColors.primary500,
          message: message,
          textColor: AppColors.primary500,
        ),
        backgroundColor: const Color(0xFFE2DFE8),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.spacingMedium),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacingMedium,
          vertical: AppSpacing.spacingSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
          side: BorderSide(
            color: AppColors.primary500,
            width: AppBorders.normal,
          ),
        ),
        duration: _displayDuration,
        dismissDirection: DismissDirection.down,
      ),
    );
  }

  static Widget _buildSnackbarContent({
    required IconData icon,
    required Color iconColor,
    required String message,
    required Color textColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.spacingLarge),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: AppTypography.paragraphMed,
              fontWeight: FontWeight.w300,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}

// Usage:
AppSnackbar.showConfirmation(context, 'Client mis à jour.');
AppSnackbar.showWarning(context, 'Une erreur s\'est produite.');
AppSnackbar.showInfo(context, 'Information importante.');
```

### Snackbar Usage Guidelines

**When to Use:**
- Confirmation: After successful actions (save, update, delete)
- Warning: After errors or failed operations
- Information: For neutral notifications or tips

**Best Practices:**
1. **Keep messages brief**: 1-2 short sentences maximum
2. **Use action verbs**: "Saved", "Updated", "Deleted" not "Save complete"
3. **Avoid interrupting**: Don't use for critical information that requires action
4. **One at a time**: Don't queue multiple snackbars
5. **Tap to dismiss**: Always allow users to dismiss by tapping
6. **Auto-dismiss**: Use 3-second timeout for non-critical messages

**Common Messages:**
- Confirmation: "Change saved.", "Client mis à jour.", "Profile updated."
- Warning: "Connection failed.", "Unable to save changes."
- Information: "Processing...", "Syncing data."

### Animation Specifications Summary

| Property | Value |
|----------|-------|
| Entry Duration | 200ms |
| Exit Duration | 200ms |
| Animation Curve | Ease in-out |
| Display Duration | 3000ms (3 seconds) |
| Position | 16px from bottom edge |
| Dismiss Methods | Auto (3s), User tap, Navigation |
| Direction | Vertical (bottom to top) |

## Context Menu (Long-Press Menu)

Context menus appear when users long-press on content items, providing quick access to common actions. These menus are displayed as a horizontal row of icon + label items.

### Visual Characteristics

**Menu Container:**
- Background: White (`AppColors.basic100`)
- Border Radius: `4px`
- Shadow: `0px 2px 12px rgba(0,0,0,0.25)`
- Width: `345px` (adjustable based on number of items)
- Padding: `16px` horizontal
- Layout: Horizontal row with even spacing

**Menu Items:**
- Height: `56px`
- Icon Size: `24px × 24px`
- Icon-to-Label Spacing: `4px`
- Label Typography: `10px Bold Open Sans`, line-height 16px
- Label Color: `#776793` (text-subtle) - except Delete which is red
- Item Alignment: Centered vertically

### Standard Menu Actions

#### 1. Group
- **Icon**: Folder with add symbol
- **Label**: "Group" / "Grouper"
- **Color**: Dark purple/gray
- **Use**: Group multiple items together

#### 2. Price
- **Icon**: Coins/money symbol (gold/orange color)
- **Label**: "Price" / "Prix"
- **Color**: Dark purple/gray
- **Use**: Set or edit item price

#### 3. Share
- **Icon**: Share arrow symbol
- **Label**: "Share" / "Partager"
- **Color**: Dark purple/gray
- **Use**: Share item with others

#### 4. Cover
- **Icon**: Image/picture symbol
- **Label**: "Cover" / "Couverture"
- **Color**: Dark purple/gray
- **Use**: Set item cover image

#### 5. Project
- **Icon**: Layers/stack symbol
- **Label**: "Project" / "Projet"
- **Color**: Dark purple/gray
- **Use**: Add to project or collection

#### 6. Delete
- **Icon**: Trash/bin symbol
- **Label**: "Delete" / "Supprimer"
- **Color**: Red (`AppColors.danger500`)
- **Use**: Delete the item

### Interaction Pattern

**Trigger:**
- Long-press on content item (minimum 500ms hold)
- Haptic feedback on trigger

**Display:**
- Menu appears above or below the pressed item
- Backdrop with semi-transparent overlay
- Menu animates in (scale + fade, 200ms)

**Dismissal:**
- Tap outside menu
- Select an action
- Tap back/close button

### Flutter Implementation

**Basic Context Menu:**
```dart
void showContextMenu(BuildContext context, {
  required Offset position,
  VoidCallback? onGroup,
  VoidCallback? onPrice,
  VoidCallback? onShare,
  VoidCallback? onCover,
  VoidCallback? onProject,
  VoidCallback? onDelete,
}) {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx,
      position.dy,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
    ),
    elevation: 12,
    items: [
      if (onGroup != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.create_new_folder,
            label: 'Group',
            color: AppColors.basic700,
          ),
          onTap: onGroup,
        ),
      if (onPrice != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.attach_money,
            label: 'Price',
            color: AppColors.basic700,
          ),
          onTap: onPrice,
        ),
      if (onShare != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.share,
            label: 'Share',
            color: AppColors.basic700,
          ),
          onTap: onShare,
        ),
      if (onCover != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.image,
            label: 'Cover',
            color: AppColors.basic700,
          ),
          onTap: onCover,
        ),
      if (onProject != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.layers,
            label: 'Project',
            color: AppColors.basic700,
          ),
          onTap: onProject,
        ),
      if (onDelete != null)
        PopupMenuItem(
          child: _buildMenuItem(
            icon: Icons.delete,
            label: 'Delete',
            color: AppColors.danger500,
          ),
          onTap: onDelete,
        ),
    ],
  );
}

Widget _buildMenuItem({
  required IconData icon,
  required String label,
  required Color color,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 24,
        color: color,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.6,
        ),
      ),
    ],
  );
}
```

**Custom Horizontal Context Menu (Modal Bottom Sheet):**

For a more design-accurate implementation using a custom modal:

```dart
void showHorizontalContextMenu(BuildContext context, {
  VoidCallback? onGroup,
  VoidCallback? onPrice,
  VoidCallback? onShare,
  VoidCallback? onCover,
  VoidCallback? onProject,
  VoidCallback? onDelete,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Center(
      child: Container(
        width: 345,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacingMedium,
        ),
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (onGroup != null)
              _buildContextMenuItem(
                icon: Icons.create_new_folder,
                label: 'Group',
                onTap: () {
                  Navigator.pop(context);
                  onGroup();
                },
              ),
            if (onPrice != null)
              _buildContextMenuItem(
                icon: Icons.attach_money,
                label: 'Price',
                onTap: () {
                  Navigator.pop(context);
                  onPrice();
                },
              ),
            if (onShare != null)
              _buildContextMenuItem(
                icon: Icons.share,
                label: 'Share',
                onTap: () {
                  Navigator.pop(context);
                  onShare();
                },
              ),
            if (onCover != null)
              _buildContextMenuItem(
                icon: Icons.image,
                label: 'Cover',
                onTap: () {
                  Navigator.pop(context);
                  onCover();
                },
              ),
            if (onProject != null)
              _buildContextMenuItem(
                icon: Icons.layers,
                label: 'Project',
                onTap: () {
                  Navigator.pop(context);
                  onProject();
                },
              ),
            if (onDelete != null)
              _buildContextMenuItem(
                icon: Icons.delete,
                label: 'Delete',
                color: AppColors.danger500,
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                },
              ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildContextMenuItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  Color? color,
}) {
  final itemColor = color ?? AppColors.basic700;

  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
    child: Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: itemColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: itemColor,
              height: 1.6,
            ),
          ),
        ],
      ),
    ),
  );
}
```

**GestureDetector for Long-Press:**

```dart
class LongPressableItem extends StatelessWidget {
  final Widget child;
  final VoidCallback? onGroup;
  final VoidCallback? onPrice;
  final VoidCallback? onShare;
  final VoidCallback? onCover;
  final VoidCallback? onProject;
  final VoidCallback? onDelete;

  const LongPressableItem({
    Key? key,
    required this.child,
    this.onGroup,
    this.onPrice,
    this.onShare,
    this.onCover,
    this.onProject,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Haptic feedback
        HapticFeedback.mediumImpact();

        // Show context menu
        showHorizontalContextMenu(
          context,
          onGroup: onGroup,
          onPrice: onPrice,
          onShare: onShare,
          onCover: onCover,
          onProject: onProject,
          onDelete: onDelete,
        );
      },
      child: child,
    );
  }
}

// Usage:
LongPressableItem(
  onGroup: () => print('Group tapped'),
  onPrice: () => print('Price tapped'),
  onShare: () => print('Share tapped'),
  onCover: () => print('Cover tapped'),
  onProject: () => print('Project tapped'),
  onDelete: () => print('Delete tapped'),
  child: Card(
    child: ListTile(
      title: Text('Long-press me'),
    ),
  ),
);
```

**Complete Context Menu Helper Class:**

```dart
class ContextMenuHelper {
  static void show(
    BuildContext context, {
    bool showGroup = true,
    bool showPrice = true,
    bool showShare = true,
    bool showCover = true,
    bool showProject = true,
    bool showDelete = true,
    required Function(ContextMenuAction) onAction,
  }) {
    HapticFeedback.mediumImpact();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => Center(
        child: Container(
          width: 345,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacingMedium,
          ),
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (showGroup)
                _MenuItem(
                  icon: Icons.create_new_folder,
                  label: 'Group',
                  action: ContextMenuAction.group,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
              if (showPrice)
                _MenuItem(
                  icon: Icons.attach_money,
                  label: 'Price',
                  action: ContextMenuAction.price,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
              if (showShare)
                _MenuItem(
                  icon: Icons.share,
                  label: 'Share',
                  action: ContextMenuAction.share,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
              if (showCover)
                _MenuItem(
                  icon: Icons.image,
                  label: 'Cover',
                  action: ContextMenuAction.cover,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
              if (showProject)
                _MenuItem(
                  icon: Icons.layers,
                  label: 'Project',
                  action: ContextMenuAction.project,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
              if (showDelete)
                _MenuItem(
                  icon: Icons.delete,
                  label: 'Delete',
                  action: ContextMenuAction.delete,
                  color: AppColors.danger500,
                  onTap: (action) {
                    Navigator.pop(context);
                    onAction(action);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ContextMenuAction {
  group,
  price,
  share,
  cover,
  project,
  delete,
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final ContextMenuAction action;
  final Function(ContextMenuAction) onTap;
  final Color? color;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.action,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? AppColors.basic700;

    return InkWell(
      onTap: () => onTap(action),
      borderRadius: BorderRadius.circular(AppRadius.radiusMinimal),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: itemColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: itemColor,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage:
ContextMenuHelper.show(
  context,
  onAction: (action) {
    switch (action) {
      case ContextMenuAction.group:
        // Handle group action
        break;
      case ContextMenuAction.price:
        // Handle price action
        break;
      case ContextMenuAction.share:
        // Handle share action
        break;
      case ContextMenuAction.cover:
        // Handle cover action
        break;
      case ContextMenuAction.project:
        // Handle project action
        break;
      case ContextMenuAction.delete:
        // Handle delete action
        break;
    }
  },
);
```

### Context Menu Guidelines

**When to Use:**
- On puzzle/content cards for quick actions
- On list items for item-specific operations
- On images for editing options
- Any content that supports multiple actions

**Best Practices:**
1. **Limit items**: Show 3-6 most relevant actions
2. **Destructive last**: Always place Delete action at the end
3. **Color coding**: Use red for Delete, default color for others
4. **Haptic feedback**: Provide tactile feedback on long-press
5. **Clear labels**: Use concise, action-oriented labels
6. **Icon clarity**: Use recognizable icons that match the action

**Contextual Display:**
- Show only relevant actions for the item type
- Hide unavailable actions rather than disabling them
- Adjust menu width based on number of items shown

## Component Usage Guidelines

1. **Consistency**: Always use components from this design system to maintain visual consistency
2. **Accessibility**: Ensure minimum touch target size of 48dp × 48dp for interactive elements
3. **States**: Implement all interactive states (default, hover, pressed, disabled, error)
4. **Spacing**: Use design system spacing tokens between components
5. **Color**: Use semantic color tokens (e.g., `surfaceCard`) instead of primitive colors when possible

## Next Steps

To add more components to this document, extract specifications from these Figma pages:
- Forms (dropdowns, checkboxes, radio buttons, switches)
- Data display (tables, data grids, charts)
- Feedback (snackbars, toasts, progress indicators)
- Media (image containers, avatars, thumbnails)
- Navigation (tabs, breadcrumbs, steppers)
