import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/cache_network_image.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget openingInfoHiringMan(
    {required String imagepath,
    required String name,
    required String designation,
    required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 15, // Blur radius
            offset: Offset(0, 3), // Offset in the x, y direction
          ),
        ]),
    child: ListTile(
      tileColor: AppColors.dashboardUnselectedColor,
      leading: commonCacheImage(imagepath: imagepath,height: 50,width: 50),
      title: CommonTextPoppins(
          text: name,
          fontweight: FontWeight.w500,
          fontsize: 16,
          talign: TextAlign.left,
          color: AppColors.textColor),
      subtitle: CommonTextPoppins(
          text: designation,
          fontweight: FontWeight.w400,
          talign: TextAlign.left,
          fontsize: 12,
          color: AppColors.hintTextColor),
    ),
  );
}
