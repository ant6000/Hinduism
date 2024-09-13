import 'package:flutter/material.dart';
import 'colors.dart'; // Import your colors
import 'font_sizes.dart'; // Import your font sizes

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: FontSizes.medium,
      ),
      bodySmall: TextStyle(
        color: AppColors.textColor,
        fontSize: FontSizes.small,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textColor,
        fontSize: FontSizes.extraLarge,
      ),
      // Add more text styles as needed
    ),
    // Add more theme properties as needed
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.red,
        fontSize: FontSizes.medium,
      ),
      bodySmall: TextStyle(
        color: Colors.red,
        fontSize: FontSizes.small,
      ),
      headlineLarge: TextStyle(
        color: Colors.red,
        fontSize: FontSizes.extraLarge,
      ),
      // Add more text styles as needed
    ),
    // Add more theme properties as needed
  );
}
