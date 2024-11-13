import 'package:flutter/material.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:provider/provider.dart';
import '../themes/colors.dart';

class DateInputField extends StatefulWidget {
  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (context, dashBoardProvider, child) {
        return TextFormField(
      readOnly: true,
      onTap: () => dashBoardProvider.selectDate(context),
      decoration: InputDecoration(
      hintText: context.read<DashBoardProvider>().selectedDate=="null"?"Select Date":context.read<DashBoardProvider>().selectedDate.toString(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 24,top: 15),
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor),
            filled: true,
        fillColor: AppColors.primaryColor.withOpacity(.1),
        //labelText: 'Select Date',
        suffixIcon: InkWell(
          onTap: () => dashBoardProvider.selectDate(context),
          child: Icon(Icons.calendar_today),
        ),
      ),
    );
      });
  }
}

