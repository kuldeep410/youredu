import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/widgets/category_grid_view_cart.dart';

class DigitalMarketingContent extends StatelessWidget {
  const DigitalMarketingContent({
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
            image: 'assets/category/marketing_one.png',
            categoryTitle: "Linkdin",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_two.png',
            categoryTitle: "Reddit",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_three.png',
            categoryTitle: "Meta",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_four.png',
            categoryTitle: "Twitter",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_five.png',
            categoryTitle: "Apple",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_six.png',
            categoryTitle: "Skills",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_seven.png',
            categoryTitle: "Art",
          ),
          const CategoryGridViewCart(
            image: 'assets/category/marketing_eight.png',
            categoryTitle: "Social",
          ),
        ],
      ),
    );
  }
}
