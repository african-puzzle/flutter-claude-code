import 'package:flutter/material.dart';

/// African Puzzle Works Design System Theme
///
/// This file contains the complete theme configuration for the African Puzzle Works app,
/// generated from the Figma design system variables.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   themeMode: ThemeMode.system,
/// );
/// ```

class AppTheme {
  // Prevent instantiation
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        textTheme: _textTheme,
        scaffoldBackgroundColor: AppColors.basicWhite,
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        cardTheme: _cardTheme,
        dividerTheme: _dividerTheme,
        iconTheme: _iconTheme,
        floatingActionButtonTheme: _fabTheme,
      );

  /// Dark theme configuration
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _darkColorScheme,
        textTheme: _textTheme,
        scaffoldBackgroundColor: AppColors.basic900,
        appBarTheme: _appBarThemeDark,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationThemeDark,
        cardTheme: _cardThemeDark,
        dividerTheme: _dividerThemeDark,
        iconTheme: _iconThemeDark,
        floatingActionButtonTheme: _fabTheme,
      );

  // Color Schemes
  static final ColorScheme _lightColorScheme = ColorScheme.light(
    primary: AppColors.primary500,
    onPrimary: AppColors.basicWhite,
    primaryContainer: AppColors.primary100,
    onPrimaryContainer: AppColors.primary900,
    secondary: AppColors.brandSecondary,
    onSecondary: AppColors.basic900,
    error: AppColors.danger500,
    onError: AppColors.basicWhite,
    surface: AppColors.basicWhite,
    onSurface: AppColors.basic900,
    surfaceContainerHighest: AppColors.basic200,
    outline: AppColors.basic400,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary400,
    onPrimary: AppColors.basic900,
    primaryContainer: AppColors.primary700,
    onPrimaryContainer: AppColors.primary100,
    secondary: AppColors.brandSecondary,
    onSecondary: AppColors.basic900,
    error: AppColors.danger400,
    onError: AppColors.basic900,
    surface: AppColors.basic900,
    onSurface: AppColors.basicWhite,
    surfaceContainerHighest: AppColors.basic700,
    outline: AppColors.basic600,
  );

  // Text Theme
  static final TextTheme _textTheme = TextTheme(
    // Display styles (largest headings)
    displayLarge: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h1,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h2,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    // Headline styles
    headlineLarge: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h3,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h4,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    // Title styles
    titleLarge: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h5,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphMed,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    // Body styles
    bodyLarge: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphLg,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphMed,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphSm,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    // Label styles
    labelLarge: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphMed,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.paragraphSm,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.caption,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  );

  // App Bar Theme
  static final AppBarTheme _appBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.primary500,
    foregroundColor: AppColors.basicWhite,
    iconTheme: IconThemeData(color: AppColors.basicWhite),
    titleTextStyle: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w600,
      color: AppColors.basicWhite,
    ),
  );

  static final AppBarTheme _appBarThemeDark = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.basic800,
    foregroundColor: AppColors.basicWhite,
    iconTheme: IconThemeData(color: AppColors.basicWhite),
    titleTextStyle: TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: AppTypography.h6,
      fontWeight: FontWeight.w600,
      color: AppColors.basicWhite,
    ),
  );

  // Button Themes
  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
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
      textStyle: TextStyle(
        fontFamily: AppTypography.fontFamily,
        fontSize: AppTypography.paragraphMed,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme =
      OutlinedButtonThemeData(
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
      textStyle: TextStyle(
        fontFamily: AppTypography.fontFamily,
        fontSize: AppTypography.paragraphMed,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary500,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spacingMedium,
        vertical: AppSpacing.spacingSmall,
      ),
      textStyle: TextStyle(
        fontFamily: AppTypography.fontFamily,
        fontSize: AppTypography.paragraphMed,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  // Input Decoration Theme
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceInput,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.basic400,
        width: AppBorders.normal,
      ),
    ),
    enabledBorder: OutlineInputBorder(
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
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.danger500,
        width: AppBorders.normal,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.danger500,
        width: AppBorders.thick,
      ),
    ),
  );

  static final InputDecorationTheme _inputDecorationThemeDark =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.basic800,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.spacingMedium,
      vertical: AppSpacing.spacingSmall,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.basic600,
        width: AppBorders.normal,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.basic600,
        width: AppBorders.normal,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.primary400,
        width: AppBorders.thick,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.danger400,
        width: AppBorders.normal,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
      borderSide: BorderSide(
        color: AppColors.danger400,
        width: AppBorders.thick,
      ),
    ),
  );

  // Card Theme
  static final CardTheme _cardTheme = CardTheme(
    color: AppColors.surfaceCard,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
    margin: const EdgeInsets.all(AppSpacing.spacingSmall),
  );

  static final CardTheme _cardThemeDark = CardTheme(
    color: AppColors.basic800,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.radiusRounded),
    ),
    margin: const EdgeInsets.all(AppSpacing.spacingSmall),
  );

  // Divider Theme
  static final DividerThemeData _dividerTheme = DividerThemeData(
    color: AppColors.basic300,
    thickness: AppBorders.thin,
    space: AppSpacing.spacingMedium,
  );

  static final DividerThemeData _dividerThemeDark = DividerThemeData(
    color: AppColors.basic700,
    thickness: AppBorders.thin,
    space: AppSpacing.spacingMedium,
  );

  // Icon Theme
  static final IconThemeData _iconTheme = IconThemeData(
    color: AppColors.basic900,
    size: AppSpacing.spacingLarge,
  );

  static final IconThemeData _iconThemeDark = IconThemeData(
    color: AppColors.basicWhite,
    size: AppSpacing.spacingLarge,
  );

  // FAB Theme
  static final FloatingActionButtonThemeData _fabTheme =
      FloatingActionButtonThemeData(
    backgroundColor: AppColors.success500,
    foregroundColor: AppColors.basicWhite,
    elevation: 4,
    shape: const CircleBorder(),
  );
}

