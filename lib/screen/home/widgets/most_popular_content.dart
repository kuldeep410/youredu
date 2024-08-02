import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/most_popular_cart.dart';

class MostPopularContent extends StatelessWidget {
  final List<dynamic>? courses;
  final String? userId;

  const MostPopularContent({Key? key, this.courses, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: courses?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisExtent: 272.h,
            mainAxisSpacing: 16.h),
        itemBuilder: (context, index) {
          return CoursesCart(
            userId: userId,
            id: courses?[index].id,
            assetImage: courses?[index].image ?? "",
            title: courses?[index].title.toString() ?? "",
            price: courses?[index].price.toString() ?? "",
            review: courses?[index].reviewCount ?? 0,
            isBookmark: courses?[index].isBookmark,
            isPurchased: courses?[index].isPurchased,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        //  CourseDetailsWebView(courseId: courses?[index].id,)
                        CourseDetailsScreen(id: courses?[index].id),
                  ));
            },
          );
        });
  }
}
