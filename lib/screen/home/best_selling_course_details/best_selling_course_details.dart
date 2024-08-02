import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/widgets/best_selling_courses_content.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/search_field.dart';

class BestSellingCourseDetails extends StatelessWidget {
  const BestSellingCourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Best Selling Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.w, top: 20.h),
              child: const SearchField(),
            ),
            SizedBox(
              height: 20.h,
            ),
            const BestSellingCoursesContent(),
            SizedBox(
              height: 15.h,
            ),
            const BestSellingCoursesContent(),
            SizedBox(
              height: 15.h,
            ),
            const BestSellingCoursesContent(),
          ],
        ),
      ),
    );
  }
}
