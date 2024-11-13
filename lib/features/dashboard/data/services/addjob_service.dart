import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/getjobcreatedata_model.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddJobsService {
  static Future addJobs({
    required BuildContext context,
    required String position,
    required String title,
    required String jobdescription,
    required String department_id,
    required String employment_status_id,
    required String location_id,
    required String target_date,
    required String hiring_lead_id,
    required String designation_id,
    required String jobstatus,
    required String experience,
    required String job_id,
    required bool isEdit,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String domainurl = prefs.getString("domainUrl").toString();
      String token = prefs.getString("token")!;
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
        };
        var request;
        if (isEdit) {
          request = http.Request('POST', Uri.parse("${domainurl}update-job"));
        } else {
          request = http.Request('POST', Uri.parse("${domainurl}store-job"));  
        }
        if (isEdit) {
         request.body = json.encode({
        "job_id": job_id,
        "position": position,
        "title": title,
        "job_description": jobdescription,
        "designation_id": designation_id,
        "employment_status_id": employment_status_id,
        "hiring_lead_id": hiring_lead_id,
        "target_date": target_date,
        "location_id": location_id,
        "job_status": jobstatus,
        "department_id": department_id,
        "experience": experience,
      }); 
        }else{
          request.body = json.encode({
        "position": position,
        "title": title,
        "job_description": jobdescription,
        "designation_id": designation_id,
        "employment_status_id": employment_status_id,
        "hiring_lead_id": hiring_lead_id,
        "target_date": target_date,
        "location_id": location_id,
        "job_status": jobstatus,
        "department_id": department_id,
        "experience": experience,
      });
        }
      
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        if (responseBody == '"Unauthenticated."') {
          // logout session expired
        sessionExpired(context: context);
        } else {
          SessionTimer.reset();
          Map  mapBody = jsonDecode(responseBody);
          if (mapBody["success"].toString() == "1") {
          return true;
          } else {
            return false;
          }
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
