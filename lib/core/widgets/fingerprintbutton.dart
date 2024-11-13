import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class ThumbButton extends StatelessWidget {
  String text;
  var ontap;
  ThumbButton({
    required this.text,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: ElevatedButton(
          onPressed: ontap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppColors.whiteColor),
            minimumSize: const MaterialStatePropertyAll<Size>(
                Size(double.infinity, 55.0)),
            side: MaterialStateBorderSide.resolveWith(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return BorderSide(color: AppColors.textColor);
              }
              return BorderSide(color: AppColors.textColor);
            }),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextPoppins(
                    text: text,
                    fontweight: FontWeight.w400,
                    fontsize: 16,
                    color: AppColors.textColor),
                SvgPicture.asset(
                  Iconss.thumbicon,
                  color: AppColors.textColor,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}