import 'package:flutter/material.dart';
import 'package:gleamhiring/core/themes/colors.dart';

class CommonTextField extends StatelessWidget {
  String hinttext;
  bool obsecure, isEditable,showNumber;
  final controller;
  var validator;
  Widget suffixicon;
  TextInputType? keyboardType;
  int maxLine;
  CommonTextField({
    this.controller,
    this.obsecure = false,
    this.validator,
    this.showNumber = false,
    this.isEditable = true,
    this.suffixicon = const SizedBox(),
    required this.hinttext,
    this.maxLine=1,
    keyboardType = TextInputType.none,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      keyboardType:showNumber?TextInputType.numberWithOptions(): keyboardType,
      validator: validator,
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        enabled: isEditable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 24),
        // border: InputBorder.none,
        suffixIcon: suffixicon,
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor),
        filled: true,
        fillColor: AppColors.fillColor,
      ),
      textAlign: TextAlign.left,
    );
  }
}
class CommonTextField2 extends StatelessWidget {
  String hinttext;
  bool obsecure, isEditable,showNumber;
  final controller;
  var validator;
  int maxLine;
  Widget suffixicon;
  TextInputType? keyboardType;
  CommonTextField2({
    this.controller,
    this.obsecure = false,
    this.validator,
    this.showNumber = false,
    this.isEditable = true,
    this.suffixicon = const SizedBox(),
    required this.hinttext,
    this.maxLine=0,
    keyboardType = TextInputType.none,
    super.key,    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:showNumber?TextInputType.numberWithOptions(): keyboardType,
      validator: validator,
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        enabled: isEditable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 24),
        // border: InputBorder.none,
        suffixIcon: suffixicon,
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor),
        filled: true,
        fillColor: AppColors.primaryColor.withOpacity(.1),
      ),
      textAlign: TextAlign.left,
    );
  }
}
