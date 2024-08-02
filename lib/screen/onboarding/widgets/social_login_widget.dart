// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class SocialLoginWidget extends StatelessWidget {
  String? assetImage;
  String? text;
  Color? bgColour;
  Color? textColor;
  Color? borderColor;
  SocialLoginWidget(
      {Key? key,
      this.assetImage,
      this.bgColour,
      this.text,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.5.h),
        // height: 56.h,
        // width: 327.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            color: bgColour,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '$assetImage',
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(
              width: 15.8.sp,
            ),
            Text(
              '$text',
              style: TextStyle(
                  color: textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
