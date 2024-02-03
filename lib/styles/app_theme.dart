import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/styles/app_color.dart';
import 'package:store_app/styles/app_text.dart';

class AppTheme {
  //
  // Light Theme
  //
  static ThemeData lightTheme = ThemeData(
    //
    // AppBar Theme
    //
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30.r,
      ),
    ),
    //
    // TextStyle Theme
    //
    textTheme: TextTheme(
      titleLarge: AppText.lightTitleLarge,
      titleSmall: AppText.lightTitleSmall,
      bodyMedium: AppText.lightBodyMedium,
      bodySmall: AppText.lightBodySmall,
    ),
    //
    // IconButton Theme
    //
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
          iconSize: 30.r,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h)),
    ),
    //
    // BottomNavigationBarTheme Theme
    //
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
          color: AppColor.selectedBottomNavigationBarColor, size: 30.r),
      unselectedIconTheme: IconThemeData(
          color: AppColor.unSelectedBottomNavigationBarColor, size: 30.r),
      selectedItemColor: AppColor.selectedBottomNavigationBarColor,
      unselectedItemColor: AppColor.unSelectedBottomNavigationBarColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );

  //
  // Dark Theme
  //

  static ThemeData darkTheme = ThemeData(
    //
    // AppBar Theme
    //
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30.r,
      ),
    ),
    //
    // TextStyle Theme
    //
    textTheme: TextTheme(
      titleLarge: AppText.darkTitleLarge,
      titleSmall: AppText.darkTitleSmall,
      bodyMedium: AppText.darkBodyMedium,
      bodySmall: AppText.darkBodySmall,
    ),
    //
    // IconButton Theme
    //
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
          iconSize: 30.r,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h)),
    ),
    //
    // BottomNavigationBarTheme Theme
    //
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
          color: AppColor.selectedBottomNavigationBarColor, size: 30.r),
      unselectedIconTheme: IconThemeData(
          color: AppColor.unSelectedBottomNavigationBarColor, size: 30.r),
      selectedItemColor: AppColor.selectedBottomNavigationBarColor,
      unselectedItemColor: AppColor.unSelectedBottomNavigationBarColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
