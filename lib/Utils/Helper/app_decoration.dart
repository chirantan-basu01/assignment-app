import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecoration {
  static final AppDecoration _instance = AppDecoration._internal();

  factory AppDecoration() {
    return _instance;
  }

  AppDecoration._internal();

  static InputDecoration sFormField = InputDecoration(
    contentPadding:
        const EdgeInsets.only(left: 18.0, bottom: 12.0, top: 12.0, right: 18),
    filled: true,
    // fillColor: AppColors.colorTextBox,
    errorStyle: const TextStyle(
      color: Colors.red,
      fontFamily: 'Roboto',
      fontSize: 14,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.primaryButtonColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.primaryButtonColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),

    border: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 5),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
    ),

    errorMaxLines: 1,
    floatingLabelStyle: const TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600),
    labelStyle: const TextStyle(
        color: AppColors.primaryButtonColor,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400),
    hintStyle: const TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        height: 0,
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
  );

  static const formFieldDecorationForMultipleLine = InputDecoration(
    hintText: "Hint Here",
    hintStyle: TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(16))),
  );
}
