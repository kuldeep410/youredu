import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/splash_screen/splash_screen.dart';
import 'package:lms/screen/drawer/settings/about_us/about_us.dart';
import 'package:lms/screen/drawer/settings/phone_verification/phone_verification_screen.dart';
import 'package:lms/screen/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'dart:io' show Platform;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'settings'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ));
              },
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.leaderboard_outlined,
                        color: AppColors.primary,
                      )),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                    text: 'about_us'.tr(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ));
              },
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.person_remove_outlined,
                        color: AppColors.primary,
                      )),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                    text: 'edit_profile'.tr(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            FutureBuilder<String?>(
              future: SPUtill.getValue(SPUtill.keyVerificationSetUp),
              builder: (context, verify) {
                if (verify.data == null) return const SizedBox.shrink();
                if (verify.data == 'email' || verify.data == 'none')
                  return const SizedBox.shrink();
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PhoneVerificationScreen(),
                            ));
                      },
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Icon(
                                Icons.perm_phone_msg_outlined,
                                color: AppColors.primary,
                              )),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            text: 'phone_verification'.tr(),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                logOut(context);
              },
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.logout,
                        color: AppColors.primary,
                      )),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                    text: 'logout'.tr(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Platform.isIOS
                ? InkWell(
                    onTap: () {
                      logOut(context);
                    },
                    child: Row(
                      children: [
                        // Image.asset(
                        //   'assets/home_page/logout_icon.png',
                        //   height: 36.h,
                        // ),
                        const Icon(
                          Icons.person_rounded,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        CustomText(
                          text: 'Delete Account',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.body,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

void logOut(context) async {
  await SPUtill.deleteKey(
    SPUtill.keyAuthToken,
  );
  await SPUtill.deleteKey(
    SPUtill.keyName,
  );
  await SPUtill.deleteKey(
    SPUtill.keyEmail,
  );
  await SPUtill.deleteKey(
    SPUtill.keyMobile,
  );
  await SPUtill.deleteKey(
    SPUtill.keyAvatar,
  );
  await SPUtill.deleteKey(
    SPUtill.keyStatus,
  );
  await SPUtill.deleteKey(
    SPUtill.keyJoinDate,
  );
  await SPUtill.deleteKey(
    SPUtill.keyDateBirth,
  );
  NavUtil.pushAndRemoveUntil(context, const SplashScreen());
}
