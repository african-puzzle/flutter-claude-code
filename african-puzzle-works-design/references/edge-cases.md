# Edge Cases & Error Handling

This document defines how to handle edge cases, errors, loading states, empty states, and exceptional scenarios in the African Puzzle Works design system.

## Content States

### Empty States

Display when there is no content to show.

**Visual Design**:
- Icon: 64px × 64px, `#8F9BB3` (Basic 600), 60% opacity
- Title: 18px Bold, `#192038` (Basic 900)
- Message: 14px Regular, `#8F9BB3` (Basic 600)
- Action Button: Optional, primary button style
- Layout: Centered vertically and horizontally

**Common Empty States**:

#### No Items in List
```dart
class EmptyListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox,
            size: 64,
            color: AppColors.basic600.withOpacity(0.6),
          ),
          const SizedBox(height: 16),
          const Text(
            'No items yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.basic900,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Start by adding your first item',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.basic600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {/* Add item */},
            icon: const Icon(Icons.add, size: 20),
            label: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
```

#### No Search Results
```dart
class NoSearchResults extends StatelessWidget {
  final String searchQuery;

  const NoSearchResults({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: AppColors.basic600.withOpacity(0.6),
          ),
          const SizedBox(height: 16),
          const Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No results for "$searchQuery"',
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Try different keywords',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.basic600,
            ),
          ),
        ],
      ),
    );
  }
}
```

### Loading States

Display while content is being fetched or processed.

**Full Screen Loading**:
```dart
class FullScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary500,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          const Text(
            'Loading...',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.basic600,
            ),
          ),
        ],
      ),
    );
  }
}
```

**Inline Loading** (within existing content):
```dart
Center(
  child: SizedBox(
    width: 24,
    height: 24,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: AppColors.primary500,
    ),
  ),
)
```

**Button Loading State**:
```dart
ElevatedButton(
  onPressed: isLoading ? null : () {/* action */},
  child: isLoading
      ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
      : const Text('Submit'),
)
```

**List Loading** (skeleton screens):
```dart
ListView.builder(
  itemCount: 5,
  itemBuilder: (context, index) => Shimmer.fromColors(
    baseColor: AppColors.basic300,
    highlightColor: AppColors.basic200,
    child: ListTile(
      leading: CircleAvatar(backgroundColor: Colors.white),
      title: Container(
        height: 16,
        width: double.infinity,
        color: Colors.white,
      ),
      subtitle: Container(
        height: 12,
        width: 200,
        color: Colors.white,
      ),
    ),
  ),
)
```

### Error States

Display when an operation fails or content cannot be loaded.

**Full Screen Error**:
```dart
class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorState({
    this.message = 'Something went wrong',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.danger500,
          ),
          const SizedBox(height: 16),
          const Text(
            'Oops!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.danger500,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 20),
              label: const Text('Try Again'),
            ),
          ],
        ],
      ),
    );
  }
}
```

**Network Error**:
```dart
class NetworkError extends StatelessWidget {
  final VoidCallback onRetry;

  const NetworkError({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 64,
            color: AppColors.danger500,
          ),
          const SizedBox(height: 16),
          const Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please check your connection and try again',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
```

**Inline Error** (form fields, cards):
```dart
Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: AppColors.danger500.withOpacity(0.1),
    border: Border.all(color: AppColors.danger500),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Row(
    children: [
      Icon(Icons.error, color: AppColors.danger500, size: 20),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          'Error message here',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.danger500,
          ),
        ),
      ),
    ],
  ),
)
```

## Text Edge Cases

### Long Text Overflow

**Single Line with Ellipsis**:
```dart
Text(
  'Very long title that might overflow on small screens',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(fontSize: 18),
)
```

**Multi-Line with Fade**:
```dart
Text(
  'Long description that can wrap but eventually fades out',
  maxLines: 3,
  overflow: TextOverflow.fade,
  style: const TextStyle(fontSize: 14),
)
```

**Expandable Text**:
```dart
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({
    required this.text,
    this.maxLines = 3,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            isExpanded ? 'Show less' : 'Show more',
            style: TextStyle(
              color: AppColors.primary500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
```

### Empty Text Fields

**Placeholder Text**:
```dart
TextField(
  decoration: InputDecoration(
    hintText: 'Enter your name',
    hintStyle: TextStyle(
      color: AppColors.basic600,
      fontSize: 14,
    ),
  ),
)
```

**Required Field Indicator**:
```dart
InputDecoration(
  labelText: 'Email',
  suffixText: '*',
  suffixStyle: TextStyle(color: AppColors.danger500),
)
```

### RTL (Right-to-Left) Support

```dart
Directionality(
  textDirection: TextDirection.rtl, // or ltr
  child: /* content */,
)

// Automatic detection
Text(
  arabicText,
  textDirection: TextDirection.rtl,
)
```

## Image Edge Cases

### Failed Image Loading

```dart
Image.network(
  imageUrl,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      color: AppColors.basic200,
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: 48,
          color: AppColors.basic600,
        ),
      ),
    );
  },
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;

    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
)
```

### Missing/Null Image

```dart
imageUrl != null
    ? Image.network(imageUrl)
    : Container(
        color: AppColors.basic200,
        child: Icon(
          Icons.image,
          size: 48,
          color: AppColors.basic600,
        ),
      )
```

### Image Aspect Ratio Protection

```dart
AspectRatio(
  aspectRatio: 16 / 9,
  child: Image.network(
    imageUrl,
    fit: BoxFit.cover,
  ),
)
```

## List Edge Cases

### Single Item in List

Ensure single items don't look awkward:
```dart
ListView.builder(
  shrinkWrap: true, // Don't take infinite height
  physics: itemCount == 1
      ? const NeverScrollableScrollPhysics()
      : null,
  itemCount: itemCount,
  itemBuilder: (context, index) => /* item */,
)
```

