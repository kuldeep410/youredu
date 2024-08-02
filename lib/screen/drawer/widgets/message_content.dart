import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class MessageContent extends StatelessWidget {
  const MessageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MessageCart(),
        MessageCart(),
        MessageCart(),
      ],
    );
  }
}

class MessageCart extends StatelessWidget {
  const MessageCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/mentors/message_icon.png',
              height: 48.h,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: 'Darlene Steward',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text: 'Pls take a look at the images.',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.body,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
