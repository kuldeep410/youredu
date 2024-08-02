import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/drawer_screen/drawer_screen.dart';
import 'package:lms/screen/home/widgets/treanding_course_content.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/new_app_bar.dart';
import 'package:lms/widgets/search_field.dart';

class TreandingCourseDetials extends StatelessWidget {
  final bool? isBottomNav;
  const TreandingCourseDetials({Key? key, this.isBottomNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: isBottomNav == true ?  const NewAppBar(appBarName: 'Treanding Courses')  :CustomAppBar(
            appBarName: 'Treanding Courses', isBackButton: isBottomNav),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.w),
          child: Column(
            children: [
              const SearchField(),
              SizedBox(
                height: 36.h,
              ),
              const TrendingPageContent(),
              SizedBox(
                height: 25.h,
              ),
              const TrendingPageContent(),
              SizedBox(
                height: 25.h,
              ),
              const TrendingPageContent(),
            ],
          ),
        ),
      ),
    );
  }
}
