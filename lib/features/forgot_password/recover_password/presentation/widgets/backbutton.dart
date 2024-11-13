import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class OutlineButton extends StatelessWidget {
  String text;
  OutlineButton({
    required this.text,
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppColors.whiteColor),
            minimumSize: const MaterialStatePropertyAll<Size>(
                Size(double.infinity, 50.0)),
            side: MaterialStateBorderSide.resolveWith(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return BorderSide(color: AppColors.primaryColor);
              }
              return BorderSide(color: AppColors.primaryColor);
            }),
          ),
          child: CommonTextPoppins(
              text: text,
              fontweight: FontWeight.w500,
              fontsize: 16,
              color: AppColors.primaryColor)),
    );
  }
}