import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/login/presentation/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordService {
  static Future resetPassword(
      {required BuildContext context,
      required String emailorusername,
      required String token,
      required String password,
      required String confirmPassword}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      var request = http.MultipartRequest(
          'POST', Uri.parse("${domainurl}reset-password/update"));
      request.fields.addAll({
        'official_email': emailorusername,
        'token': token,
        'password': password,
        'password_confirmation': confirmPassword
      });

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map mapBody = jsonDecode(responseBody);
      if (response.statusCode == 401) {
        return mapBody;
      } else if (mapBody["message"].toString() == "Request Time Out") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(mapBody["message"].toString()));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      print(exception);
    }
  }
}
