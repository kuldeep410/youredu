import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/quizzes/quizzes_question_screen/quizzes_question_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBar(appBarName: 'Quizzes'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: const Color(0xffF5F5F5),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Adobe Illustrator',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.title,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec id arcu, tristique sed. Pulvinar diam, eget tempor sed mattis eu.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.body,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomText(
                      text: '30 Questions',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBg,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: '15 Minutes',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButtonWidget(
                      text: 'Start Now',
                      onPressed: () {
                        NavUtil.navigateScreen(
                            context, const QuizzesQuestionScreen());
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              color: const Color(0xffF5F5F5),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Adobe Illustrator',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.title,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec id arcu, tristique sed. Pulvinar diam, eget tempor sed mattis eu.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.body,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomText(
                      text: '30 Questions',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBg,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: '15 Minutes',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButtonWidget(
                      text: 'Start Now',
                      onPressed: () {
                        NavUtil.navigateScreen(
                            context, const QuizzesQuestionScreen());
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        )

        // const QuizzesCart(),
        );
  }
}


//  ? Image.asset(
//                                     'assets/home_page/check_round.png',
//                                     height: 16,
//                                     width: 16,
//                                   )
//                                 : Image.asset(
//                                     'assets/home_page/check_filled.png',
//                                     height: 16,
//                                     width: 16,
//                                   )),