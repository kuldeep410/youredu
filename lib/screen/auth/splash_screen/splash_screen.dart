import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:lms/screen/onboarding/onboarding_screen.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      NavUtil.replaceScreen(context, const BottomNavBar());
      var token = await SPUtill.getValue(SPUtill.keyAuthToken);
      if (kDebugMode) {
        /// development purpose only
        print("Bearer token: $token");
      }
      if (token != null) {
        if (!mounted) return;
        NavUtil.replaceScreen(context, const BottomNavBar());
      } else {
        if (!mounted) return;
        NavUtil.replaceScreen(context, const OnbardingScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/home_page/app_spalsh_logo.png',
          height: 191.h,
          width: 136.w,
        ),
      ),
    );
  }
}
