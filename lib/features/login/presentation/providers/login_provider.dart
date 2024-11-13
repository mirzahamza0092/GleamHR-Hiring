import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/providers/openings_providers.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/login_model.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/module_model.dart';
import 'package:gleamhiring/features/login/data/services/checkmodule_service.dart';
import 'package:gleamhiring/features/login/data/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;

class LoginScreenProvider extends ChangeNotifier {
  TextEditingController nameoremail = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false, visibility = true;
  String? bioPermissionEnabled, bioMetricEnabled;

  getBioEnabledValues() async {
    // getting the value of bio metric enabled
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bioPermissionEnabled = prefs.getBool("bioPermissionEnabled").toString();
    bioMetricEnabled = prefs.getBool("bioMetricEnabled").toString();
    notifyListeners();
  }

  biometric(BuildContext context, bool isShowDialog) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getBool("bioMetricEnabled").toString());
      if (prefs.getBool("bioMetricEnabled") == null ||
          prefs.getBool("bioMetricEnabled") == false) {
        bool isauthenticate = await userAuthorization(reason: "Please Authenticate");
        if (isauthenticate) {
        context.read<DashBoardProvider>().changeBioMetricStatus(true);
        getBioEnabledValues();
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            title: CommonTextPoppins(text: 'You have to enter credentials first time when login', fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('OK'),
              ),
            ],
          ),
        );
        }
        }
      if (prefs.getBool("bioMetricEnabled") == true) {
        bool authenticated = await userAuthorization(reason: "For Login");
        print("Status: $authenticated");
        if (authenticated) {
          hitLogin(context, prefs.getString("username").toString(),
              prefs.getString("password").toString());
        }
      } else {
        print(prefs.getBool("enabledBioMetric"));
      }
    } on PlatformException catch (exception) {
      await Sentry.captureException(exception);
      print(exception);
    }
    
  }

  changeVisibility() {
    //change visibility of login page password
    visibility = !visibility;
    notifyListeners();
  }

  hitLogin(BuildContext context, String nameoremail, String password) async {
    try {
      if (await checkinternetconnection()) {
        isLoading = true;
        notifyListeners();
        var res = await ModulesService.activeModulesList(context: context);
        if (res is ModuleModel) {
          Appconstants.modulelistResponse = res;
        }
        var response = await LoginScreenService.login(
            emailOrUsername: nameoremail, password: password, context: context);
        if (response is LoginModel) {
          Appconstants.loginResponse=response;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", response.accessToken.toString());
          await prefs.setString("username", nameoremail.toString());
          await prefs.setString("password", password.toString());
          if (prefs.getBool("bioPermissionEnabled") == true) {
           context.read<DashBoardProvider>().changeBioMetricStatus(true); 
           await prefs.setBool("bioMetricEnabled", true);
          }
          //for storing response
          // await prefs.setString(
          //     "loginres", loginModelToJson(res));
          // Appconstants.loginResponse = loginModelFromJson(
          //     prefs.getString("loginres").toString());
            //get all job openings and create data
            await context.read<OpeningsProvider>().getAllJobOpenings(context: context,pageincrement: false);
            await context.read<DashBoardProvider>().getAllJobCreateData(context: context);
            await context.read<DashBoardProvider>().addpositionList();
            await context.read<DashBoardProvider>().addDesiredLocationList();
            await context.read<DashBoardProvider>().addDesiredDepartmentList();
            await context.read<DashBoardProvider>().addDesiredHiringLeadList();
            await context.read<DashBoardProvider>().addDesiredDivisonList();
            await context.read<DashBoardProvider>().addDesiredDesignationList();
            await context.read<DashBoardProvider>().addDesiredEmploymentStatusList();
            //
            isLoading = false;
            notifyListeners();
            if(Appconstants.modulelistResponse!.data![5].status.toString()=="1"){
            ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Login Successful"));
            SessionTimer.startDisplayingTime(context);
            Navigator.of(context).pushNamedAndRemoveUntil(
                route.dashboard, (Route route) => false);
                this.nameoremail.clear();
            this.password.clear();
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(appSnackBar("You don't have permission! Please contact to administrator"));
                }
          } else {
            isLoading = false;
            notifyListeners();
          }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {await Sentry.captureException(exception);
      print(exception.toString());
      isLoading = false;
      notifyListeners();
    }
}
}