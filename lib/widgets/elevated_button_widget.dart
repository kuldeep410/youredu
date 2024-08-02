import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  const ElevatedButtonWidget({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)), backgroundColor: AppColors.primary),
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(
              letterSpacing: 1.sp,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          )),
    );
  }
}
