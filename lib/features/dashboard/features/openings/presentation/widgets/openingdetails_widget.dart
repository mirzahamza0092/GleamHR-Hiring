import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class OpeningDetailsWidget extends StatelessWidget {
  String title,time,location,timeago;
  var onPress;
  OpeningDetailsWidget({required this.title,required this.time,required this.location,required this.timeago,required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    onTap: onPress,
    title: CommonTextPoppins(text: title,talign: TextAlign.left, fontweight: FontWeight.w600, fontsize: 14, color: AppColors.textColor),
    trailing: CommonTextPoppins(text: timeago,talign: TextAlign.left, fontweight: FontWeight.w300, fontsize: 11, color: AppColors.hintTextColor),
    subtitle: Column(
    mainAxisSize: MainAxisSize.min, 
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonTextPoppins(text: time,talign: TextAlign.left, fontweight: FontWeight.w400, fontsize: 12, color: AppColors.hintTextColor),
      CommonTextPoppins(text: location,talign: TextAlign.left, fontweight: FontWeight.w400, fontsize: 12, color: AppColors.hintTextColor),
    ],),
    );
  }
}