import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Comments'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              Row(
                children: [
                  Image.asset(
                    'assets/mentors/comments_icon.png',
                    height: 24,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomText(
                    text: 'Add Comment',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
              const Divider(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: 'Comments',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/mentors/up_down_icon.png',
                    height: 18,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: 20.h,
              ),
              const CommentsCart(
                image: 'assets/mentors/comments_one.png',
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              const CommentsCart(
                image: 'assets/mentors/comments_two.png',
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              const CommentsCart(
                image: 'assets/mentors/comments_one.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentsCart extends StatelessWidget {
  final String? image;
  const CommentsCart({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image!,
              // 'assets/mentors/comments_one.png',
              height: 44.h,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              children: [
                CustomText(
                  text: 'Huge Jackman',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Image.asset(
                  "assets/mentors/star_vector.png",
                  height: 15.h,
                )
              ],
            ),
            const Spacer(),
            CustomText(
              text: '2 days ago',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.body,
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomText(
          text:
              'The shoe runs really, really big!! I usually take an 11 for Nike, but this is really huge!',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.body,
        ),
      ],
    );
  }
}