/// Color constants from African Puzzle Works design system
class AppColors {
  AppColors._();

  // Primary (Purple)
  static const Color primary100 = Color(0xFFC5BED1);
  static const Color primary200 = Color(0xFF9E93B2);
  static const Color primary300 = Color(0xFF776793);
  static const Color primary400 = Color(0xFF5A477B);
  static const Color primary500 = Color(0xFF3D2664);
  static const Color primary600 = Color(0xFF37225C);
  static const Color primary700 = Color(0xFF2F1C52);
  static const Color primary800 = Color(0xFF271748);
  static const Color primary900 = Color(0xFF1A0D36);

  // Basic (Neutrals)
  static const Color basicWhite = Color(0xFFFFFFFF);
  static const Color basic100 = Color(0xFFFFFFFF);
  static const Color basic200 = Color(0xFFF7F9FC);
  static const Color basic300 = Color(0xFFEDF1F7);
  static const Color basic400 = Color(0xFFE4E9F2);
  static const Color basic500 = Color(0xFFC5CEE0);
  static const Color basic600 = Color(0xFF8F9BB3);
  static const Color basic700 = Color(0xFF2E3A59);
  static const Color basic800 = Color(0xFF222B45);
  static const Color basic900 = Color(0xFF192038);
  static const Color basic1000 = Color(0xFF151A30);
  static const Color basic1100 = Color(0xFF101426);

  // Success (Green/Teal)
  static const Color success100 = Color(0xFFEDFFF3);
  static const Color success200 = Color(0xFFB2FFD6);
  static const Color success300 = Color(0xFF8CFAC7);
  static const Color success400 = Color(0xFF51F0B0);
  static const Color success500 = Color(0xFF00E096);
  static const Color success600 = Color(0xFF00B283);
  static const Color success700 = Color(0xFF008F72);
  static const Color success900 = Color(0xFF00524C);

  // Info (Blue)
  static const Color info100 = Color(0xFFF2F8FF);
  static const Color info200 = Color(0xFFC7E2FF);
  static const Color info300 = Color(0xFF94CBFF);
  static const Color info400 = Color(0xFF42AAFF);
  static const Color info500 = Color(0xFF0095FF);
  static const Color info600 = Color(0xFF006FD6);
  static const Color info700 = Color(0xFF0057C2);
  static const Color info800 = Color(0xFF0041A8);
  static const Color info900 = Color(0xFF002885);

