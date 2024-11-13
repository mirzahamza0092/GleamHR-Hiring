import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/domain/data/services/domainverification_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DomainScreenProvider extends ChangeNotifier {
  TextEditingController domain = TextEditingController();
  GlobalKey<FormState> domainScreenFormKey = GlobalKey();
  bool isLoading = false;
  bool domainEntered = false;
  
  isDomainEntered(bool val) {
    domainEntered = val;
    notifyListeners();
  }

  enterDomain(BuildContext context) async {
    if (domainScreenFormKey.currentState!.validate() && domainEntered == false) {
      try {
        if (await checkinternetconnection()) {
          isLoading = true;
          notifyListeners();
          var response = await DomainVerificationService.verifyDomain(
              domainName: domain.text.trim(), context: context);
          if (response["success"].toString() == "1") {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("domainUrl",
                "https://${domain.text.trim()}.gleamhrm.com/api/v1/hiring/");
            await prefs.setString("domainName", domain.text.trim());
            domainName = prefs.getString("domainName")!;
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Domain Entered Successfully"));
            isLoading = false;
            notifyListeners();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(route.login, (route) => false);
            //Navigator.of(context).pushNamed(route.login);
            domain.clear();
          } else {
            isLoading = false;
            notifyListeners();
          }
        } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
          notifyListeners();
        }
      } catch (exception) {
        await Sentry.captureException(exception);
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
