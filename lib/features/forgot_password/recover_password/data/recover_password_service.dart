// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecoverPasswordService {
  static Future recoverPassword({
    required BuildContext context,
    required String emailorusername,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      var request = http.MultipartRequest(
          'POST', Uri.parse("${domainurl}reset-password/otp"));
      request.fields.addAll({'official_email': emailorusername});

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map mapBody = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        return mapBody;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(mapBody["message"].toString()));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      log(exception.toString());
    }
  }
}
