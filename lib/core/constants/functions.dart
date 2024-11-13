import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:path/path.dart' as path;
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/globalkeys.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/features/login/presentation/pages/login_page.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

String timeAgo(DateTime d) {
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365) {
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  }
  if (diff.inDays > 30) {
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  }
  if (diff.inDays > 7) {
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  }
  if (diff.inDays > 0) {
    return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
  }
  if (diff.inHours > 0) {
    return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
  }
  if (diff.inMinutes > 0) {
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  }
  return "just now";
}

String validateString(String validate) {
  if (validate == "null") {
    return "Not Available";
  } else {
    return validate;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

firebasegetfcmtoken() async {
  //talha test
  //String oneSignalId = 'dcb223dc-9cf7-47a2-acc9-47598d2e68c8';
  //gleamhiring live
  String oneSignalId = '1999d2cd-8dc1-4556-8eeb-f3e455219770';
  OneSignal.shared.setAppId(
    oneSignalId,
  );
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((value) async {
    print("ACCEPTED");
  });
  final status = await OneSignal.shared.getDeviceState();
  final String? osUserID = status?.userId;
  Appconstants.playerId = osUserID!;
  print("player id $osUserID");

  // Set notification received and opened handlers
  // OneSignal.shared.completeNotification("notificationId", true);
  // OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
  //   // our own call
  //   NotificationHelper.sendNotification(event.notification.title!.toString(),
  //       event.notification.body.toString());
  //   event.complete(event.notification);
  // });
  // OneSignal.shared.setNotificationOpenedHandler(
  //   (OSNotificationOpenedResult result) {
  //     // Handle the notification
  //     print('Notification Opened: ${result.notification.body}');
  //   },
  // );
}

class SessionTimer {
  //stop timer
  static void stop() {
    timer?.cancel();
  }

//reset timer
  static void reset() {
    secondsElapsed = 0;
  }

  static int secondsElapsed = 0;
  static Timer? timer;
  static void startDisplayingTime(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      secondsElapsed++;
      int minutes = (secondsElapsed % 3600) ~/ 60;
      int remainingSeconds = secondsElapsed % 60;
      print(minutes.toString() + ":" + remainingSeconds.toString());
      if (minutes.toString() == "9" && remainingSeconds.toString() == "50") {
        stop();
        reset();
        // logout function code
        sessionExpired(context: context);
        // // logout function code
        // print("=======logout=========session expired=========");
        // bool res=await LogoutService.logout(context: context);
        // if (res) {
        //  navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()),
        //     (route) => false);
        // snackbarKey.currentState
        //     ?.showSnackBar(appSnackBar("Session Expired"));
        // }
      }
    });
  }
}

sessionExpired({required BuildContext context}) {
  snackbarKey.currentState?.showSnackBar(appSnackBar("Session Expired"));
  navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false);
  SessionTimer.stop();
  SessionTimer.reset();
}

Future<bool> userAuthorization({required String reason}) async {
  return await Appconstants.auth.authenticate(
      localizedReason: reason,
      options: (const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
          sensitiveTransaction: false)));
}

Future<void> downloadFile(
    String fileUrl, BuildContext context, String fileName) async {
  PermissionStatus? storagePermission;
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    if (int.parse(androidInfo.version.release) < 13) {
      if (await Permission.storage.isPermanentlyDenied) {
        await openAppSettings();
      } else {
      storagePermission = await Permission.storage.request();
      }
    } else {
      if (await Permission.photos.isPermanentlyDenied) {
        await openAppSettings();
      } else {
      storagePermission = await Permission.photos.request();
      }
    }
  } else {
    if (await Permission.storage.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      storagePermission = await Permission.storage.request();
    }
  }

  String extension = getextension(fileUrl);
  if (await storagePermission!.isGranted) {
    try {
      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        Directory? appDocDir;
        if (Platform.isAndroid) {
          appDocDir = await DownloadsPath.downloadsDirectory();
        } else {
          appDocDir = await getApplicationDocumentsDirectory();
        }
        final filePath = '${appDocDir!.path}/${fileName}$extension';
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        if (extension == '.docx' || extension == '.doc') {
        await Fluttertoast.showToast(
          msg: "Download Completed, Please! open cv from your Phone Directory",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
        } else {
          // if (await canLaunchUrl(Uri.parse(fileUrl))) {
          //   await launchUrl(
          //     Uri.parse(fileUrl),
          //   );
          // }
        }
        Fluttertoast.showToast(
          msg: "File Downloaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to download file",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
        // throw Exception('Failed to load file');
      }
    } catch (e) {
        Fluttertoast.showToast(
          msg: "Already Downloaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } else {
        Fluttertoast.showToast(
          msg: "Please Allow Storage",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
  }
}

String getextension(String filepath) {
  return path.extension(filepath);
}
