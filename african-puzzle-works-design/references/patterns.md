# Screen Patterns and Layout Guidelines

This document describes common screen patterns, layout structures, and design conventions for the African Puzzle Works app.

## Layout Principles

### 8pt Grid System
All spacing and sizing should align to an 8pt grid for visual harmony and consistency.

- Use multiples of 8px for spacing between elements
- Use 4px (half-step) for fine-tuned adjustments when necessary
- Maintain consistent padding and margins across similar components

### Spacing Rules
Based on observations from the design system:

| Context | Spacing | Token |
|---------|---------|-------|
| Icon to title | 8px | `spacing-sm` |
| Top padding to title | 24px | `spacing-lrg` |
| Title to content below | 8px | `spacing-sm` |
| Horizontal padding for titles | 24px | `spacing-lrg` |
| Between list items | 8-16px | `spacing-sm` to `spacing-med` |
| Screen edge padding | 16-24px | `spacing-med` to `spacing-lrg` |

## Common Screen Templates

### 1. Standard Screen with App Bar

Most common screen layout for content pages.

```dart
Scaffold(
  appBar: AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: true,
    title: const Text('Screen Title'),
  ),
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      child: Column(
        children: [
          // Screen content
        ],
      ),
    ),
  ),
);
```

**Layout Rules:**
- App bar height: 56dp (default)
- Title: Centered, max width constrained
- Title truncates with ellipsis if exceeds container
- Back arrow on left, actions on right
- Content padding: 16px all around

### 2. Scrollable Content Screen

For screens with vertically scrollable content.

```dart
Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Screen Title'),
  ),
  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Scrollable content
        ],
      ),
    ),
  ),
);
```

### 3. List Screen

For screens displaying lists of items.

```dart
Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('List Title'),
  ),
  body: SafeArea(
    child: ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSpacing.spacingSmall,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(items[index].title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        );
      },
    ),
  ),
);
```

### 4. Grid Screen (Puzzle Browsing)

For screens displaying items in a grid layout, such as puzzle browsing.

```dart
Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Puzzles'),
  ),
  body: SafeArea(
    child: GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.spacingSmall,
        mainAxisSpacing: AppSpacing.spacingSmall,
        childAspectRatio: 0.75,
      ),
      itemCount: puzzles.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(puzzles[index].image),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(puzzles[index].title),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacingSmall,
                        vertical: AppSpacing.spacingXs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warning500,
                        borderRadius: BorderRadius.circular(
                          AppRadius.radiusMinimal,
                        ),
                      ),
                      child: Text(puzzles[index].price),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),
);
```

**Grid Rules:**
- 2 columns on mobile, 3-4 on tablet
- Consistent spacing between items (8px)
- Cards with image + pricing badge
- Image aspect ratio: ~0.75 (3:4)

### 5. Profile/Settings Screen

Screen with sections and list items.

```dart
Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Profile'),
  ),
  body: SafeArea(
    child: ListView(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      children: [
        // Profile header
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.primary500,
                child: const Icon(Icons.person, size: 48),
              ),
              const SizedBox(height: AppSpacing.spacingSmall),
              Text(
                'User Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.spacingLarge),
        // Settings sections
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Account'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ],
    ),
  ),
);
```

**Profile Screen Rules:**
- Avatar centered at top
- Name/title below avatar
- List items with icon + text + chevron
- Spacing: 24px after header, 8px between items

### 6. Screen with FAB

Screen with a floating action button for primary action.

```dart
Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Contacts'),
  ),
  body: SafeArea(
    child: ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      itemCount: contacts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(contacts[index].initials),
          ),
          title: Text(contacts[index].name),
          subtitle: Text(contacts[index].phone),
          onTap: () {},
        );
      },
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    backgroundColor: AppColors.success500,
    child: const Icon(Icons.add),
  ),
);
```

