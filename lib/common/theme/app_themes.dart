import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/theme/text_style.dart';
import 'package:flutter/material.dart';


class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.Maincolorlightmode,
      brightness: Brightness.light,
      inversePrimary: AppColor.Maincolorlightmode,
    ),
    primaryColor: AppColor.Maincolorlightmode,
    dividerColor: AppColor.Strokelightmode,
    cardColor: AppColor.Inputslightmode,
    disabledColor: AppColor.Disablelightmode,
    hintColor: AppColor.Sectextlightmode,
    scaffoldBackgroundColor: AppColor.Bglightmode,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.Bglightmode,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.style18w500black.copyWith(
        color: AppColor.Maintextlightmode,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppTextStyle.style12w400black.copyWith(
        color: AppColor.Maincolorlightmode,
      ),
      selectedItemColor: AppColor.Maincolorlightmode,
      unselectedLabelStyle: AppTextStyle.style12w400black.copyWith(
        color: AppColor.Disablelightmode,
      ),
      unselectedItemColor: AppColor.Disablelightmode,
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: AppColor.Strokelightmode),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColor.Maincolorlightmode,
        ),
      ),
    ),

    textTheme: _genrateTextTheme(AppColor.Maintextlightmode),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.Maincolorlightmode),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.MaincolorDarkmode,
      brightness: Brightness.dark,
      inversePrimary: AppColor.MaincolorDarkmode,
    ),
    primaryColor: AppColor.MaincolorDarkmode,
    dividerColor: AppColor.StrokeDarkmode,
    cardColor: AppColor.InputsDarkmode,
    disabledColor: AppColor.DisableDarkmode,
    hintColor: AppColor.SectextDarkmode,
    scaffoldBackgroundColor: AppColor.BgDarkmode,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.BgDarkmode,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.style18w500black.copyWith(
        color: AppColor.MaintextDarkmode,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppTextStyle.style12w400black.copyWith(
        color: AppColor.MaincolorDarkmode,
      ),
      selectedItemColor: AppColor.MaincolorDarkmode,
      unselectedLabelStyle: AppTextStyle.style12w400black.copyWith(
        color: AppColor.DisableDarkmode,
      ),
      unselectedItemColor: AppColor.DisableDarkmode,
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.InputsDarkmode,
          border: Border.all(color: AppColor.SectextDarkmode),
        ),
        child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      ),
    ),

    textTheme: _genrateTextTheme(AppColor.MaintextDarkmode),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.MaincolorDarkmode),
    ),
  );

  static TextTheme _genrateTextTheme(Color color) {
    return TextTheme(
      displayLarge: AppTextStyle.style24w600black.copyWith(color: color),
      displayMedium: AppTextStyle.style20w600black.copyWith(color: color),
      displaySmall: AppTextStyle.style20w500black.copyWith(color: color),
      headlineLarge: AppTextStyle.style18w600black.copyWith(color: color),
      headlineMedium: AppTextStyle.style18w500black.copyWith(color: color),
      headlineSmall: AppTextStyle.style18w400black.copyWith(color: color),

      titleLarge: AppTextStyle.style16w600black.copyWith(color: color),
      titleMedium: AppTextStyle.style16w500black.copyWith(color: color),
      titleSmall: AppTextStyle.style16w400black.copyWith(color: color),

      labelLarge: AppTextStyle.style14w600black.copyWith(color: color),
      labelMedium: AppTextStyle.style14w500black.copyWith(color: color),
      labelSmall: AppTextStyle.style14w400black.copyWith(color: color),

      bodyLarge: AppTextStyle.style12w600black.copyWith(color: color),
      bodyMedium: AppTextStyle.style12w500black.copyWith(color: color),
      bodySmall: AppTextStyle.style12w400black.copyWith(color: color),
    );
  }
}
