import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/widgets/category_grid_view_cart.dart';

class GraphicsContent extends StatelessWidget {
  const GraphicsContent({
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
            image: 'assets/category/graphics_one.png',
            categoryTitle: "Ilistator",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_two.png',
            categoryTitle: "Animation",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_three.png',
            categoryTitle: "Vector",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_four.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_two.png',
            categoryTitle: "Admission",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_one.png',
            categoryTitle: "Photoshop",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_four.png',
            categoryTitle: "Animation",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/graphics_three.png',
            categoryTitle: "Figma",
          ),
        ],
      ),
    );
  }
}
