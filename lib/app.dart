import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/globalkeys.dart';
import 'package:gleamhiring/core/di/bindings.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: bindings,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: snackbarKey,
        debugShowCheckedModeBanner: false,
        title: 'Gleam Hiring',
          initialRoute: '/',
          onGenerateRoute: route.generateRoutes,
        darkTheme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}