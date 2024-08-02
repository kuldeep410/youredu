import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/screen/home/widgets/enrole_now_button.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class CoursesCart extends StatelessWidget {
  final Function()? onTap;
  final String? assetImage;
  final String? title;
  final String? price;
  final String? userId;
  final int? review;
  final bool? isBookmark;
  final bool? isPurchased;
  final int? id;

  const CoursesCart(
      {Key? key,
      this.userId,
      this.onTap,
      this.assetImage,
      this.title,
      this.price,
      this.review,
      this.id,
      this.isPurchased,
      this.isBookmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final settingProvider = context.watch<BaseSettingsProvider>();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    height: 138.h,
                    fit: BoxFit.cover,
                    imageUrl: assetImage ?? "",
                    placeholder: (context, url) => Center(
                      child: Image.asset("assets/home_page/ic_no_image.png"),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                ),
                SizedBox(
                  height: 6.sp,
                ),
                CustomText(
                  text: title ?? "",
                  maxLine: 3,
                  color: AppColors.title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                RichText(
                  maxLines: 1,
                  text: TextSpan(
                      text: "\₹ $price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: "  (${review.toString()} Reviews)",
                          style: TextStyle(
                              color: AppColors.body,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // settingProvider.baseSettingsResponse?.data?.paymentGateway == "1"
          //     ?
          isPurchased == true
              ? EnroleNowButton(
                  text: "Play Now",
                  onTouch: () {
                    NavUtil.navigateScreen(
                        context,
                        CourseDetailsWebView(
                          courseId: id,
                          userId: userId,
                        ));
                  },
                )
              : EnroleNowButton(
                  onTouch: () {
                    NavUtil.navigateScreen(
                        context,
                        CourseDetailsScreen(
                          id: id,
                        ));
                  },
                )
          // : const SizedBox(),
        ],
      ),
    );
  }
}
