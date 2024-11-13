import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/jobapplicants_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/services/getopening_details_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class OpeningDetailsProvider extends ChangeNotifier {
  bool isLoading = true;
  getOpeningDetails({required BuildContext context,required String jobId}) async {
    try {
      isLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await GetOpeningDetailsService.getAllopenings(jobId: jobId, context: context);
        if (response is JobApplicantsModel) {
          Appconstants.allJobApplicantsResponse=response;
          //for storing response
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString(
          //     "alljobapplicantsmodel", jobApplicantsModelToJson(response));
          // Appconstants.allJobApplicantsResponse = jobApplicantsModelFromJson(
          //     prefs.getString("alljobapplicantsmodel").toString());
            isLoading = false;
            notifyListeners();
        } else {
        isLoading = false;
        notifyListeners();
        }
      } else {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      isLoading = false;
        notifyListeners();
    }
  }
}