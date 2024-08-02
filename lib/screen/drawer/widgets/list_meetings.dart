import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class ListMeetings extends StatelessWidget {
  final String? meetingsTime;
  const ListMeetings({Key? key, this.meetingsTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: meetingsTime,
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
            const Spacer(),
            const SizedBox(
                height: 40,
                child: Row(children: [
                  VerticalDivider(
                    color: AppColors.primary,
                    thickness: 1, //thickness of divier line
                  ),
                ])),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Meeting with Demo one',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.title,
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomText(
                  text: '8:00 AM, Badda',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.body,
                ),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
