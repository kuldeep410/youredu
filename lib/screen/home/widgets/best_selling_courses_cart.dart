import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class BestSellingCoursesCart extends StatelessWidget {
  final String? image, courseTitle, title;
  final int? reviewCount, price;
  final double? rate;
  final Function()? onTap;

  const BestSellingCoursesCart(
      {Key? key,
      this.image,
      this.courseTitle,
      this.onTap,
      this.title,
      this.rate,
      this.reviewCount,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 6.h),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                height: 88.h,
                width: 150.w,
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
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: courseTitle ?? "",
                    color: AppColors.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    maxLine: 3,
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
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 20),
                        child: CustomText(
                          text: "$rate",
                          maxLine: 3,
                          color: AppColors.title,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      CustomText(
                        text: '($reviewCount Reviews)',
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
