import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicants_providers.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicantsdetails_provider.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/providers/opening_details_provider.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/providers/openings_providers.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gleamhiring/features/domain/presentation/providers/domain_provider.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/providers/forgot_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/set_password/presentation/providers/set_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/verify_password/presentation/providers/verifypassword_provider.dart';
import 'package:gleamhiring/features/login/presentation/providers/login_provider.dart';
import 'package:gleamhiring/features/logout/presentation/providers/logout_provider.dart';
import 'package:provider/provider.dart';

var bindings = [
  ChangeNotifierProvider<DomainScreenProvider>(
    create: (context) => DomainScreenProvider(),
  ),
  ChangeNotifierProvider<LoginScreenProvider>(
    create: (context) => LoginScreenProvider(),
  ),
  ChangeNotifierProvider<ForgotPasswordProvider>(
    create: (context) => ForgotPasswordProvider(),
  ),
  ChangeNotifierProvider<VerifyPasswordProvider>(
    create: (context) => VerifyPasswordProvider(),
  ),
  ChangeNotifierProvider<SetPasswordProvider>(
    create: (context) => SetPasswordProvider(),
  ),
  ChangeNotifierProvider<DashBoardProvider>(
    create: (context) => DashBoardProvider(),
  ),
  ChangeNotifierProvider<OpeningsProvider>(
    create: (context) => OpeningsProvider(),
  ),
  ChangeNotifierProvider<ApplicantsProvider>(
    create: (context) => ApplicantsProvider(),
  ),
  ChangeNotifierProvider<ApplicantsDetailsProvider>(
    create: (context) => ApplicantsDetailsProvider(),
  ),
  ChangeNotifierProvider<OpeningDetailsProvider>(
    create: (context) => OpeningDetailsProvider(),
  ),
  ChangeNotifierProvider<LogoutProvider>(
    create: (context) => LogoutProvider(),
  ),
];
