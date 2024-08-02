import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/widgets/most_popular_content.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/search_field.dart';

class MostPopularCourseScreen extends StatelessWidget {
  const MostPopularCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Most Popular Courses'),
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
              const MostPopularContent(),
              SizedBox(
                height: 25.h,
              ),
              const MostPopularContent(),
              SizedBox(
                height: 25.h,
              ),
              const MostPopularContent(),
            ],
          ),
        ),
      ),
    );
  }
}
