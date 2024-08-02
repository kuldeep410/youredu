import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/connectivity/no_internet_screen.dart';
import 'package:lms/screen/auth/forget_password/forget_password.dart';
import 'package:lms/screen/auth/login_screen/login_provider.dart';
import 'package:lms/screen/auth/sign_up_screen/sign_up_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:provider/provider.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../widgets/elevated_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return NoInternetScreen(
      child: ChangeNotifierProvider(
        create: (context) => LogInProvider(),
        child: Consumer<LogInProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: SafeArea(
                  child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80.h,
                        ),
                        Text(
                          "sign_in".tr(),
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'welcome_back_lets'.tr(),
                          style: TextStyle(
                              height: 1.7,
                              color: AppColors.body,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ////Email/phone from field////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: provider.nameController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.white,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primary, width: 1.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13.h, horizontal: 16.w),
                                  hintText: 'email'.tr(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.border),
                                  ),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.hintTextColor,
                                      fontWeight: FontWeight.w400),
                                  border: const OutlineInputBorder()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ////Password from field/////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'password'.tr(),
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: provider.passController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primary, width: 1.0),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13.h, horizontal: 16.w),
                                  hintText: 'password'.tr(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.border),
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey.withOpacity(.4),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.hintTextColor,
                                      fontWeight: FontWeight.w400),
                                  border: const OutlineInputBorder()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),

                        // todo we will work on it later
                        Row(
                          children: [
                            // const Icon(
                            //   Icons.check_box_outline_blank,
                            //   color: AppColors.border,
                            // ),
                            // SizedBox(
                            //   width: 6.w,
                            // ),
                            // Text(
                            //   'Remember me',
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassword(),
                                    ));
                              },
                              child: Text(
                                'forgot_password'.tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedbuttonWidget(
                          text: 'lOGIN',
                          onPressed: () {
                            provider.loginApi(context);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Do_not_have_an_account'.tr(),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.body),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ));
                              },
                              child: Text(
                                'register_now'.tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
