import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/widgets/enrole_now_button.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class RecommandedCourses extends StatelessWidget {
  final String? image, amount;
  final Function()? onTap;
  const RecommandedCourses({Key? key, this.image, this.amount, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image!,
            // 'assets/free_course/free_course_one.png',
            height: 140.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Learn Python: The\nComplete Python...',
                  color: AppColors.title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/trending_courses/star_vector.png',
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CustomText(
                      text: '4.3',
                      color: AppColors.title,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    CustomText(
                      text: '(1045 Reviews)',
                      color: AppColors.body,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              children: [
                CustomText(
                  text: amount,
                  color: AppColors.title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                const EnroleNowButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
