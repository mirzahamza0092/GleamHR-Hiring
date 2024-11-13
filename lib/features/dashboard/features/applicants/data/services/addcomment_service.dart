import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCommentService {
  static Future addComment({
    required String comment,
    required String candidateId,
    required String setBy,
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token = prefs.getString("token")!;
      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest(
          'POST', Uri.parse("${domainurl}add-applicant-comments"));
      request.fields.addAll({
      'candidate_id': candidateId,
      'comment': comment,
      'set_by': setBy
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
