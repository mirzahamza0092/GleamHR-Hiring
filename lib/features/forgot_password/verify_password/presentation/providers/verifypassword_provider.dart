import 'package:flutter/material.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/providers/forgot_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/verify_password/data/recover_password_service.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPasswordProvider extends ChangeNotifier {
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> verifyPasswordkey = GlobalKey();
  bool isloading = false;

  hitVerifyPassword(BuildContext context) async {
    if (verifyPasswordkey.currentState!.validate()) {
      try {
        if (await checkinternetconnection()) {
          isloading = true;
          notifyListeners();
          var res = await VerifyOtpService.verifyOtp(
              context: context,
              emailorusername:
                  context.read<ForgotPasswordProvider>().nameoremail.text,
              otp: password.text);
          if (res != null) {
            if (res["success"].toString() == "1") {
              password.clear();
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString("token", res["token"].toString());
              Navigator.of(context).pushNamed(route.setpassword);
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(res["message"].toString()));
              
              isloading = false;
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
