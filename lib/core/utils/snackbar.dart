import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';

SnackBar appSnackBar(String message) {
  return SnackBar(
          content: Text(message),
          backgroundColor: AppColors.primaryColor,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
        );
}
          

          