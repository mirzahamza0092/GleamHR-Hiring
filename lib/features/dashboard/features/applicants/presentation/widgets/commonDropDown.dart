import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';

class CommonDropDown extends StatelessWidget {
  String selectedText = '';
  List<String> listItem = [];
  var onchanged;
  double width;

  CommonDropDown({
    super.key,
    required this.width,
    required this.selectedText,
    required this.listItem,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: DropdownButton<String>(
        icon: Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: SvgPicture.asset(Iconss.dropDownArrow),
        ),
        itemHeight: 54,
        isExpanded: true,
        value: selectedText,
        underline: const Text(""),
        items: listItem.map((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: value != null && value == selectedText
                        ? AppColors.pageBackgroundColor
                        : AppColors.pageBackgroundColor,
                    width: 1.0,
                  )),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 18),
                      child: CommonTextPoppins(
                          text: value,
                          fontweight: FontWeight.w500,
                          fontsize: 14,
                          color: AppColors.hintTextColor),
                    ),
                  ],
                ),
              ));
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }
}
