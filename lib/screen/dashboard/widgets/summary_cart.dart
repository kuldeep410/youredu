import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class SummaryCart extends StatelessWidget {
  final String? total, type, title, image;
  const SummaryCart({Key? key, this.title, this.total, this.type, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary.withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            // 'assets/home_page/dash_one.png',
            height: 38.h,
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: total,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.title,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                text: type,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.body,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.body,
          ),
        ],
      ),
    );
  }
}