  // Warning (Yellow/Orange)
  static const Color warning100 = Color(0xFFFFF4E5);
  static const Color warning200 = Color(0xFFFFE4B8);
  static const Color warning300 = Color(0xFFFFD28A);
  static const Color warning400 = Color(0xFFFFC05C);
  static const Color warning500 = Color(0xFFFFAA2E);
  static const Color warning600 = Color(0xFFFF9800);
  static const Color warning700 = Color(0xFFE68900);
  static const Color warning800 = Color(0xFFCC7A00);
  static const Color warning900 = Color(0xFFB36B00);

  // Danger (Red)
  static const Color danger100 = Color(0xFFFFEAEA);
  static const Color danger200 = Color(0xFFFFCCCC);
  static const Color danger300 = Color(0xFFFFADAD);
  static const Color danger400 = Color(0xFFFF8F8F);
  static const Color danger500 = Color(0xFFFF7070);
  static const Color danger600 = Color(0xFFFF5252);
  static const Color danger700 = Color(0xFFE63E3E);
  static const Color danger800 = Color(0xFFCC2B2B);
  static const Color danger900 = Color(0xFFB31818);

  // Brand Colors (aliases to be defined based on Orange palette)
  static const Color brandPrimary = warning300; // Placeholder
  static const Color brandSecondary = warning100; // Placeholder

  // Semantic Surface Colors
  static const Color surfaceCard = basic100;
  static const Color surfaceError = danger100;
  static const Color surfaceInput = basic200;
  static const Color surfaceModal = basic100;
  static const Color surfaceSubtle = Color(0x0A3D2664); // Primary 500 @ 4% opacity
  static const Color surfaceNotificationSuccess = primary500;
  static const Color surfaceNotificationError = danger100;
  static const Color surfaceWarn = warning100;
  static const Color surfaceDisabled = basic300;
}

/// Typography constants from African Puzzle Works design system
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Open Sans';

  // Font Sizes - Headings
  static const double h1 = 60.0;
  static const double h2 = 48.0;
  static const double h3 = 40.0;
  static const double h4 = 32.0;
  static const double h5 = 24.0;
  static const double h6 = 20.0;

  // Font Sizes - Paragraphs
  static const double caption = 10.0;
  static const double paragraphSm = 12.0;
  static const double paragraphMed = 16.0;
  static const double paragraphLg = 20.0;
}

/// Spacing constants from African Puzzle Works design system
/// Based on 8pt grid
class AppSpacing {
  AppSpacing._();

  // Primitive Spacing Values
  static const double none = 0.0;
  static const double half = 4.0;
  static const double one = 8.0;
  static const double two = 16.0;
  static const double three = 24.0;
  static const double four = 32.0;
  static const double six = 48.0;
  static const double eight = 64.0;
  static const double twelve = 96.0;
  static const double sixteen = 128.0;
  static const double twenty = 160.0;
  static const double doubleVariable = 200.0;

  // Semantic Spacing (most commonly used)
  static const double spacingXs = half;
  static const double spacingSmall = one;
  static const double spacingMedium = two;
  static const double spacingLarge = three;
  static const double spacingXl = four;
  static const double spacing2xl = eight;
}

/// Border radius constants from African Puzzle Works design system
class AppRadius {
  AppRadius._();

  // Primitive Radius Values
  static const double none = 0.0;
  static const double xs = 2.0;
  static const double sm = 4.0;
  static const double med = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xxl = 20.0;
  static const double xxxl = 24.0;
  static const double xxxxl = 32.0;
  static const double full = 9999.0;

  // Semantic Radius (most commonly used)
  static const double radiusMinimal = sm;
  static const double radiusRounded = med;
  static const double radiusFull = full;
}

/// Border width constants from African Puzzle Works design system
class AppBorders {
  AppBorders._();

  static const double thin = 0.5;
  static const double normal = 1.0;
  static const double thick = 2.0;
  static const double thicker = 3.0;
  static const double thickest = 4.0;
}
