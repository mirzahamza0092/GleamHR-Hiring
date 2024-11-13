import 'package:flutter/material.dart';
import 'package:gleamhiring/features/dashboard/presentation/pages/dashboard.dart';
import 'package:gleamhiring/features/domain/presentation/screens/domain_screen.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/pages/forgot_password_screen.dart';
import 'package:gleamhiring/features/forgot_password/set_password/presentation/pages/set_password_page.dart';
import 'package:gleamhiring/features/forgot_password/verify_password/presentation/pages/recover_password_screen.dart';
import 'package:gleamhiring/features/login/presentation/pages/login_page.dart';
import 'package:gleamhiring/features/splash/presentation/pages/splash.dart';
import 'package:page_transition/page_transition.dart';

//routes
const String login = 'login';
const String splashscreen = '/';
const String domainscreen = 'domainscreen';
const String forgotpassword = 'passwordreset';
const String verifypassword = 'verifypassword';
const String setpassword = 'setpassword';
const String dashboard = 'dashboard';

//cases for the routes
Route<dynamic>? generateRoutes(RouteSettings settings) {
  
  switch (settings.name) {
    case splashscreen:
      return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const SplashScreen(),
          duration: const Duration(milliseconds: 600));
    case login:
      return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const LoginScreen(),
          duration: const Duration(milliseconds: 600));
    case domainscreen:
      return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const DomainScreen(),
          duration: const Duration(milliseconds: 600));
    case forgotpassword:
      return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const ForgotPasswordScreen(),
          duration: const Duration(milliseconds: 600));
    case verifypassword:
      return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const VerifyPassword(),
          duration: const Duration(milliseconds: 600));
    case setpassword:
      return PageTransition(
          type: PageTransitionType.topToBottom,
          child: const SetPassword(),
          duration: const Duration(milliseconds: 600));
    case dashboard:
      return PageTransition(
          type: PageTransitionType.topToBottom,
          child: const Dashboard(),
          duration: const Duration(milliseconds: 600));
    default:
      throw ('This route does not exist');
  }
}