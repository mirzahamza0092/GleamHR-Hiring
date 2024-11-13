import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget documentTile(
    {required String leadingImagePath,
    required String filetype,
    required String title,
    required var viewontap,
    required var downloadontap,
    required bool downloadedNeeded,
    required bool viewNeeded,
    String percentage = ""}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      tileColor: AppColors.dashboardUnselectedColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      leading: filetype == ".png"
          ? Image.asset(
              leadingImagePath,
              width: 24,
              height: 24,
            )
          : SvgPicture.asset(
              leadingImagePath,
              width: 24,
              height: 24,
            ),
      title: CommonTextPoppins(
          text: title,
          fontweight: FontWeight.w400,
          fontsize: 14,
          talign: TextAlign.left,
          color: AppColors.textColor),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          downloadedNeeded
              ? InkWell(
                  onTap: downloadontap,
                  child: Icon(
                    CupertinoIcons.arrow_down_to_line,
                    color: Color(0XFF387995),
                  ))
              : SizedBox(),
          20.sw,
          viewNeeded
              ? InkWell(
                  onTap: viewontap,
                  child: Icon(
                    Icons.visibility_outlined,
                    color: Color(0XFF387995),
                  ))
              : SizedBox(),
          percentage != ""
              ? CommonTextPoppins(
                  text: percentage,
                  fontweight: FontWeight.w600,
                  fontsize: 14,
                  color: AppColors.blackColor,
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}
