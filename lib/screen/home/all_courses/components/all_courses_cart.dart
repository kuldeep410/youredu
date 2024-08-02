// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/all_courses_response/all_courses_response.dart';
import 'package:lms/screen/auth/splash_screen/base_settings_provider.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AllCoursesCart extends StatelessWidget {
  final Datum? data;
  final Function()? onTap;

  const AllCoursesCart({
    this.onTap,
    this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final settingProvider = context.watch<BaseSettingsProvider>();

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  height: 110.h,
                  width: double.infinity,
                  imageUrl: data?.image.toString() ?? '',
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
                      maxLine: 3,
                      text: data?.title ?? '',
                      color: AppColors.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText(
                      text: data?.courseCreator ?? '',
                      color: AppColors.body,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: '₹ ${data?.price.toString()}' ?? '',
                          color: AppColors.body,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
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
                          text: '(${data?.reviewCount ?? ''})',
                          color: AppColors.body,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // CustomText(
                    //   text: data?.price.toString() ?? '',
                    //   color: AppColors.title,
                    //   fontSize: 14.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    SizedBox(
                      height: 0.h,
                    ),
                    // settingProvider
                    //             .baseSettingsResponse?.data?.paymentGateway ==
                    //         "1"
                    //     ?
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(0.w, 28.h),
                        side: const BorderSide(
                            width: 1.0, color: AppColors.primary),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailsScreen(
                                id: data?.id,
                              ),
                            ));
                      },
                      child: Center(
                        child: data?.isPurchased == true
                            ? CustomText(
                                text: 'Play Now',
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              )
                            : CustomText(
                                text: 'Enroll Now',
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    )
                    // : const SizedBox()
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
