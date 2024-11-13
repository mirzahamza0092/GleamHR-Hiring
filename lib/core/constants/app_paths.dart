import 'package:gleamhiring/features/dashboard/features/applicants/data/datamodels/EachApplicantDetailModel.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/data/datamodels/allapplicants_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/all_jobs_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/jobapplicants_model.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/login_model.dart';
import 'package:gleamhiring/features/login/data/data_models.dart/module_model.dart';
import 'package:local_auth/local_auth.dart';

import '../../features/dashboard/features/openings/data/datamodels/getjobcreatedata_model.dart';

class Appconstants {
  //bio metric Auth
  static final LocalAuthentication auth = LocalAuthentication();
  static bool supportstate = false;
  //
  static String? token;
  static LoginModel? loginResponse;
  static AllJobsModel? alljobsResponse;
  static GetJobCreateDataModel? getJobCreateDataResponse;
  static AllApplicantsModel? allapplicantsResponse;
  static JobApplicantsModel? allJobApplicantsResponse;
  static EachApplicantDetailModel? eachApplicantDetailModel;
  static ModuleModel? modulelistResponse;
  static String? domain;
  static String playerId='';
}