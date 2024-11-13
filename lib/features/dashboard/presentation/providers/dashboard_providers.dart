import 'package:flutter/material.dart';
import 'package:gleamhiring/core/network/network_info.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/dashboard/data/services/addapplicant_service.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/getjobcreatedata_model.dart';
import 'package:intl/intl.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_paths.dart';
import '../../data/services/addjob_service.dart';

class DashBoardProvider extends ChangeNotifier {
  String? position, jobLocation,jobdepartment,hiringLead,divison,designation;
  String? employmentStatus;
  String empStatus="Employed";
  String JobStatus="Open";
  String experience="1+";
  TextEditingController empName = TextEditingController();
  TextEditingController empFatherName = TextEditingController();
  TextEditingController empEmail = TextEditingController();
  TextEditingController empPhone = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobdescription = TextEditingController();
  List<String> statusList = ["Employed", "Unemployed"];
  List<String> jobStatusList = ["Open", "Closed"];
  List<String> experienceList = ["0", "1+", "2+", "3+", "4+", "5+", "6+"];
  List<String> positionList = [];
  String? positionid, jobLocationid ,jobdepartmentid,hiringLeadid,divisonid,designationid,employmentStatusid;
  //TextEditingController jobdescription = TextEditingController();
  List<String> jobLocationList = [];
  List<String> jobdepartmentList = [];
  List<String> hiringLeadList = [];
  List<String> divisonList = [];
  List<String> designationList = [];
  List<String> employmentStatusList = [];
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  int isActivated = 1;
  bool enabledBioStatus = false;
  
  String selectedDate="";

  getActivated() => isActivated;

  changeActivated(int value) {
    isActivated = value;
    notifyListeners();
  }

Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      //   _dateController.text = _selectedDate!.toLocal().toString().split(' ')[0];
      // });
      notifyListeners();
    }
  }
  changeBioMetricStatus(bool v) async {
    // Enabling bio metric
    final prefs = await SharedPreferences.getInstance();
    enabledBioStatus = v;
    if (v) {
      await prefs.setBool("bioPermissionEnabled", v);
    } else {
      await prefs.setBool("bioPermissionEnabled", v);
      await prefs.setBool("bioMetricEnabled", v);
    }
    notifyListeners();
  }


   
  changeEmpStatus(String val) {
    empStatus = val;
    notifyListeners();
  }

  changeJobStatus(String val) {
    JobStatus = val;
    notifyListeners();
  }

  changeExperience(String val) {
    experience = val;
    notifyListeners();
  }

clear(){
  empStatus = "Employed";
  empName.clear();
  empFatherName.clear();
  empEmail.clear();
  empPhone.clear();
}
  addApplicant({required BuildContext context}) async {
    if (formkey.currentState!.validate()) {
      try {
        if (await checkinternetconnection()) {
          isLoading = true;
          notifyListeners();
          var res = await AddAllApplicantsService.addApplicants(
              context: context,
              position: positionid!,
              name: empName.text,
              fathername: empFatherName.text,
              email: empEmail.text,
              mobile: empPhone.text,
              location: jobLocationid!,
              jobstatus: empStatus);
          if (res != null) {
            if (res["success"].toString() == "1") {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar(res["message"].toString()));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar("Failed to add applicant"));
            }
            clear();
            Navigator.of(context).pop();
            isLoading = false;
            notifyListeners();
          } else {
            Navigator.of(context).pop();
            isLoading = false;
            notifyListeners();
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(appSnackBar("No Internet Connection"));
        }
      } catch (exception) {
        await Sentry.captureException(exception);
        print(exception);
      }
    }
  }

addpositionList(){
  positionList=[];
  Appconstants.alljobsResponse!.data!.data!.forEach((element) {
  positionList.add(element.title!);
  });
  position=positionList[0];
  positionid=Appconstants.alljobsResponse!.data!.data![positionList.indexOf(position!)].id.toString();
  }

  addJob({required BuildContext context}) async {
    if (formkey.currentState!.validate()) {
      try {
        if (await checkinternetconnection()) {
          isLoading = true;
          notifyListeners();
          var res = await AddJobsService.addJobs(
            isEdit: false,
            job_id: "",
              context: context,
              position: position!,
              title: jobTitle.text,
              jobdescription: jobdescription.text,
              department_id: jobdepartmentid!,
              employment_status_id:employmentStatusid!,
              location_id: jobLocationid!,
              target_date: selectedDate!,
              hiring_lead_id: hiringLeadid!,
              designation_id: designationid!,
              experience: experience,
              jobstatus: JobStatus);
          if (res != null) {
            if (res) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar("Job Added Successfully"));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar("Failed to add Job"));
            }
            clear();
            Navigator.of(context).pop();
            isLoading = false;
            notifyListeners();
          } else {
            Navigator.of(context).pop();
            isLoading = false;
            notifyListeners();
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(appSnackBar("No Internet Connection"));
        }
      } catch (exception) {
        Navigator.of(context).pop();
        isLoading = false;
        notifyListeners();
        await Sentry.captureException(exception);
        print(exception);
      }
    }
  }

