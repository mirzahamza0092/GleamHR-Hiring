import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateApplicantStatusService {
  static Future updateApplicantStatus({
    required String status,
    required String candidateId,
    required String setBy,
    required String candidateStatusId,
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token = prefs.getString("token")!;
      var headers = {'Authorization': 'Bearer $token'};

      //String   apiUrl =("${domainurl}update-applicant-status-rating");

      var request = http.MultipartRequest(
          'POST', Uri.parse("${domainurl}update-applicant-status-rating"));
      request.fields.addAll({
        'status': status,
        'candidate_id': candidateId,
        'set_by': setBy,
        'change_in': "Status",
        'candidateStatusId': candidateStatusId,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        if (response == '"Unauthenticated."') {
          // logout session expired
          sessionExpired(context: context);
        } else {
          SessionTimer.reset();
          return true;
        }
      } else {
        return false;
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      print(exception);
      return exception.toString();
    }
  }
}
