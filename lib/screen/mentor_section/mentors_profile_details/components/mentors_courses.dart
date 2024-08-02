import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/most_popular_cart.dart';

class MentorsCourses extends StatelessWidget {
  final MentorsDetailsResponse? mentorsDetailsResponse;

  const MentorsCourses({Key? key, this.mentorsDetailsResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount:
            mentorsDetailsResponse?.data?.instructor?.courses?.length ?? 0,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisExtent: 280.h,
            mainAxisSpacing: 16.h),
        itemBuilder: (context, index) {
          final data =
              mentorsDetailsResponse?.data?.instructor?.courses?[index];
          return CoursesCart(
            assetImage: data?.image ?? '',
            title: data?.title ?? '',
            price: data?.rating.toString() ?? '',
            id: data?.id,
            review: 3,
            isBookmark: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseDetailsScreen(id: data?.id)));
            },
          );
        });
  }
}
