import 'package:flutter/material.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/data/recover_password_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController nameoremail = TextEditingController();
  GlobalKey<FormState> forgetPasswordkey = GlobalKey();
  bool isloading = false;

  hitRecoverPassword(BuildContext context) async {
    if (forgetPasswordkey.currentState!.validate()) {
      try {
        if (await checkinternetconnection()) {
          isloading = true;
          notifyListeners();
          var res = await RecoverPasswordService.recoverPassword(
              context: context, emailorusername: nameoremail.text);
          if (res != null) {
            if (res["success"].toString() == "1") {
              Navigator.of(context).pushNamed(route.verifypassword);
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