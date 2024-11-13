import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gleamhiring/app.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://5c0bd644d1e645bb8c0f09a75d286d76@sentry.glowlogix.com/3';
    },
    // Init your App.
    appRunner: () => runApp(MyApp()),
  );
}