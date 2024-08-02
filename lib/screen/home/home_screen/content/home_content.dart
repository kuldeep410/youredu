import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/content/best_rated_content.dart';
import 'package:lms/screen/home/home_screen/content/best_selling_content.dart';
import 'package:lms/screen/home/home_screen/content/featured_content.dart';
import 'package:lms/screen/home/home_screen/content/free_course_content.dart';
import 'package:lms/screen/home/home_screen/content/home_carosul_slider.dart';
import 'package:lms/screen/home/home_screen/content/home_shimmer.dart';
import 'package:lms/screen/home/home_screen/content/latest_course_content.dart';
import 'package:lms/screen/home/home_screen/content/most_popular_cart.dart';
import 'package:lms/screen/home/home_screen/content/recommended_content.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';

class HomeContent extends StatelessWidget {
  final HomeProvider? provider;
  const HomeContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return provider?.sliders?.isNotEmpty == true
        ? Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeCarosulSlider(
                    provider: provider,
                  ),
                  FeaturedContent(
                    provider: provider,
                  ),
                  MostPopularCart(
                    provider: provider,
                  ),
                  LatestCourseContent(
                    provider: provider,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FreeCourseContent(
                    provider: provider,
                  ),
                  BestRatedContent(
                    provider: provider,
                  ),
                  BestSellingContent(
                    provider: provider,
                  ),
                ],
              ),
              RecommendedContent(
                provider: provider,
              ),
            ],
          )
        : const HomeShimmer();
  }
}
