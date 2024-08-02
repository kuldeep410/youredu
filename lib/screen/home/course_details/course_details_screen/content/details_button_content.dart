import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_provider.dart';
import 'package:lms/screen/home/course_details/payment_list/payment_method.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class DetailsButtonContent extends StatelessWidget {
  final CourseDetailsProvider? provider;
  const DetailsButtonContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        provider?.isProduct == false
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 30, left: 25, right: 25),
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: provider?.courseDetailsResponse?.data?.details
                                  ?.isDiscount
                                  .toString() ??
                              "",
                          color: AppColors.title,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          provider?.courseDetailsResponse?.data?.details?.price
                                  .toString() ??
                              "",
                          style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough),
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        // provider.cartAddApi(id, context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.0.w, vertical: 15.h),
                        child: CustomText(
                          text: "Buy Course",
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              )
            :
            // : settingProvider
            //             .baseSettingsResponse?.data?.paymentGateway ==
            //         "1"
            // ?
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 30, left: 25, right: 25),
                color: Colors.grey.shade200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    if (provider?.courseDetailsResponse?.data?.details
                            ?.isPurchased ==
                        true) {
                      NavUtil.navigateScreen(
                          context,
                          CourseDetailsWebView(
                            courseId: provider
                                ?.courseDetailsResponse?.data?.details?.id,
                            userId: provider?.userId,
                          )
                          //  LearningScreen(url: "https://academy.onesttech.com/course/learning-course/${provider.slugName}")
                          );
                    } else {
                      // provider.getCourseEnrollApi(id,context,provider.slugName);
                      NavUtil.navigateScreen(
                          context,
                          PaymentMethod(
                            courseId: provider
                                ?.courseDetailsResponse?.data?.details?.id,
                          ));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 28.0.w, vertical: 15.h),
                    child: provider?.courseDetailsResponse?.data?.details
                                ?.isPurchased ==
                            true
                        ? CustomText(
                            text: "Start Learning",
                            // text: provider.bottomName,
                            color: AppColors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          )
                        : CustomText(
                            text: "Buy Course",
                            // text: provider.bottomName,
                            color: AppColors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
              ),
      ],
    );
  }
}
