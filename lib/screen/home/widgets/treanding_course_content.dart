import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/screen/home/widgets/treanding_course_card.dart';

import '../course_details/course_details_screen/course_details_screen.dart';

class TrendingPageContent extends StatelessWidget {
  final List<Course>? latestClasses;
  final String? userId;

  const TrendingPageContent({Key? key, this.latestClasses, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisExtent: 316.h,
            mainAxisSpacing: 10),
        itemCount: latestClasses?.length ?? 0,
        itemBuilder: (context, index) {
          return TrendingCoursesCard(
            image: latestClasses?[index].image ?? "",
            title: latestClasses?[index].title ?? "",
            subTitle: latestClasses?[index].courseCreator.toString(),
            reviewCount: latestClasses?[index].reviewCount ?? 0,
            rate: latestClasses?[index].rate.toString() ?? "",
            price: latestClasses?[index].price.toString(),
            id: latestClasses?[index].id,
            isPurchased: latestClasses?[index].isPurchased,
            userId: userId,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsScreen(id: latestClasses?[index].id),
                  ));
            },
          );
        },
      ),
    );
  }
}
