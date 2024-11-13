import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/datamodels/EachApplicantDetailModel.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/services/addcomment_service.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/services/eachapplicant_service.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/services/update_status_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../data/services/updateapplicant_service.dart';

class ApplicantsDetailsProvider extends ChangeNotifier {
  int pageStatus = 1;
  bool isLoading = true;
  GlobalKey<FormState> validatorkey = GlobalKey();
  bool statusIsLoading = false;
  int isActivated = 1, isNotesActivated = 1;
  TextEditingController commentController = TextEditingController();
  List<String> statusTypes = [];

  String selectedStatus = "New";

  getActivated() => isActivated;

  changeActivated(int value) {
    isActivated = value;
    notifyListeners();
  }

  getNotesActivated() => isNotesActivated;

  changeNotesActivated(int value) {
    isNotesActivated = value;
    notifyListeners();
  }

  changeStatus({required String val,required BuildContext context,required String candidateId,required String setBy}) {
    selectedStatus = val;
    updateStatus(context: context, status: val, candidateId: candidateId, setBy: setBy,);
    notifyListeners();
  }

  getPageStatus() => pageStatus;
  setPageStatus(int newval) {
    pageStatus = newval;
    notifyListeners();
  }

  getEachApplicant(
      {required BuildContext context, required String applicantId}) async {
    try {
      isLoading = true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response = await GetEachApplicantsService.geteachapplicant(
            applicantId: applicantId, context: context);
        if (response is EachApplicantDetailModel) {
          Appconstants.eachApplicantDetailModel = response;
          statusTypes=[];
          Appconstants.eachApplicantDetailModel!.statusArray!.forEach((value) {
            statusTypes.add(value.status.toString());
          });
          labelll=Appconstants.eachApplicantDetailModel!.currentRating.toString()=="null"?"0":Appconstants.eachApplicantDetailModel!.currentRating!.status.toString();
          selectedStatus = Appconstants.eachApplicantDetailModel!.currentStatus.toString()=="null"?"New"
            :Appconstants.eachApplicantDetailModel!.currentStatus!.status.toString()=="null"?"New":getStatusId(Appconstants.eachApplicantDetailModel!.currentStatus!.status.toString())==""?"New":Appconstants.eachApplicantDetailModel!.currentStatus!.status.toString();
          //***if you need dropdown items from api then uncomment below line
          //statusTypes= List<String>.from(Appconstants.eachApplicantDetailModel!.statusArray!.values.toList());
          bool dropdownvaluefound=statusTypes.contains(selectedStatus);
          if(!dropdownvaluefound){
            statusTypes.add(selectedStatus);
          }
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
      } else {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context)
            .showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  //  updateRating(double newValue) {
  //   Appconstants.eachApplicantDetailModel!.currentRating = {"status": newValue};

  //   // Notify listeners to trigger a rebuild in the widgets that depend on this provider
  //   notifyListeners();
  // }
  String? labelll;
   updateRating({
    required BuildContext context,
    required double newValue,
    required String candidateId,
    required String setBy,
    required String changeIn}
  ) async {
      labelll = newValue.toString();
      notifyListeners();
     try {
      isLoading= false;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await GetUpdateApplicantService.getupdateappl(
          newValue: newValue,
          candidateId: candidateId,
          setBy: setBy,
          context: context);
        if (response is EachApplicantDetailModel) {
          Appconstants.eachApplicantDetailModel=response;
          // Fluttertoast.showToast(
          // msg: "Rating Updated",
          // toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.BOTTOM,
          // timeInSecForIosWeb: 1,
          // backgroundColor: AppColors.primaryColor,
          // textColor: Colors.white,
          // fontSize: 16.0);
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
getStatusId(String status) {
  String statusId = "";
  Appconstants.eachApplicantDetailModel!.statusArray!.forEach((element) {
    if (element.status == status) {
      statusId = element.id.toString();
    }
  });
  return statusId; 
}
  updateStatus({
    required BuildContext context,
    required String status,
    required String candidateId,
    required String setBy}
  ) async {
     try {
      String candidateStatusId=getStatusId(status);
      statusIsLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await UpdateApplicantStatusService.updateApplicantStatus(
          status: status,
          candidateId: candidateId,
          setBy: setBy,
          candidateStatusId: candidateStatusId,
          context: context);
        if (response) {
          Fluttertoast.showToast(
          msg: "Status Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
          statusIsLoading = false;
          notifyListeners();
        } else {
          Fluttertoast.showToast(
          msg: "Failed to update status",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.redColor,
          textColor: Colors.white,
          fontSize: 16.0);        
        statusIsLoading = false;
        notifyListeners();
        }
      } else {
        statusIsLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      statusIsLoading = false;
        notifyListeners();
    }
  }

  addComment({
    required BuildContext context,
    required String comment,
    required String candidateId,
    required String setBy}
  ) async {
     try {
      statusIsLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await AddCommentService.addComment(comment: comment, candidateId: candidateId, setBy: setBy, context: context);
        commentController.clear();
        if (response) {
          Fluttertoast.showToast(
          msg: "Comment Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
          statusIsLoading = false;
          Navigator.of(context).pop();
          notifyListeners();
        } else {
          Fluttertoast.showToast(
          msg: "Failed to add comment",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.redColor,
          textColor: Colors.white,
          fontSize: 16.0);
        statusIsLoading = false;
        Navigator.of(context).pop();
        notifyListeners();
        }
      } else {
        statusIsLoading = false;
        Navigator.of(context).pop();
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      statusIsLoading = false;
        Navigator.of(context).pop();
        notifyListeners();
    }
  }
}