changePosition(String val){
  position=val;
  positionid=Appconstants.alljobsResponse!.data!.data![positionList.indexOf(val)].id.toString();
  notifyListeners();
}

getAllJobCreateData({required BuildContext context}) async {
    try {
      isLoading= true;
      notifyListeners();
      if (await checkinternetconnection()) {
        var response =await AddAllApplicantsService.getJobcreateData(context: context);
        if (response is GetJobCreateDataModel) {
          Appconstants.getJobCreateDataResponse=response;
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

addDesiredLocationList(){
  jobLocationList=[];
  Appconstants.getJobCreateDataResponse!.data!.locations!.forEach((element) {
  jobLocationList.add(element.name!);
  });
  jobLocation=jobLocationList[0];
  jobLocationid=Appconstants.getJobCreateDataResponse!.data!.locations![jobLocationList.indexOf(jobLocation!)].id.toString();
  notifyListeners();
}
changedesiredLocation(String val){
  jobLocation=val;
  jobLocationid = Appconstants.getJobCreateDataResponse!.data!.locations![jobLocationList.indexOf(val)].id.toString();
  notifyListeners();
}


addDesiredDepartmentList(){
  jobdepartmentList=[];
  Appconstants.getJobCreateDataResponse!.data!.departments!.forEach((element) {
  jobdepartmentList.add(element.departmentName!);
  print(element.departmentName);
  });
   jobdepartment=jobdepartmentList[0];
   jobdepartmentid=Appconstants.getJobCreateDataResponse!.data!.departments![jobdepartmentList.indexOf(jobdepartment!)].id.toString();
  notifyListeners();
}
changedesiredDepartment(String val){
  jobdepartment=val;
  jobdepartmentid = Appconstants.getJobCreateDataResponse!.data!.
  departments![jobdepartmentList.indexOf(val)].id.toString();
  notifyListeners();
} 
addDesiredHiringLeadList(){
  hiringLeadList=[];
  Appconstants.getJobCreateDataResponse!.data!.employees!..forEach((element) {
  hiringLeadList.add("("+element.id.toString()+")"+" "+element.firstname!.toString());
  });
  hiringLead=hiringLeadList[0];
  hiringLeadid=Appconstants.getJobCreateDataResponse!.data!.employees![hiringLeadList.indexOf(hiringLead!)].
  id.toString();
  notifyListeners();

}
   
   changedesiredHiringLead(String val){
      hiringLead=val;
      hiringLeadid=Appconstants.getJobCreateDataResponse!.data!.
      employees![hiringLeadList.indexOf(val)].id.toString();
      notifyListeners();
   }

addDesiredDivisonList(){
  divisonList=[];
  Appconstants.getJobCreateDataResponse!.data!.divisions!.forEach((element) {
  divisonList.add(element.name!);
  });
  divison=divisonList[0];
  divisonid=Appconstants.getJobCreateDataResponse!.data!.divisions![divisonList.indexOf(divison!)].id.toString();
  notifyListeners();
}
changedsiredDivison(String val){
  divison=val;
  divisonid=Appconstants.getJobCreateDataResponse!.data!.divisions![divisonList.indexOf(val)].id.toString();
  notifyListeners();
}

addDesiredDesignationList(){
  designationList=[];
  Appconstants.getJobCreateDataResponse!.data!.designations!.forEach((element) {
  designationList.add(element.designationName!);
  });
  designation=designationList[0];
  designationid=Appconstants.getJobCreateDataResponse!.data!.
  designations![designationList.indexOf(designation!)].id.toString();
  notifyListeners();
}
changedesiredDesignation(String val){
  designation=val;
  designationid=Appconstants.getJobCreateDataResponse!.data!.
  designations![designationList.indexOf(val)].id.toString();
  notifyListeners();
}

addDesiredEmploymentStatusList(){
  employmentStatusList=[];
  Appconstants.getJobCreateDataResponse!.data!.employmentStatus!.forEach((element) {
  employmentStatusList.add(element.employmentStatus!);
  });
  employmentStatus=employmentStatusList[0];
  
  employmentStatusid=Appconstants.getJobCreateDataResponse!.data!.
  employmentStatus![employmentStatusList.indexOf(employmentStatus!)].id.toString();
  notifyListeners();
}
changedesiredEmploymentStatus(String val){
  employmentStatus=val;
  employmentStatusid=Appconstants.getJobCreateDataResponse!.data!.
  employmentStatus![employmentStatusList.indexOf(val)].id.toString();
  notifyListeners();
}
}