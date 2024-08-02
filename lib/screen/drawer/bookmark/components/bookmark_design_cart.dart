import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/bookmark_response/bookmark_list_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/enrole_now_button.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class BookmarkDesignCart extends StatelessWidget {
  final Bookmark? bookmarkResponse;
  final Function()? onTap;

  const BookmarkDesignCart({Key? key, this.onTap, this.bookmarkResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 20.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                height: 110.h,
                width: 150.w,
                fit: BoxFit.cover,
                imageUrl: bookmarkResponse?.image ?? "",
                placeholder: (context, url) => Center(
                  child: Image.asset("assets/home_page/ic_no_image.png"),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/home_page/ic_no_image.png"),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: bookmarkResponse?.title ?? '',
                    color: AppColors.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 6.h,
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
                        text: bookmarkResponse?.rate.toString(),
                        color: AppColors.title,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      CustomText(
                        text:
                            '(${bookmarkResponse?.rate ?? 0} Reviews)',
                        color: AppColors.body,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  EnroleNowButton(
                    onTouch: () {
                      NavUtil.navigateScreen(
                          context,
                          CourseDetailsScreen(
                            id: bookmarkResponse?.id,
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
