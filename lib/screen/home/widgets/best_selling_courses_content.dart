import 'package:flutter/material.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/best_selling_courses_cart.dart';

class BestSellingCoursesContent extends StatelessWidget {
  final List<Course>? bestSellers;

  const BestSellingCoursesContent({Key? key, this.bestSellers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: bestSellers?.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return BestSellingCoursesCart(
            image: bestSellers?[index].image ?? "",
            courseTitle: bestSellers?[index].title ?? "",
            price: bestSellers?[index].price,
            reviewCount: bestSellers?[index].reviewCount ?? 0,
            rate: bestSellers?[index].rate,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsScreen(id: bestSellers?[index].id),
                  ));
            },
          );
        },
      ),
    );
  }
}
