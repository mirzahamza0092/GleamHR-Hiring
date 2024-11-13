import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: horizontalgradientwidget,
        ),
      ),
      leading: GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Icon(Icons.menu, color: AppColors.whiteColor)),
      toolbarHeight: 100,
      backgroundColor: AppColors.primaryColor,
      // actions: [SvgPicture.asset(Iconss.searchicon,color: AppColors.whiteColor,),20.sw],
      title: CommonTextPoppins(
          text: "GleamHR Hiring",
          fontweight: FontWeight.w500,
          fontsize: 18.0,
          color: AppColors.whiteColor),
    );
  }
}
