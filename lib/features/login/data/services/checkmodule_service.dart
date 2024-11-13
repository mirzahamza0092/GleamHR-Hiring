import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/module_model.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModulesService {
  static Future activeModulesList({
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      String domainurl = prefs.getString("domainUrl").toString();
      var headers = {'Authorization': 'Bearer $token'};
      var request =
          http.Request('GET', Uri.parse("https://${Appconstants.domain}.gleamhrm.com/api/v1/active_modules_list"));
      // var request =
      //     http.Request('GET', Uri.parse("${domainurl}active_modules_list"));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return moduleModelFromJson(responseBody);
      } else {
        Map mapBody = jsonDecode(responseBody);
      }
    } catch (exception) {await Sentry.captureException(exception);
      // Fluttertoast.showToast(
      //     msg: e.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      print(exception);
    }
  }
}