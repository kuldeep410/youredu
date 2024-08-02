import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/widgets/reommanded_course_content.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/search_field.dart';

class RecommendedCourseDetails extends StatelessWidget {
  const RecommendedCourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Recommended'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.w),
          child: Column(
            children: [
              const SearchField(),
              SizedBox(
                height: 36.h,
              ),
              const RecommendedCourseContent(),
              SizedBox(
                height: 25.h,
              ),
              const RecommendedCourseContent(),
              SizedBox(
                height: 25.h,
              ),
              const RecommendedCourseContent(),
            ],
          ),
        ),
      ),
    );
  }
}
