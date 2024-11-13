import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/dashboard/data/services/addjob_service.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/all_jobs_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/services/deletejobs_service.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/services/getalljobs_service.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class OpeningsProvider extends ChangeNotifier {
  int page=1;
  bool isLoading = true,jobDeleteLoading=false,jobEditLoading=false;
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobdescription = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  pageIncrement(){
    page=page+1;
    notifyListeners();
  }
  resetpage(){
    page=1;
    notifyListeners();
  }
setAllValues({required String jobtitle,required DateTime newdate,required BuildContext context,}){
  jobTitle.text=jobtitle;
  context.read<DashBoardProvider>().selectedDate=DateFormat('yyyy-MM-dd').format(newdate);
  notifyListeners();
}
  getAllJobOpenings({required BuildContext context,required bool pageincrement}) async {
    try {
      isLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await GetAllJobService.getAllJobs(context: context,page: page.toString());
        if (response is AllJobsModel) {
          if (page<=1) {
          Appconstants.alljobsResponse=response;
          }else{
          Appconstants.alljobsResponse!.data!.data!.addAll(response.data!.data!);
          }
          if(pageincrement){
            pageIncrement();
          }
          //for storing response
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString(
          //     "alljobsmodel", allJobsModelToJson(response));
          // Appconstants.alljobsResponse = allJobsModelFromJson(
          //     prefs.getString("alljobsmodel").toString());
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

deleteJob({required String jobId,required BuildContext context}) async {
    try {
      jobDeleteLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await DeleteJobService.deleteJob(jobId: jobId,context: context);
        if (response is bool) {
          if(response){
            ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Job Deleted Successfully"));
            resetpage();
            getAllJobOpenings(context: context,pageincrement: false);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Failed to delete job"));
          }
            jobDeleteLoading = false;
            notifyListeners();
        } else {
        jobDeleteLoading = false;
        notifyListeners();
        }
      } else {
        jobDeleteLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      jobDeleteLoading = false;
        notifyListeners();
    }
  }

updateJob({required String jobId,required BuildContext context}) async {
    try {
      if (formkey.currentState!.validate()) {
        if (await checkinternetconnection()) {
      jobEditLoading = true;
            notifyListeners();
        var response = await AddJobsService.addJobs(
            isEdit: true,
              context: context,
              position: context.read<DashBoardProvider>().position!,
              title: jobTitle.text,
              job_id: jobId,
              jobdescription: jobdescription.text,
              department_id: context.read<DashBoardProvider>().jobdepartmentid!,
              employment_status_id: context.read<DashBoardProvider>().employmentStatusid!,
              location_id: context.read<DashBoardProvider>().jobLocationid!,
              target_date: context.read<DashBoardProvider>().selectedDate!,
              hiring_lead_id: context.read<DashBoardProvider>().hiringLeadid!,
              designation_id: context.read<DashBoardProvider>().designationid!,
              experience: context.read<DashBoardProvider>().experience,
              jobstatus: context.read<DashBoardProvider>().JobStatus);
        if (response is bool) {
          if(response){
            ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Job Updated Successfully"));
            resetpage();
            getAllJobOpenings(context: context,pageincrement: false);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Failed to update job"));
          }
            jobEditLoading = false;
            notifyListeners();
            Navigator.of(context).pop();
        } else {
        jobEditLoading = false;
        notifyListeners();
            Navigator.of(context).pop();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(appSnackBar("No Internet Connection"));
      }
      }
    } catch (exception) {
      await Sentry.captureException(exception);
      jobEditLoading = false;
      notifyListeners();
    }
  }
}
