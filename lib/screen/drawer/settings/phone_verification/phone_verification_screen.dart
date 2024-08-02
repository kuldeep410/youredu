import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/settings/phone_verification/phone_verification_provider/phone_verification_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_consts.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../auth/widgets/elevated_button_widget.dart';
import '../../../auth/widgets/text_form_field.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneVerificationProvider(),
      child:
          Consumer<PhoneVerificationProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: 'Phone Verification',
              color: AppColors.title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/auth_image/foget_pass_img.png',
                      height: 150.h,
                      width: 241.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "Please Enter your authentic phone number to verify your phone ",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  FromField(
                    controller: provider.phoneController,
                    title: "mobile_number".tr(),
                    hintText: 'enter_your_mobile_number'.tr(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButtonWidget(
                    onPressed: () {
                      provider.getOtpToPhoneNumber(
                          context, provider.phoneController.text);
                    },
                    text: "submit",
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
