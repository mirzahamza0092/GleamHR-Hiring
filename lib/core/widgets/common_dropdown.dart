import 'package:flutter/material.dart';
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
      height: 50,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: Colors.black54,
          // ),
          color: AppColors.fillColor),
      child: Center(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          //elevation: 8,
          isExpanded: true,
          value: selectedText,
          underline: const Text(""),
          items: List.generate(listItem.length, (index) {
            return DropdownMenuItem<String>(
              value: listItem[index],
              child: CommonTextPoppins(text: listItem[index], fontweight: FontWeight.w400,
               fontsize: 12, color: AppColors.textColor),
            );
          }).toList(),
          onChanged: onchanged,
          selectedItemBuilder: (BuildContext context) {
            return listItem.map<Widget>((String item) {
              return Text(item);
            }).toList();
          },
        ),
      ),
    );
 }
}

class CommonDropDown2 extends StatelessWidget {
  String selectedText = '';
  List<String> listItem = [];
  var onchanged;
  double width;

  CommonDropDown2({
    super.key,
    required this.width,
    required this.selectedText,
    required this.listItem,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: Colors.black54,
          // ),
          color: AppColors.primaryColor.withOpacity(.1)),
      child: Center(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          //elevation: 8,
          isExpanded: true,
          value: selectedText,
          underline: const Text(""),
          items: List.generate(listItem.length, (index) {
            return DropdownMenuItem<String>(
              value: listItem[index],
              child: CommonTextPoppins(text: listItem[index], fontweight: FontWeight.w400,
               fontsize: 12, color: AppColors.hintTextColor),
            );
          }).toList(),
          onChanged: onchanged,
          selectedItemBuilder: (BuildContext context) {
            return listItem.map<Widget>((String item) {
              return Text(item);
            }).toList();
          },
        ),
      ),
    );
 }
}
