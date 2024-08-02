import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/see_all_response/see_all_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/widgets/enrole_now_button.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class SeeAllCart extends StatelessWidget {
  final Function()? onTap;
  final Datum? data;

  const SeeAllCart({
    Key? key,
    this.data,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  height: 140.h,
                  fit: BoxFit.cover,
                  imageUrl: data?.image ?? '',
                  placeholder: (context, url) => Center(
                    child: Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/home_page/ic_no_image.png"),
                ),
              ),
              SizedBox(
                height: 6.sp,
              ),
              CustomText(
                text: data?.title ?? "",
                maxLine: 3,
                color: AppColors.title,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 6.sp,
              ),
              RichText(
                text: TextSpan(
                    text: data?.price.toString() ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: "  (${data?.reviewCount.toString()} Reviews)",
                        style: TextStyle(
                            color: AppColors.body,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        EnroleNowButton(
          onTouch: () {
            NavUtil.navigateScreen(
                context,
                CourseDetailsScreen(
                  id: data?.id,
                ));
          },
        ),
      ],
    );
  }
}
