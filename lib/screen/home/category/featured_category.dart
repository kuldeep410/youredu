import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/category_course_list/category_course_list_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class FeaturedCategory extends StatelessWidget {
  final List<dynamic>? categories;

  const FeaturedCategory({Key? key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories?.length ?? 0,
        itemBuilder: (context, index) {
          var categoriesData = categories?[index];
          return InkWell(
            onTap: () {
              NavUtil.navigateScreen(
                  context,
                  CategoryCourseListPage(
                    categoryId: categoriesData?.id,
                  ));
            },
            child: FeaturedCategoryCart(
                image: categoriesData?.icon, text: categoriesData?.title),
          );
        },
      ),
    );
  }
}

class FeaturedCategoryCart extends StatelessWidget {
  final String? image, text;

  const FeaturedCategoryCart({Key? key, this.image, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: 50.h,
              fit: BoxFit.cover,
              imageUrl: image ?? "",
              placeholder: (context, url) => Center(
                child: Image.asset("assets/home_page/ic_no_image.png"),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/home_page/ic_no_image.png"),
            ),
          ),
          // Image.asset(
          //   image!,
          //   height: 60.h,
          // ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text: text,
            color: AppColors.title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
