import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/settings/about_us/about_us_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AboutUsProvider(),
      child: Consumer<AboutUsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'About Us'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/home_page/onest_logo.png',
                    height: 74.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: provider.aboutUsResponse?.data?.value ?? "",
                    color: AppColors.body,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
    ),
    );
  }
}
