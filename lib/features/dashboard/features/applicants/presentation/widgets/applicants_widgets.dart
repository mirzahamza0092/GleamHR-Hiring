import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class ApplicantsWidget extends StatelessWidget {
  String title,time,location,departement,status;
  var onPress;
  double rating;
  ApplicantsWidget({required this.title,
  required this.time,required this.location,required this.departement,required this.status,
  required this.onPress,required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    onTap: onPress,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonTextPoppins(text: title,talign: TextAlign.left, fontweight: FontWeight.w500, fontsize: 14, color: AppColors.textColor),
        CommonTextPoppins(text: departement,talign: TextAlign.left, fontweight: FontWeight.w500, fontsize: 12, color: AppColors.textColor),
      ],
    ),
    trailing: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RatingStars(starCount: 5,
        value: rating
        ,starSpacing: 1,
         starColor: AppColors.ratingColor,
         starOffColor: AppColors.unratingColor,
         valueLabelVisibility: false),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 10,height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),),
            9.sw,
            CommonTextPoppins(text: status, fontweight: FontWeight.w500, fontsize: 12, color: AppColors.primaryColor)
          ],
        ),
      ],
    ),
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