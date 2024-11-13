import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/datamodels/allapplicants_model.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/services/allapplicants_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApplicantsProvider extends ChangeNotifier {
  bool isLoading = true;
  int page=1;

  pageIncrement(){
    page++;
    notifyListeners();
  }
  resetpage(){
    page=1;
    notifyListeners();
  }
  getAllApplicants({required BuildContext context}) async {
    try {
      isLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await GetAllApplicantsService.getAllapplicants(context: context,page: page.toString());
        if (response is AllApplicantsModel) {
          if (page<=1) {
            Appconstants.allapplicantsResponse=response;
          }else{
            Appconstants.allapplicantsResponse!.applicants!.data!.addAll(response.applicants!.data!);
          }
          pageIncrement();
          //for storing response
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString(
          //     "allapplicantsmodel", allApplicantsModelToJson(response));
          // Appconstants.allapplicantsResponse = allApplicantsModelFromJson(
          //     prefs.getString("allapplicantsmodel").toString());
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
