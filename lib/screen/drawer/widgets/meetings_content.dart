import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class MeetingsContent extends StatelessWidget {
  const MeetingsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MettingsCart(),
          SizedBox(
            height: 16.h,
          ),
          const MettingsCart(),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

class MettingsCart extends StatelessWidget {
  const MettingsCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xffF5F5F5),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '06:00 pm',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.title,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomText(
                          text: 'sunday',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.body,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    const SizedBox(
                        height: 50,
                        child: Row(children: [
                          VerticalDivider(
                            color: Color(0xffD8D8D8),
                            thickness: 1, //thickness of divier line
                          ),
                        ])),
                    SizedBox(
                      width: 19.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Design thinking',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.title,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomText(
                          text: 'Maimuna, Dubai',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.body,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.primary)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0.w, vertical: 8.h),
                        child: CustomText(
                          text: 'See Meeting Details',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.0.w, vertical: 8.5.h),
                        child: CustomText(
                          text: 'Join Meeting',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
