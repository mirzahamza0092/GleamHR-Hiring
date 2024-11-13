import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/getjobcreatedata_model.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAllApplicantsService {
  static Future addApplicants({
    required BuildContext context,
    required String position,
    required String name,
    required String fathername,
    required String email,
    required String mobile,
    required String location,
    required String jobstatus,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token = prefs.getString("token")!;
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
        };
        var request = http.Request('POST', Uri.parse("${domainurl}add-application-for-job"));
      request.body = json.encode({
        "send_email": "no",
        "position": position,
        "name": name,
        "father_name": fathername,
        "email": email,
        "mobile_number": mobile,
        "desired_location": location,
        "job_status": jobstatus,
        "flag": "0"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        if (responseBody == '"Unauthenticated."') {
          // logout session expired
        sessionExpired(context: context);
        } else {
          SessionTimer.reset();
          Map mapBody = jsonDecode(responseBody);
          return mapBody;
        }
      } else {
        Map mapBody = jsonDecode(responseBody);
        return mapBody;
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      print(exception);
      return exception.toString();
    }
  }

static Future getJobcreateData({
    required BuildContext context,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token= prefs.getString("token")!;
      var headers = {'Authorization': 'Bearer $token'};
      var request =
          http.Request('GET', Uri.parse("${domainurl}get-job-create-data"));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        if (responseBody == '"Unauthenticated."') {
         // logout session expired
        sessionExpired(context: context);
        } else {
          SessionTimer.reset();
          return getJobCreateDataModelFromJson(responseBody);
        }
      } else {
        Map mapBody = jsonDecode(responseBody);
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      // Fluttertoast.showToast(
      //     msg: e.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      print(exception);
      return exception.toString();
    }
  }
}
