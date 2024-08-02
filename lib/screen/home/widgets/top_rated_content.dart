import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/screen/home/widgets/top_rated_courses_cart.dart';

import '../course_details/course_details_screen/course_details_screen.dart';

class TopRatedContent extends StatelessWidget {
  final List<Course>? bestRates;

  const TopRatedContent({Key? key, this.bestRates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisExtent: 210.h,
            mainAxisSpacing: 24),
        itemCount: bestRates?.length ?? 0,
        itemBuilder: (context, index) {
          return TopRatedCourses(
            image: bestRates?[index].image ?? "",
            amount: bestRates?[index].price,
            title: bestRates?[index].title ?? "",
            subTitle: bestRates?[index].courseCreator ?? "",
            rate: bestRates?[index].rate.toString() ?? "",
            reviewsCount: bestRates?[index].reviewCount ?? 0,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsScreen(id: bestRates?[index].id),
                  ));
            },
          );
        },
      ),
    );
  }
}
