import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/datamodels/EachApplicantDetailModel.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetEachApplicantsService {
  static Future geteachapplicant({
    required String applicantId,
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token = prefs.getString("token")!;
      var headers = {'Authorization': 'Bearer $token'};
      var request =
          http.Request('GET', Uri.parse("${domainurl}get-applicant-detail/$applicantId"));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        if (responseBody == '"Unauthenticated."') {
          // logout session expired
        sessionExpired(context: context);
        } else {
          SessionTimer.reset();
          return eachApplicantDetailModelFromJson(responseBody);
        }
      } else {
        Map mapBody = jsonDecode(responseBody);
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      print(exception);
      return exception.toString();
    }
  }
}
