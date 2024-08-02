import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/screen/auth/splash_screen/base_settings_provider.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/screen/home/widgets/enrole_now_button.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class RecommendedCourseContent extends StatelessWidget {
  final String? userId;
  final List<Course>? latestClasses;
  const RecommendedCourseContent({Key? key, this.latestClasses, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final settingProvider = context.watch<BaseSettingsProvider>();
    return SizedBox(
      child: GridView.builder(
        itemCount: latestClasses?.length ?? 0,
        itemBuilder: (context, index) {
          final data = latestClasses?[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CourseDetailsScreen(id: latestClasses?[index].id),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      height: 140.h,
                      fit: BoxFit.cover,
                      imageUrl: data?.image ?? '',
                      placeholder: (context, url) => Center(
                        child: Image.asset("assets/home_page/ic_no_image.png"),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/home_page/ic_no_image.png"),
                    ),
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
                          text: data?.title ?? '',
                          color: AppColors.title,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          maxLine: 3,
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
                              text: data?.rate?.toStringAsFixed(1) ?? '',
                              color: AppColors.title,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            CustomText(
                              text: '(${data?.reviewCount ?? ''} Reviews)',
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CustomText(
                        //   text: "\$${data?.price.toString()}",
                        //   color: AppColors.title,
                        //   fontSize: 16.sp,
                        //   fontWeight: FontWeight.w700,
                        // ),
                        // const Spacer(),
                        // settingProvider.baseSettingsResponse?.data
                        //             ?.paymentGateway ==
                        //         "1"
                        // ?
                        data?.isPurchased == true
                            ? EnroleNowButton(
                                text: "Play Now",
                                onTouch: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CourseDetailsWebView(
                                                courseId: data?.id,
                                                userId: userId,
                                              )));
                                },
                              )
                            : EnroleNowButton(
                                onTouch: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetailsScreen(
                                                id: latestClasses?[index].id),
                                      ));
                                },
                              )
                        // : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisExtent: 275.h,
            mainAxisSpacing: 24),
      ),
    );
  }
}
