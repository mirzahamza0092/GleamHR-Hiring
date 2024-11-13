import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

Widget candidateInfoTile({
  required String title,
  required String subtitle,
  required String icon,
  required var ontap,
}) {
  return ListTile(
    onTap: ontap,
    title: CommonTextPoppins(
        text: title,
        fontweight: FontWeight.w500,
        fontsize: 14,
        talign: TextAlign.left,
        color: AppColors.textColor),
    subtitle: CommonTextPoppins(
        text: subtitle,
        fontweight: FontWeight.w400,
        talign: TextAlign.left,
        fontsize: 12,
        color: AppColors.hintTextColor),
    trailing: SvgPicture.asset(icon, width: 18, height: 18),
  );
}
