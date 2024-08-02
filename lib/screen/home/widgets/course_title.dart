import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class CourseTitle extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CourseTitle({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title!,
          color: AppColors.title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: CustomText(
            text: "See all",
            color: AppColors.body,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
