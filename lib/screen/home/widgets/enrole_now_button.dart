import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class EnroleNowButton extends StatelessWidget {
  final Function()? onTouch;
  final String? text;
  const EnroleNowButton({
    Key? key,this.onTouch,this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(90.w, 28.h),
            ),
            onPressed: onTouch,
            child: CustomText(
              text: text ?? "Enroll Now",
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          );
  }
}
