import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/connectivity/no_internet_screen.dart';
import 'package:lms/screen/auth/sign_up_screen/sign_up_provider.dart';
import 'package:lms/screen/auth/login_screen/login_screen.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:provider/provider.dart';

import '../widgets/elevated_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return NoInternetScreen(
      child: ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        child: Consumer<SignUpProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/home_page/app_spalsh_logo.png',
                            height: 120.h,
                            width: 110.w,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Create an account to continue!',
                          style: TextStyle(
                              color: AppColors.body,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        //user name///
                        FromField(
                          controller: provider.nameController,
                          title: "User Name",
                          hintText: 'Write your full Name',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ////Email/phone from field////
                        FromField(
                          controller: provider.emailController,
                          title: "Email",
                          hintText: 'Write your email or phone',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ////Password from field/////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
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
                                  hintText: 'Password',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Confirm Password',
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
                              controller: provider.confirmPasswordController,
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
                                  hintText: 'Confirm Password',
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

                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedbuttonWidget(
                          text: 'SIGN UP',
                          onPressed: () {
                            provider.signUpApi(context);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Already have an account?',
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
                                      builder: (context) => const LogInScreen(),
                                    ));
                              },
                              child: Text(
                                'Sign In',
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
              ),
            );
          },
        ),
      ),
    );
  }
}
