import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class CommonButton extends StatelessWidget {
  var onPressed;
  double width;
  String text;
  bool shadowneeded;
  CommonButton({
    required this.onPressed,
    required this.width,
    required this.text,
    this.shadowneeded = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: shadowneeded
              ? [
                  BoxShadow(
                      color: AppColors.primaryColor,
                      offset: const Offset(1, 3),
                      blurRadius: 10,
                      spreadRadius: 0),
                ]
              : [],
          borderRadius: BorderRadius.circular(8),
          gradient: horizontalgradientwidget),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: Size(width, 55.0)),
          child: CommonTextPoppins(
              text: text,
              fontweight: FontWeight.w600,
              fontsize: 16.0,
              color: AppColors.whiteColor)),
    );
  }
}