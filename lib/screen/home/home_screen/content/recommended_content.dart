import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/home/see_all_screen/see_all_screen.dart';
import 'package:lms/screen/home/widgets/course_title.dart';
import 'package:lms/screen/home/widgets/reommanded_course_content.dart';

class RecommendedContent extends StatelessWidget {
  final HomeProvider? provider;
  const RecommendedContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: provider?.latestClasses?.isEmpty ?? false ? false : true,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CourseTitle(
                  title: "Recommended for you",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeeAllScreen(
                              slugName: "discount_courses",
                              appBarName: "Recommended for you"),
                        ));
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                RecommendedCourseContent(
                    userId: provider?.userId,
                    latestClasses: provider?.latestClasses),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
