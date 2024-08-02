// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/data/connectivity/connectivity_status.dart';
import 'package:lms/screen/auth/login_screen/login_provider.dart';
import 'package:lms/screen/auth/splash_screen/base_settings_provider.dart';
import 'package:lms/screen/auth/splash_screen/splash_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/web/web_landing_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:lms/screen/dashboard/dashboard_screen_provider.dart';
import 'package:lms/screen/home/all_courses/all_courses_provider.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:lms/screen/profile/my_profile_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffFFFFFF), // status bar color
  ));
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? MaterialApp(
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              // background: Container(color: const Color(0xFFF5F5F5))
            ),
            home: const WebLandingPage(),
          )
        : ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MultiProvider(
              providers: [
                // ChangeNotifierProvider(create: (_) => LogInProvider()),
                // ChangeNotifierProvider(create: (_) => BaseSettingsProvider()),
                ChangeNotifierProvider(
                  create: (_) => LogInProvider(),
                ),
                ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  textTheme: GoogleFonts.interTextTheme(
                    Theme.of(context).textTheme,
                  ),
                  primarySwatch: Colors.blue,
                ),
                home: const SplashScreen(),
                builder: EasyLoading.init(),
              ),
            ),
          );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primary
    ..backgroundColor = Colors.transparent
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.primary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[];
}
