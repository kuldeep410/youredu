import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/home_screen/content/best_rated_content.dart';
import 'package:lms/screen/home/home_screen/content/best_selling_content.dart';
import 'package:lms/screen/home/home_screen/content/featured_content.dart';
import 'package:lms/screen/home/home_screen/content/free_course_content.dart';
import 'package:lms/screen/home/home_screen/content/home_carosul_slider.dart';
import 'package:lms/screen/home/home_screen/content/latest_course_content.dart';
import 'package:lms/screen/home/home_screen/content/most_popular_cart.dart';
import 'package:lms/screen/home/home_screen/content/recommended_content.dart';
import 'package:lms/screen/home/home_screen/home_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      FeaturedContent(
                        provider: provider,
                      ),
                      HomeCarosulSlider(
                        provider: provider,
                      ),
                      MostPopularCart(
                        provider: provider,
                      ),
                      LatestCourseContent(
                        provider: provider,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
