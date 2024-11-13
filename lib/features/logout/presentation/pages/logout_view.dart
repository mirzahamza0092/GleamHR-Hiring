
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/dialoge/logoutdialog.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import '../../../../core/widgets/text.dart';

Align logoutView(BuildContext context) {
  return Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              onTap: ()async{
              await logoutDialog(context: context);
              },
                  leading: SvgPicture.asset(Iconss.logouticon),
                  title: CommonTextPoppins(text: "Logout",talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 16, color: AppColors.redColor),),
          );
}