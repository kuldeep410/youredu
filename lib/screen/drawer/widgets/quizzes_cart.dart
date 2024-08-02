import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/screen/home/best_selling_course_details/best_selling_course_details.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class QuizzesCart extends StatelessWidget {
  const QuizzesCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/mentors/filter_vector.png',
                        height: 14.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text: "Filter",
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 12.h),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mentors/search_vector.png',
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                          text: "Search",
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Image.asset(
          'assets/mentors/quize_one.png',
          height: 214.h,
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomText(
          text: 'You didn’t perticipate any quizzes',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.title,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.6,
            letterSpacing: 1.2,
            color: AppColors.body,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: ElevatedbuttonWidget(
            text: "Perticipate",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BestSellingCourseDetails(),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
