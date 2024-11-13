import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget applicantHistoryWidget({
  required String icon,
  required String title,
  required String subtitle,
  required String date,
  required double star,
}) {
  return Row(
    children: [
      Container(
        width: 53,
        height: 53,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.fillColor,
            border:
                Border.all(color: AppColors.hintTextColor.withOpacity(.10))),
        child: Center(child: SvgPicture.asset(icon, width: 25, height: 25)),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextPoppins(
                      text: title,
                      fontweight: FontWeight.w400,
                      fontsize: 14,
                      color: AppColors.blackColor),
                  RatingStars(
                      starCount: 5,
                      value: star,
                      starSpacing: 1,
                      starColor: AppColors.ratingColor,
                      starOffColor: AppColors.unratingColor,
                      valueLabelVisibility: false),
                ],
              ),
              CommonTextPoppins(
                  text: "Set by: "+subtitle,
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                  color: AppColors.hintTextColor),
              CommonTextPoppins(
                  text: date,
                  fontweight: FontWeight.w400,
                  fontsize: 11,
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    ],
  );
}
