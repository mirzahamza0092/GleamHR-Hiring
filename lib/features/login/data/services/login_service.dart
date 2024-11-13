import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenService {
  static Future login({
    required String emailOrUsername,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // await firebasegetfcmtoken();
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      var request =
          http.MultipartRequest('POST', Uri.parse("${domainurl}login"));
      request.fields.addAll({
        'official_email': emailOrUsername,
        'password': password,
        'player_id': '123456',//Appconstants.playerId,
      });
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map mapBody = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        return loginModelFromJson(responseBody);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar(mapBody["message"].toString()));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      log(exception.toString());
    }
  }
}
