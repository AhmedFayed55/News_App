import 'package:flutter/material.dart';

import 'App_Colors.dart';
import 'App_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      indicatorColor: AppColors.black,
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16black,
          labelMedium: AppStyles.mediuem14black,
          headlineLarge: AppStyles.mediuem20black),
      appBarTheme:
          AppBarTheme(centerTitle: true, backgroundColor: AppColors.white));
  static final darkTheme = ThemeData(
      indicatorColor: AppColors.white,
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.mediuem14White,
          headlineLarge: AppStyles.mediuem20White),
      appBarTheme:
          AppBarTheme(centerTitle: true, backgroundColor: AppColors.black));
}
