import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class EnroleCourseDetailsPage extends StatelessWidget {
  const EnroleCourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Introduction to Python '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(
              'assets/home_page/video_img.png',
              height: 300,
            ),
            SizedBox(
              height: 14.5.h,
            ),
            Row(
              children: [
                CustomText(
                  text: "Introduction to Python",
                  color: AppColors.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                CustomText(
                  text: "Next",
                  color: const Color(0xff468DFF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Image.asset(
                  'assets/home_page/forward_vector_color.png',
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 14.5.h,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/home_page/forward_vector.png',
                  height: 20,
                ),
                SizedBox(
                  width: 4.w,
                ),
                RichText(
                    text: TextSpan(
                        text: "On next : ",
                        style: TextStyle(
                          color: const Color(0xff565656),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                      TextSpan(
                          text: 'Phython Setup',
                          style: TextStyle(
                              color: const Color(0xffBBBBBB),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
            const Divider(),
            Row(
              children: [
                CustomText(
                  text: "01",
                  color: const Color(0xff272727),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Image.asset(
                  'assets/home_page/tuitorial_one.png',
                  height: 63,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Introduction",
                      color: const Color(0xff272727),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: "0:35 mints",
                      color: const Color(0xff565656),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
