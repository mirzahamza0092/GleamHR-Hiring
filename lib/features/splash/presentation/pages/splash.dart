import 'dart:async';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool("bioPermissionEnabled") == true) {
        context.read<DashBoardProvider>().changeBioMetricStatus(true);
      }
      if (prefs.getString("Appconstants.domain").toString() != "null") {
      Appconstants.domain=prefs.getString("Appconstants.domain");
      }
      Appconstants.token = prefs.getString("token").toString();
      if ((Appconstants.token.toString() == "" ||
              Appconstants.token == "null") &&
          (prefs.getString("domainUrl") == null ||
              prefs.getString("domainUrl") == "")) {
        Navigator.of(context).pushReplacementNamed(route.domainscreen);
      } else if (Appconstants.token.toString() == "" ||
          Appconstants.token == "null") {
        Navigator.of(context).pushReplacementNamed(route.login);
      } else {
        //dashboard
        Navigator.of(context).pushReplacementNamed(route.login);
        }
    });

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        decoration: BoxDecoration(gradient: horizontalgradientwidget),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:const EdgeInsets.only(top: 28.0),
                  child:SvgPicture.asset('assets/logo_name_white.svg'),
                ),
              )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonTextPoppins(
                              text: 'from',
                              fontsize: 14.0,
                              color: AppColors.whiteColor,
                              fontweight: FontWeight.w400,
                            ),
                            //SvgPicture.asset('assets/glowlogix_white.png'),
                            const Image(
                                image:
                                    AssetImage('assets/glowlogix_white.png')),
                          ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
