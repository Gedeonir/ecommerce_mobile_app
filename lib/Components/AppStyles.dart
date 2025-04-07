import 'package:flutter/material.dart';
import 'AppColors.dart'; // Import the colors file

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black, // Using the custom black color
    letterSpacing: 0,
    height: 1.2
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black, // Using the custom black color
    letterSpacing: 0,
    height: 1.2
  );

  static const TextStyle subHeads = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black, // Using the custom black color
    letterSpacing: 0,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black, // Using the custom black color
    letterSpacing: 0,
  );

  static const TextStyle activeSort = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary, // Using the custom black color
    letterSpacing: 0,
  );

  static const TextStyle descriptiveItem = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.black, // Using the custom black color
    letterSpacing: 0,
    height: 0.2
  );

  static const TextStyle descriptionText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.gray, // Using the custom black color
    letterSpacing: 0,
  );

  static const TextStyle ButtonText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.white, // Using the custom black color
    letterSpacing: 0,
  );
}
