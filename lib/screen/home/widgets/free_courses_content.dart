import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/free_courses_cart.dart';

class FreeCoursesContent extends StatelessWidget {
  final List<Course>? freeClasses;
  const FreeCoursesContent({Key? key, this.freeClasses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisExtent: 240.h,
            mainAxisSpacing: 15),
        itemCount: freeClasses?.length ?? 0,
        itemBuilder: (context, index) {
          return FreeCoursesCart(
            image: freeClasses?[index].image ?? "",
            title: freeClasses?[index].title ?? "",
            subTitle: freeClasses?[index].courseCreator.toString(),
            price: freeClasses?[index].price,
            reviewCount: freeClasses?[index].reviewCount ?? 0,
            rate: freeClasses?[index].rate ?? 0,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsScreen(id: freeClasses?[index].id),
                  ));
            },
          );
        },
      ),
    );
  }
}
