import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class HomeCarosulSlider extends StatelessWidget {
  final HomeProvider? provider;
  const HomeCarosulSlider({
    super.key,
    this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.sp,
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: PageView.builder(
              clipBehavior: Clip.none,
              itemCount: provider?.sliders?.length ?? 0,
              onPageChanged: (int? index) {
                provider?.changePage(index);
              },
              itemBuilder: (_, index) {
                return InkWell(
                  // onTap: () {
                  //   NavUtil.navigateScreen(
                  //       context,
                  //       SliderListScreen(
                  //           sliderId:
                  //               provider.sliderList[index].id));
                  // },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: provider?.sliders?[index].image ?? "",
                      placeholder: (context, url) => Center(
                        child: Image.asset("assets/home_page/ic_no_image.png"),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/home_page/ic_no_image.png"),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Center(
            child: CarouselIndicator(
              height: 10.h,
              color: const Color(0xffEAEAEA),
              animationDuration: 300,
              activeColor: const Color(0xff928EF3),
              count: provider!.sliderList.isEmpty
                  ? 1
                  : provider?.sliderList.length,
              index: provider?.pageIndex ?? 0,
            ),
          ),
          // SizedBox(
          //   height: 20.sp,
          // ),
        ],
      ),
    );
  }
}
