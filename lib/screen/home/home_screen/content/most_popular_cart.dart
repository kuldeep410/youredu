import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/home/see_all_screen/see_all_screen.dart';
import 'package:lms/screen/home/widgets/most_popular_content.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class MostPopularCart extends StatelessWidget {
  final HomeProvider? provider;
  const MostPopularCart({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: provider?.featuredClasses?.isNotEmpty == true ? true : false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeAllScreen(
                          slugName: "featured_courses",
                          appBarName: "Most Popular Course"),
                    ));
              },
              child: Row(
                children: [
                  CustomText(
                    text: "Most Popular Course",
                    color: AppColors.title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  CustomText(
                    text: "See all",
                    color: AppColors.body,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            MostPopularContent(
              userId: provider?.userId,
              courses: provider?.featuredClasses,
            ),
            /////// Newest Course //////////
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
