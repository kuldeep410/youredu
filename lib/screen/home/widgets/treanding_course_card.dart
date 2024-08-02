// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/splash_screen/base_settings_provider.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class TrendingCoursesCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? rate;
  final int? reviewCount;
  final String? price;
  final String? userId;
  final Function()? onTap;
  final int? id;
  final bool? isPurchased;

  const TrendingCoursesCard({
    this.onTap,
    this.userId,
    this.image,
    this.title,
    this.rate,
    this.reviewCount,
    this.subTitle,
    this.price,
    this.id,
    this.isPurchased,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final settingProvider = context.watch<BaseSettingsProvider>();

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  height: 100.h,
                  fit: BoxFit.cover,
                  imageUrl: image ?? "",
                  placeholder: (context, url) => Center(
                    child: Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/home_page/ic_no_image.png"),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title ?? "",
                      color: AppColors.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      maxLine: 3,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText(
                      text: subTitle ?? "",
                      color: AppColors.body,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      maxLine: 3,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 20),
                          child: CustomText(
                            maxLine: 3,
                            text: rate ?? "",
                            color: AppColors.body,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Image.asset(
                          'assets/trending_courses/star_vector.png',
                          height: 13.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        CustomText(
                          text:
                              "  (${reviewCount?.toStringAsFixed(0)} Reviews)",
                          color: AppColors.body,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: "\₹ $price",
                      color: AppColors.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    // settingProvider
                    //             .baseSettingsResponse?.data?.paymentGateway ==
                    //         "1"
                    // ?
                    isPurchased == true
                        ? OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(0.w, 28.h),
                              side: const BorderSide(
                                  width: 1.0, color: AppColors.primary),
                            ),
                            onPressed: () {
                              NavUtil.navigateScreen(
                                  context,
                                  CourseDetailsWebView(
                                    courseId: id,
                                    userId: userId,
                                  ));
                            },
                            child: Center(
                              child: CustomText(
                                text: 'Play Now',
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(0.w, 28.h),
                              side: const BorderSide(
                                  width: 1.0, color: AppColors.primary),
                            ),
                            onPressed: () {
                              NavUtil.navigateScreen(
                                  context,
                                  CourseDetailsScreen(
                                    id: id,
                                  ));
                            },
                            child: Center(
                              child: CustomText(
                                text: 'Enroll Now',
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                    // : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
