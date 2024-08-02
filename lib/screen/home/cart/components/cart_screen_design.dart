import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/cart_response/cart_screen_response.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class CartScreenDesign extends StatelessWidget {
  final Item? cartResponse;
  final Function()? onTap;

  const CartScreenDesign({Key? key, this.onTap, this.cartResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                height: 90.h,
                width: 150.w,
                fit: BoxFit.cover,
                imageUrl: cartResponse?.webinar?.avatar ?? '',
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
                    text: cartResponse?.webinar?.title ?? '',
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
                        text: cartResponse?.user?.rate.toString() ?? "",
                        color: AppColors.title,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      CustomText(
                        text:
                            '(${cartResponse?.webinar?.reviewsCount.toString() ?? 0} Reviews)',
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
                    text: "by ${cartResponse?.webinar?.teacher ?? ""}",
                    color: AppColors.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
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
