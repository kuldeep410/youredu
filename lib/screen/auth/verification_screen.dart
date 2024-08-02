import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/provider/verification_provider.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatelessWidget {
  final String? email;
  const VerificationScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerificationProvider(),
      child: Consumer<VerificationProvider>(
        builder: (context, provider, _) {
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
                    text: 'Verify account',
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
                    'Enter 4-digit code we just texted to your\nEmail Address: $email',
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
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 25.h,
                        ),
                        // controller: provider.codeController,
                        otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor: AppColors.border,
                          focusBorderColor: AppColors.primary,
                          backgroundColor: Colors.white,
                        ),
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceBetween,
                        fieldWidth: 60.w,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 15.r,
                        style: TextStyle(fontSize: 25.sp),
                        onChanged: (pin) {
                          provider.changePin(pin);
                        },
                        onCompleted: (pin) {}),
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
                      provider.verificationApi(email: email, context: context);
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
        },
      ),
    );
  }
}
