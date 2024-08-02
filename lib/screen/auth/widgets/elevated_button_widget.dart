// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class ElevatedbuttonWidget extends StatelessWidget {
  String? text;
  final Function()? onPressed;

  ElevatedbuttonWidget({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: AppColors.primary,
            elevation: 4,
          ),
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(
                letterSpacing: 1.sp,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          )),
    );
  }
}
