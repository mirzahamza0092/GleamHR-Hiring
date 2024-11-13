import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/cache_network_image.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget applicantInfoListTile({
  required String imagepath,
  required String name,
  required String location,
  required String appliedTime,
}) {
  return ListTile(
    shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
    tileColor: AppColors.dashboardUnselectedColor,
    leading: commonCacheImage(imagepath: imagepath,height: 50,width: 50),
    title: CommonTextPoppins(
        text: name,
        fontweight: FontWeight.w500,
        fontsize: 17,
        talign: TextAlign.left,
        color: AppColors.textColor),
    subtitle: CommonTextPoppins(
        text: location,
        fontweight: FontWeight.w400,
        talign: TextAlign.left,
        fontsize: 12,
        color: AppColors.hintTextColor),
    trailing: CommonTextPoppins(
        text: appliedTime,
        fontweight: FontWeight.w300,
        fontsize: 11,
        color: AppColors.hintTextColor),
  );
}
