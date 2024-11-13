
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gleamhiring/core/themes/colors.dart';

Container openingInfoJobInformation({required String description,required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(14.0),
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 3),
          ),
        ]),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          HtmlWidget('''$description''',textStyle: TextStyle(fontSize: 12),)
        ],
    ));
  }
