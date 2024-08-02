import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGridViewCart extends StatelessWidget {
  final String? image, categoryTitle;

  const CategoryGridViewCart({Key? key, this.image, this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 60.h,
          fit: BoxFit.cover,
          imageUrl: image ?? "",
          placeholder: (context, url) => Center(
            child: Image.asset("assets/home_page/ic_no_image.png"),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          categoryTitle ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ],
    );
  }
}
