import 'package:flutter/material.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gleamhiring/features/dashboard/presentation/widgets/switchbutton.dart';
import 'package:provider/provider.dart';

class DashBoardSwitchers extends StatelessWidget {
  const DashBoardSwitchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (context, dashboardProvider, child) {
        return Row(children: [
    Expanded(child: SwitchButton(onPressed: (){
      dashboardProvider.changeActivated(1);
    }, width: width(context), text: "Openings",isactivated:  dashboardProvider.getActivated()==2?false:true,height: 36,)),
    7.sw,
    Expanded(child: SwitchButton(onPressed: (){
      dashboardProvider.changeActivated(2);
      }, width: width(context), text: "Applicants",isactivated: dashboardProvider.getActivated()==1?false:true,height: 36,)),
    ],);
      },
    );
  }
}