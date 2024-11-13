import 'package:flutter/material.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicantsdetails_provider.dart';
import 'package:gleamhiring/features/dashboard/presentation/widgets/switchbutton.dart';
import 'package:provider/provider.dart';

class ApplicantSwitchers extends StatelessWidget {
  const ApplicantSwitchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicantsDetailsProvider>(
      builder: (context, dashboardProvider, child) {
        return Row(
          children: [
            Expanded(
                child: SwitchButton(
              onPressed: () {
                dashboardProvider.changeActivated(1);
              },
              width: width(context),
              text: "Info",
              isactivated: dashboardProvider.getActivated() == 2 ||
                      dashboardProvider.getActivated() == 3
                  ? false
                  : true,
              height: 36,
            )),
            7.sw,
            Expanded(
                child: SwitchButton(
              onPressed: () {
                dashboardProvider.changeActivated(2);
              },
              width: width(context),
              text: "Notes",
              isactivated: dashboardProvider.getActivated() == 1 ||
                      dashboardProvider.getActivated() == 3
                  ? false
                  : true,
              height: 36,
            )),
            // 7.sw,
            // Expanded(
            //     child: SwitchButton(
            //   onPressed: () {
            //     dashboardProvider.changeActivated(3);
            //   },
            //   width: width(context),
            //   text: "Email",
            //   isactivated: dashboardProvider.getActivated() == 1 ||
            //           dashboardProvider.getActivated() == 2
            //       ? false
            //       : true,
            //   height: 36,
            // )),
          ],
        );
      },
    );
  }
}
