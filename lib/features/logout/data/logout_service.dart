import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutService {
  static Future logout({
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      var headers = {'Authorization': 'Bearer ${prefs.getString("token")}'};
      var request =
          http.MultipartRequest('POST', Uri.parse("${domainurl}logout"));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        if (responseBody == '"Unauthenticated."') {
          ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Session Expire"));
          Navigator.of(context)
              .pushNamedAndRemoveUntil(route.login, (Route route) => false);
          SessionTimer.stop();
          SessionTimer.reset();
          return true;
        } else {
          Map mapBody = jsonDecode(responseBody);
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(mapBody["message"].toString()));
          Navigator.of(context)
              .pushNamedAndRemoveUntil(route.login, (Route route) => false);
          SessionTimer.stop();
          SessionTimer.reset();
          return true;
        }
      } else {
        return false;
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      log(exception.toString());
    }
  }
}
