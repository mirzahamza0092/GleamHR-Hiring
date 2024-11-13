import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DomainVerificationService {
  static Future verifyDomain({
    required String domainName,
    required BuildContext context,
  }) async {
    try {
      var request;
      if (domainName == 'staging') {
        request = http.MultipartRequest(
            'POST', Uri.parse('https://staging$domainUrl'));
        request.fields.addAll({'domain': 'staging.gleamhrm.com'});
      } else {
        request = http.MultipartRequest(
            'POST', Uri.parse('https://backend$domainUrl'));
        request.fields.addAll({'domain': '$domainName.gleamhrm.com'});
      }
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map mapBody = jsonDecode(responseBody);
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString("Appconstants.domain", domainName);
      if (response.statusCode == 200) {
        Appconstants.domain=prefs.getString("Appconstants.domain");
        return mapBody;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(mapBody["message"].toString()));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(exception.toString()));
      print(exception);
    }
  }
}
