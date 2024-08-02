import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/home/see_all_screen/see_all_screen.dart';
import 'package:lms/screen/home/widgets/best_selling_courses_content.dart';
import 'package:lms/screen/home/widgets/course_title.dart';

class BestSellingContent extends StatelessWidget {
  final HomeProvider? provider;
  const BestSellingContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: provider?.bestSellers?.isEmpty ?? false ? false : true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                CourseTitle(
                  title: "Best Selling Courses",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeeAllScreen(
                            slugName: "best_selling_courses",
                            appBarName: "Best Selling Courses",
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BestSellingCoursesContent(bestSellers: provider?.bestSellers),
      ],
    );
  }
}
