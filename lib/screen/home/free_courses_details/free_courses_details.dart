import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/widgets/free_courses_content.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/search_field.dart';

class FreeCoursesDetails extends StatelessWidget {
  const FreeCoursesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Free Courses'),
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
              const FreeCoursesContent(),
              SizedBox(
                height: 25.h,
              ),
              const FreeCoursesContent(),
              SizedBox(
                height: 25.h,
              ),
              const FreeCoursesContent(),
            ],
          ),
        ),
      ),
    );
  }
}
