import 'dart:io';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';

Future<bool> checkinternetconnection() async {
  try {
    final hasInternet = await InternetConnectivity().hasInternetConnection;
    if (hasInternet) {
      return true;
    } else {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}