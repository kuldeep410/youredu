import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class MentorsDesignCart extends StatelessWidget {
  final String? image, name, title;
  final double? rating;
  final Function()? onTap;
  const MentorsDesignCart(
      {Key? key, this.image, this.name, this.title, this.onTap, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 64.h,
                width: 60.w,
                fit: BoxFit.cover,
                imageUrl: image ?? '',
                placeholder: (context, url) => Center(
                  child: Image.asset("assets/home_page/ic_no_image.png"),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/home_page/ic_no_image.png"),
              ),
            ),

            SizedBox(
              height: 12.h,
            ),
            Text(
              name ?? '',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.title,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: title ?? '',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 15.h,
            ),
            RatingBarIndicator(
              rating: rating ?? 0.0,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 16.0,
              direction: Axis.horizontal,
            ),
            // RatingBar.builder(
            //   initialRating: rating ?? 0.0,
            //   minRating: 1,
            //   itemSize: 15,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   onRatingUpdate: (rating) {
            //     print(rating);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
