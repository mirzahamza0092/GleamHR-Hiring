import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class OpeningWidget extends StatelessWidget {
  String title,location,enteriescount;
  var onPress;
  String time;
  OpeningWidget({required this.title,required this.time,required this.location,required this.enteriescount,required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    onTap: onPress,
    title: CommonTextPoppins(text: title,talign: TextAlign.left, fontweight: FontWeight.w600, fontsize: 14, color: AppColors.textColor),
    trailing: Container(width: 25,height: 25,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: AppColors.primaryColor),
    child: Center(child: CommonTextPoppins(text: enteriescount, fontweight: FontWeight.w400, fontsize: 13, color: AppColors.whiteColor)),),
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