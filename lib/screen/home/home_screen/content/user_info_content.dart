import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/screen/home/search/search_page.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class UserInfoContent extends StatelessWidget {
  final HomeProvider? provider;
  const UserInfoContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.w, top: 24.h),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
              imageUrl: provider?.userAvatar ?? '',
              placeholder: (context, url) => Center(
                child: Image.asset("assets/home_page/ic_no_image.png"),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/home_page/ic_no_image.png"),
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Hi ${provider?.userName ?? ''}",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.title,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomText(
                text: 'Welcome Back',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.body,
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            child: Image.asset(
              'assets/home_page/search_vector.png',
              height: 39.h,
              width: 39.w,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
