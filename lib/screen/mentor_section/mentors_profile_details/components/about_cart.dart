import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class AboutCart extends StatelessWidget {
  final MentorsDetailsResponse? mentorsDetailsResponse;
  const AboutCart({Key? key, this.mentorsDetailsResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            mentorsDetailsResponse
                        ?.data?.instructor?.about?.designation?.isNotEmpty ==
                    true
                ? CustomText(
                    text: mentorsDetailsResponse
                            ?.data?.instructor?.about?.designation ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )
                : CustomText(
                    text: 'About Not Found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: 'Experiences',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
            SizedBox(
              height: 12.h,
            ),
            mentorsDetailsResponse?.data?.instructor?.about?.experiences?[0]
                        .description?.isNotEmpty ==
                    true
                ? CustomText(
                    text: mentorsDetailsResponse?.data?.instructor?.about
                            ?.experiences?[0].description ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )
                : CustomText(
                    text: 'No Experiences Found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              text: 'Education',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.title,
            ),
            SizedBox(
              height: 12.h,
            ),
            mentorsDetailsResponse?.data?.instructor?.about?.educations?[0]
                        .description?.isNotEmpty ==
                    true
                ? CustomText(
                    text: mentorsDetailsResponse?.data?.instructor?.about
                            ?.educations?[0].description ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.body,
                  )
                : CustomText(
                    text: 'No Data Found',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.body,
                  ),
          ],
        ),
      ),
    );
  }
}
