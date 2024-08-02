import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class MeetingsDetails extends StatelessWidget {
  const MeetingsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Meetings Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: 'Design Thinking',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.title,
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.body,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.body,
              ),
              SizedBox(
                width: 9.w,
              ),
              CustomText(
                text: 'Sunday,Mar 13, 2022',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.body,
              ),
              SizedBox(
                width: 20.w,
              ),
              const Icon(
                Icons.timer,
                color: AppColors.body,
              ),
              SizedBox(
                width: 9.w,
              ),
              CustomText(
                text: 'S06:00 pm',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.body,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            text: 'Meeting with',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.title,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.body,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Maimuna Binte Rashid',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.title,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomText(
                    text: 'Dubai',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.body,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff08C5DA)),
                color: const Color(0xff08C5DA).withOpacity(0.2)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 14.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/home_page/info_vector.png',
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: CustomText(
                      text:
                          'This visit was not scheduled for today. If you still want  If you still want If you still want.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.title,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButtonWidget(
            onPressed: () {},
            text: "Join Meeting",
          )
        ]),
      ),
    );
  }
}
