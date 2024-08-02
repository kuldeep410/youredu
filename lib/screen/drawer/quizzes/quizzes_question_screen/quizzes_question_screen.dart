import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/quizzes/quize_result/quize_result_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class QuizzesQuestionScreen extends StatefulWidget {
  const QuizzesQuestionScreen({super.key});

  @override
  State<QuizzesQuestionScreen> createState() => _QuizzesQuestionScreenState();
}

class _QuizzesQuestionScreenState extends State<QuizzesQuestionScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Quizzes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Q1.',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.title,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: CustomText(
                    text: 'How to undo in Adobe Photoshop CC 2022 ?',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffD9D9D9)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: _value
                              ? const Icon(
                                  Icons.check,
                                  size: 15.0,
                                  color: AppColors.primaryBg,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 15.0,
                                  color: Color(0xffD9D9D9),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CustomText(
                      text: 'A.',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.title,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomText(
                      text: 'Ctrl+C',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6F767E),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 10.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        CustomText(
                          text: 'Previous Question',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    NavUtil.navigateScreen(context, const QuizeResultScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 10.h),
                      child: Row(
                        children: [
                          CustomText(
                            text: 'Next',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