**FAB Rules:**
- Position: Bottom right (default)
- Color: Success green (#00E096)
- Icon: White, 24px
- Primary action only (e.g., "Add" action)

### 7. Modal/Dialog Screen

Full-screen or overlay modal for focused interactions.

```dart
// Full-screen modal
Navigator.push(
  context,
  MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Modal Title'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('SAVE'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Column(
            children: [
              // Modal content
            ],
          ),
        ),
      ),
    ),
  ),
);

// Dialog overlay
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
    title: const Text('Dialog Title'),
    content: const Text('Dialog message content'),
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

**Modal Rules:**
- Close icon (X) on left of app bar
- Save/Done action on right
- Dialog max width: 280dp
- Dialog padding: 24px all around

## Special Screen Types

### Splash/Branding Screen

Initial loading screen with branding.

**Characteristics:**
- Full-screen gradient or solid color background
- Centered logo or branding
- No navigation elements
- Optional loading indicator at bottom

```dart
Scaffold(
  backgroundColor: AppColors.primary500,
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo image
        Image.asset('assets/logo.png', width: 200),
        const SizedBox(height: AppSpacing.spacingLarge),
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ],
    ),
  ),
);
```

### Language Selection Modal

Modal for selecting app language on first launch.

**Characteristics:**
- Centered modal overlay
- Radio button selections
- Confirm button at bottom

```dart
AlertDialog(
  title: const Text('Select Language'),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RadioListTile<String>(
        title: const Text('English'),
        value: 'en',
        groupValue: selectedLanguage,
        onChanged: (value) {},
      ),
      RadioListTile<String>(
        title: const Text('Français'),
        value: 'fr',
        groupValue: selectedLanguage,
        onChanged: (value) {},
      ),
    ],
  ),
  actions: [
    ElevatedButton(
      onPressed: () {},
      child: const Text('CONFIRM'),
    ),
  ],
);
```

### Onboarding/Instruction Flow

Multi-step tutorial or instruction screens.

**Characteristics:**
- PageView with indicator dots
- Skip button (top right)
- Next/Get Started button (bottom)
- Images or illustrations centered
- Text below images

```dart
PageView.builder(
  itemCount: onboardingPages.length,
  onPageChanged: (index) {},
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.spacingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(onboardingPages[index].image),
          const SizedBox(height: AppSpacing.spacingLarge),
          Text(
            onboardingPages[index].title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.spacingSmall),
          Text(
            onboardingPages[index].description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  },
);
```

## State Patterns

### Loading State

Display during data fetching or processing.

```dart
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary500),
      ),
      const SizedBox(height: AppSpacing.spacingMedium),
      Text(
        'Loading...',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  ),
);
```

### Empty State

Display when no data is available.

```dart
Center(
  child: Padding(
    padding: const EdgeInsets.all(AppSpacing.spacingLarge),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inbox_outlined,
          size: 64,
          color: AppColors.basic500,
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        Text(
          'No items found',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.basic600,
          ),
        ),
        const SizedBox(height: AppSpacing.spacingSmall),
        Text(
          'Try adjusting your filters',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.basic600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);
```

### Error State

Display when an error occurs.

```dart
Center(
  child: Padding(
    padding: const EdgeInsets.all(AppSpacing.spacingLarge),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 64,
          color: AppColors.danger500,
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.spacingSmall),
        Text(
          'Please try again later',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.basic600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        ElevatedButton(
          onPressed: () {},
          child: const Text('RETRY'),
        ),
      ],
    ),
  ),
);
```

## Typography Patterns

### Title Truncation
When titles exceed their container width, they should truncate with an ellipsis.

```dart
Text(
  'Very Long Title That Exceeds The Container Width',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: Theme.of(context).textTheme.titleMedium,
);
```

### Centered Titles with Max Width
Titles should be centered but with a maximum width constraint to prevent excessive line lengths.

```dart
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 300),
    child: Text(
      'Screen Title',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  ),
);
```

## Color Patterns

### Observed Color Usage

Based on the design system:

- **Deep purple/navy** (`Primary 500-900`): Primary surfaces, app bars, navigation
- **Orange/amber** (`Warning/Brand`): Branding, pricing badges, accents
- **Teal/cyan** (`Info`): Status indicators, informational highlights
- **Green** (`Success`): FABs, positive actions, success states
- **White** (`Basic 100`): Text on dark backgrounds, card surfaces
- **Dark gray** (`Basic 700-900`): Text on light backgrounds, dark mode surfaces

## Design Guidelines

1. **Consistency**: Use the same layout pattern for similar screen types
2. **Safe Areas**: Always wrap content in `SafeArea` to respect device notches and navigation bars
3. **Responsive Spacing**: Use design system spacing tokens instead of hardcoded values
4. **Accessibility**: Maintain minimum touch target size of 48dp × 48dp
5. **Visual Hierarchy**: Use typography scale and spacing to create clear information hierarchy
6. **Color Usage**: Use semantic color tokens (e.g., `surfaceCard`, `primary500`) instead of raw hex values

## Next Steps

To expand this document:
1. Capture additional screen designs from the Figma project
2. Document animation patterns and transitions
3. Add responsive layout guidelines for tablet/web
4. Include dark mode variations for patterns
