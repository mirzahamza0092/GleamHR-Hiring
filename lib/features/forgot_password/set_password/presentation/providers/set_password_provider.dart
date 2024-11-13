import 'package:flutter/material.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/providers/forgot_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/set_password/data/set_password_service.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;

class SetPasswordProvider extends ChangeNotifier {
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> setPasswordKey = GlobalKey();

  bool isloading = false;
  hitResetPassword(BuildContext context) async {
    if (setPasswordKey.currentState!.validate()) {
      try {
        if (await checkinternetconnection()) {
          isloading = true;
          notifyListeners();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var res = await ChangePasswordService.resetPassword(
              context: context,
              emailorusername:
                  context.read<ForgotPasswordProvider>().nameoremail.text,
              token: prefs.getString("token")!,
              password: password.text,
              confirmPassword: confirmPassword.text);
          if (res != null) {
            if (res["success"].toString() == "1") {
              password.clear();
              confirmPassword.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(route.login, (Route route) => false);
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(res["message"].toString()));
              isloading = false;
              prefs.setBool("bioPermissionEnabled", false);
              prefs.setBool("bioMetricEnabled", false);
              notifyListeners();
            } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(res["message"].toString()));
              isloading = false;
              notifyListeners();
            }
          } else {
            isloading = false;
            notifyListeners();
          }
        } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
          notifyListeners();
        }
      } catch (exception) {
        await Sentry.captureException(exception);
        isloading = false;
        notifyListeners();
        print(exception.toString());
      }
    }
  }
}
