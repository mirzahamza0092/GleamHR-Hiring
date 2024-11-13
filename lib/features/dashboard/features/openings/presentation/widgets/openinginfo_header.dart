import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class OpeninginfoHeader extends StatelessWidget {
  String title, status, location, timeago;
  OpeninginfoHeader(
      {required this.title,
      required this.status,
      required this.location,
      required this.timeago,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: CommonTextPoppins(
                text: title,
                talign: TextAlign.left,
                textOverflow: TextOverflow.ellipsis,
                fontweight: FontWeight.w600,
                fontsize: 16,
                color: AppColors.textColor),
            trailing: CommonTextPoppins(
                text: "posted " + timeago,
                talign: TextAlign.left,
                fontweight: FontWeight.w300,
                fontsize: 11,
                color: AppColors.hintTextColor),
            subtitle: CommonTextPoppins(
                text: status,
                talign: TextAlign.left,
                fontweight: FontWeight.w400,
                fontsize: 14,
                color: AppColors.hintTextColor),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading:
                SvgPicture.asset(Iconss.locationicon, width: 18, height: 18),
            title: CommonTextPoppins(
                text: location,
                talign: TextAlign.left,
                textOverflow: TextOverflow.ellipsis,
                fontweight: FontWeight.w400,
                fontsize: 14,
                color: AppColors.hintTextColor),
          ),
        ],
      ),
    );
  }
}
