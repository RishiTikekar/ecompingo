import 'package:ecommerce/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData appThemeData = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: const WidgetStatePropertyAll(
          AppColors.blue,
        ),
        textStyle: const WidgetStatePropertyAll(
          AppTextStyle.t_16_700,
        ),
        foregroundColor: const WidgetStatePropertyAll(
          AppColors.white,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 13, horizontal: 86),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 14,
      ),
      labelStyle: AppTextStyle.t_14_400,
      fillColor: AppColors.white,
      filled: true,
      border: textfieldBorder,
      errorBorder: textfieldBorder,
      enabledBorder: textfieldBorder,
      focusedBorder: textfieldBorder,
      disabledBorder: textfieldBorder,
      focusedErrorBorder: textfieldBorder,
    ),
  );

  static InputBorder textfieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.white),
  );
}
