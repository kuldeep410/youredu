import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/widgets/category_grid_view_cart.dart';

class EngineeringContent extends StatelessWidget {
  const EngineeringContent({
    Key? key,
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
            image: 'assets/category/engineering_one.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_two.png',
            categoryTitle: "Skills",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_three.png',
            categoryTitle: "Science",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_four.png',
            categoryTitle: "Art",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_five.png',
            categoryTitle: "Skills",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_six.png',
            categoryTitle: "Science",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_seven.png',
            categoryTitle: "Art",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/engineering_8.png',
            categoryTitle: "Admission",
          ),
        ],
      ),
    );
  }
}
