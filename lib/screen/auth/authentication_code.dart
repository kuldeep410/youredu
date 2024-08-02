import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class AuthenticationCodeScreen extends StatelessWidget {
  const AuthenticationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            CustomText(
              text: 'Forget Password',
              color: AppColors.title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            SizedBox(
              height: 65.h,
            ),
            Text(
              "Authentication Code",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              'Enter 4-digit code we just texted to your\nPhone number: +880 *** **** 36',
              style: TextStyle(
                  height: 1.6,
                  color: AppColors.body,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40.h,
            ),
            ////Email/phone from field////
            Center(
              child: OTPTextField(
                  contentPadding: EdgeInsets.symmetric(vertical: 25.h),
                  controller: otpController,
                  otpFieldStyle: OtpFieldStyle(
                    enabledBorderColor: AppColors.border,
                    focusBorderColor: AppColors.primary,
                    backgroundColor: Colors.white,
                  ),
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  fieldWidth: 70.w,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15.r,
                  style: TextStyle(fontSize: 25.sp),
                  onChanged: (pin) {
                    // ignore: avoid_print
                    print("Changed: $pin");
                  },
                  onCompleted: (pin) {
                    // ignore: avoid_print
                    print("Completed: $pin");
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend code after : ',
                  style: TextStyle(
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '01:36',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ElevatedbuttonWidget(
              text: 'VERIFY NOW',
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const AddNewPasswordScreen(),
                //     ));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'RESEND CODE',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    letterSpacing: 1,
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
