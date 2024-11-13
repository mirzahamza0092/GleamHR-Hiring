import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class SwitchButton extends StatelessWidget {
  var onPressed;
  double width, height;
  String text;
  bool shadowneeded, isactivated;
  SwitchButton({
    required this.onPressed,
    required this.width,
    required this.height,
    required this.text,
    this.shadowneeded = false,
    required this.isactivated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isactivated ? AppColors.primaryColor : AppColors.fillColor,
          boxShadow: shadowneeded
              ? [
                  BoxShadow(
                      color: AppColors.primaryColor,
                      offset: const Offset(1, 3),
                      blurRadius: 10,
                      spreadRadius: 0),
                ]
              : [],
          borderRadius: BorderRadius.circular(8)),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: CommonTextPoppins(
              text: text,
              fontweight: FontWeight.w500,
              fontsize: 14.0,
              color: isactivated
                  ? AppColors.whiteColor
                  : AppColors.hintTextColor)),
    );
  }
}

class NotesSwitchButton extends StatelessWidget {
  var onPressed;
  double width, height;
  String text;
  bool shadowneeded, isactivated;
  NotesSwitchButton({
    required this.onPressed,
    required this.width,
    required this.height,
    required this.text,
    this.shadowneeded = false,
    required this.isactivated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
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
          color: isactivated ? AppColors.fillColor : AppColors.whiteColor,
          border: Border(
              bottom: BorderSide(
            color: isactivated ? AppColors.primaryColor : AppColors.whiteColor,
          )),
        ),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: CommonTextPoppins(
              text: text,
              fontweight: FontWeight.w500,
              fontsize: 14.0,
              color: isactivated
                  ? AppColors.primaryColor
                  : AppColors.hintTextColor,
            )),
      ),
    );
  }
}
