import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/provider/verification_provider.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/screen/drawer/settings/phone_verification/phone_verification_provider/phone_verification_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/elevated_button_widget.dart';

class PhoneVerificationOTPScreen extends StatelessWidget {
  String? phoneNumber;
  PhoneVerificationOTPScreen({super.key, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneVerificationProvider(),
      child: Consumer<PhoneVerificationProvider>(
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
                    text: 'verify_account',
                    color: AppColors.title,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  SizedBox(
                    height: 65.h,
                  ),
                  Text(
                    "authentication_code_send_to_your_number".tr(),
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 6.h,
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
                        //controller: provider.codeController,
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
                    height: 40.h,
                  ),
                  ElevatedButtonWidget(
                    text: 'verify_now'.tr(),
                    onPressed: () {
                      provider.verificationPhone(context, phoneNumber);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        provider.getOtpToPhoneNumber(context, phoneNumber);
                      },
                      child: Text(
                        'resend_code'.tr(),
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            letterSpacing: 1,
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
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
