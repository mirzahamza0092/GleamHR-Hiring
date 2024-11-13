import 'package:flutter/material.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/logout/data/logout_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LogoutProvider extends ChangeNotifier {
  bool isLoading = false;

  hitLogout(BuildContext context) async {
    try {
      if (await checkinternetconnection()) {
        isLoading = true;
        notifyListeners();
        await LogoutService.logout(context: context);
        isLoading = false;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      print(exception.toString());
      isLoading = false;
      notifyListeners();
    }
  }
}
