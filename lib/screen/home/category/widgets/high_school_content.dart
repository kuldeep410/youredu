import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/widgets/category_grid_view_cart.dart';

class HighSchoolContent extends StatelessWidget {
  final List<dynamic>? categories;
  const HighSchoolContent({
    Key? key,this.categories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisExtent: 120.h,
            mainAxisSpacing: 8),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CategoryGridViewCart(
            image: 'assets/category/high_school_one.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_two.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_three.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_four.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_five.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_six.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_seven.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/high_school_eight.png',
            categoryTitle: "Admission",
          ),
        ],
      ),
    );
  }
}
