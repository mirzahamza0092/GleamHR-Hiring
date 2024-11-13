//Applicant Notes Comment Widget
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/cache_network_image.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget ApplicantCommentWidget(
    {required String imagepath,
    required String name,
    required String description,
    required String date,
    required BuildContext context}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsetsDirectional.only(bottom: 21),
        child: commonCacheImage(imagepath: imagepath,height: 56,width: 53)),
      10.sw,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextPoppins(
                text: name,
                fontweight: FontWeight.w500,
                fontsize: 16,
                talign: TextAlign.left,
                color: AppColors.textColor),
            CommonTextPoppins(
                text: description,
                fontweight: FontWeight.w400,
                talign: TextAlign.left,
                fontsize: 12,
                color: AppColors.hintTextColor),
            CommonTextPoppins(
                text: date,
                fontweight: FontWeight.w400,
                talign: TextAlign.left,
                fontsize: 11,
                color: Colors.grey),
            // 2.sh,
            // Row(
            //   children: [
            //     SvgPicture.asset(Iconss.replayicon, width: 16, height: 13),
            //     5.sw,
            //     CommonTextPoppins(
            //         text: "Reply",
            //         fontweight: FontWeight.w400,
            //         talign: TextAlign.left,
            //         fontsize: 12,
            //         color: AppColors.primaryColor),
            //   ],
            // ),
          ],
        ),
      )
    ],
  );
}
