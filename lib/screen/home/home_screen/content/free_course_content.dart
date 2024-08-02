import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/home/see_all_screen/see_all_screen.dart';
import 'package:lms/screen/home/widgets/course_title.dart';
import 'package:lms/screen/home/widgets/free_courses_content.dart';

class FreeCourseContent extends StatelessWidget {
  final HomeProvider? provider;
  const FreeCourseContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Visibility(
        visible: provider?.freeClasses?.isEmpty ?? false ? false : true,
        child: Column(
          children: [
            CourseTitle(
              title: "Free courses",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeAllScreen(
                          slugName: "free_courses", appBarName: "Free courses"),
                    ));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            FreeCoursesContent(freeClasses: provider?.freeClasses),
          ],
        ),
      ),
    );
  }
}
