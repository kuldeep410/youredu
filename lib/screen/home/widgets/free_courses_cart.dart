// ignore_for_file: unnecessary_string_escapes

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class FreeCoursesCart extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  final double? rate;
  final int? reviewCount;
  final int? price;
  final Function()? onTap;

  const FreeCoursesCart({
    Key? key,
    this.onTap,
    this.image,
    this.title,
    this.rate,
    this.reviewCount,
    this.subTitle,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
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
              height: 10.h,
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
                    height: 8.h,
                  ),
                  Wrap(
                    children: [
                      CustomText(
                        text: 'by',
                        color: AppColors.body,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      CustomText(
                        text: subTitle ?? "",
                        maxLine: 3,
                        color: AppColors.body,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                children: [
                  CustomText(
                    text: "\₹ ${price.toString()}",
                    color: AppColors.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 27.w,
                  ),
                  CustomText(
                    text: 'See Details',
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