### Empty List vs Loading

```dart
Widget buildListOrState() {
  if (isLoading) {
    return FullScreenLoading();
  }

  if (hasError) {
    return ErrorState(onRetry: fetchData);
  }

  if (items.isEmpty) {
    return EmptyListState();
  }

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => buildItem(items[index]),
  );
}
```

### Pull to Refresh

```dart
RefreshIndicator(
  onRefresh: () async {
    await fetchData();
  },
  child: ListView.builder(/* ... */),
)
```

### Infinite Scroll / Pagination

```dart
class PaginatedList extends StatefulWidget {
  @override
  _PaginatedListState createState() => _PaginatedListState();
}

class _PaginatedListState extends State<PaginatedList> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (isLoadingMore) return;

    setState(() => isLoadingMore = true);
    await fetchMoreItems();
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: items.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return buildItem(items[index]);
      },
    );
  }
}
```

## Form Validation

### Field Validation

```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 3) {
      return 'Must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Only letters allowed';
    }
    return null; // Valid
  },
  decoration: InputDecoration(
    labelText: 'Name',
    errorStyle: TextStyle(
      color: AppColors.danger500,
      fontSize: 12,
    ),
  ),
)
```

### Email Validation

```dart
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}
```

### Password Validation

```dart
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Must contain an uppercase letter';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Must contain a number';
  }
  return null;
}
```

### Form Submission

```dart
final _formKey = GlobalKey<FormState>();

void submitForm() {
  if (_formKey.currentState!.validate()) {
    // Form is valid, proceed
    _formKey.currentState!.save();
    // Submit data
  } else {
    // Show validation errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fix errors')),
    );
  }
}
```

## Navigation Edge Cases

### Back Button on First Screen

```dart
WillPopScope(
  onWillPop: () async {
    // Confirm exit
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App?'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Exit'),
          ),
        ],
      ),
    ) ?? false;
  },
  child: /* screen content */,
)
```

### Deep Links / External Navigation

```dart
// Handle when app is opened from external link
void handleDeepLink(Uri uri) {
  if (uri.path == '/puzzle/123') {
    Navigator.pushNamed(
      context,
      '/puzzle-detail',
      arguments: {'id': '123'},
    );
  } else {
    // Unknown link, go to home
    Navigator.pushNamed(context, '/home');
  }
}
```

## Network Edge Cases

### Timeout Handling

```dart
try {
  final response = await http.get(url).timeout(
    const Duration(seconds: 10),
    onTimeout: () {
      throw TimeoutException('Request timeout');
    },
  );
} on TimeoutException {
  // Show timeout error
  showSnackbar('Request timed out. Please try again.');
} catch (e) {
  // Show generic error
  showSnackbar('Network error occurred');
}
```

### Offline Mode

```dart
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

// Usage
if (await NetworkChecker.isConnected()) {
  fetchData();
} else {
  showOfflineMessage();
}
```

### Retry Logic

```dart
Future<Response> fetchWithRetry(String url, {int maxRetries = 3}) async {
  int retries = 0;

  while (retries < maxRetries) {
    try {
      return await http.get(Uri.parse(url));
    } catch (e) {
      retries++;
      if (retries >= maxRetries) rethrow;
      await Future.delayed(Duration(seconds: retries * 2)); // Exponential backoff
    }
  }

  throw Exception('Max retries exceeded');
}
```

## Permission Edge Cases

### Camera/Photo Permission

```dart
import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  final status = await Permission.camera.status;

  if (status.isDenied) {
    final result = await Permission.camera.request();
    if (result.isPermanentlyDenied) {
      // Show dialog to open settings
      showPermissionDialog();
    }
  }

  if (status.isGranted) {
    openCamera();
  }
}

void showPermissionDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Camera Permission'),
      content: const Text(
        'Camera access is required. Please enable it in settings.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            openAppSettings();
            Navigator.pop(context);
          },
          child: const Text('Settings'),
        ),
      ],
    ),
  );
}
```

## Date/Time Edge Cases

### Date Formatting

```dart
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays == 0) {
    return 'Today';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inDays < 7) {
    return DateFormat('EEEE').format(date); // Monday, Tuesday, etc.
  } else {
    return DateFormat('MMM d, yyyy').format(date); // Jan 15, 2024
  }
}
```

### Time Zones

```dart
DateTime localTime = DateTime.now();
DateTime utcTime = localTime.toUtc();
DateTime backToLocal = utcTime.toLocal();
```

## Number Edge Cases

### Large Numbers

```dart
import 'package:intl/intl.dart';

String formatNumber(int number) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  }
}

// 1500 → "1.5K"
// 2500000 → "2.5M"
```

### Currency Formatting

```dart
String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );
  return formatter.format(amount);
}

// 99.99 → "$99.99"
```

### Percentage

```dart
String formatPercentage(double value) {
  return '${(value * 100).toStringAsFixed(1)}%';
}

// 0.856 → "85.6%"
```

## Edge Case Testing Checklist

- [ ] Empty states for all lists/collections
- [ ] Loading states for all async operations
- [ ] Error states with retry functionality
- [ ] Long text truncation/overflow
- [ ] Missing/null data handling
- [ ] Network timeout and offline mode
- [ ] Form validation (all fields)
- [ ] Image loading failures
- [ ] Permission denied scenarios
- [ ] Single item in lists
- [ ] Large numbers/text formatting
- [ ] Date/time edge cases
- [ ] Back button on first screen
- [ ] Keyboard overlap with inputs
- [ ] RTL language support
- [ ] Dark mode edge cases
- [ ] Small screen responsiveness
- [ ] Slow network simulation
