import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class ReviewsCart extends StatelessWidget {
  final MentorsDetailsResponse? mentorsDetailsResponse;
  const ReviewsCart({Key? key, this.mentorsDetailsResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 43.h,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: mentorsDetailsResponse
                                ?.data?.instructor?.reviews?.rating
                                .toString() ??
                            '',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.title,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomText(
                        text:
                            'Based on ${mentorsDetailsResponse?.data?.instructor?.reviews?.reviewCount ?? ''} Reviews',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.body,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RatingBarIndicator(
                        rating: double.parse(
                            "${mentorsDetailsResponse?.data?.instructor?.reviews?.rating ?? 0.0}"),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: '5 star',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'assets/mentors/Bar5.png',
                            height: 8.h,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '4 star',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'assets/mentors/Bar4.png',
                            height: 8.h,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '3 star',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'assets/mentors/Bar3.png',
                            height: 8.h,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '2 star',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'assets/mentors/Bar2.png',
                            height: 8.h,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '1 star',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'assets/mentors/Bar1.png',
                            height: 8.h,
                          )
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
