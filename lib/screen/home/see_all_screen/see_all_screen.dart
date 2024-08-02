import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/see_all_screen/components/see_all_cart.dart';
import 'package:lms/screen/home/see_all_screen/see_all_screen_provider.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class SeeAllScreen extends StatelessWidget {
  final String? slugName;
  final String? appBarName;
  const SeeAllScreen({Key? key, this.slugName, this.appBarName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeeAllScreenProvider(slugName),
      child: Consumer<SeeAllScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(
                appBarName: appBarName ?? 'See All',
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                child: GridView.builder(
                    itemCount: provider.seeAllResponse?.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisExtent: 250.h,
                        mainAxisSpacing: 16.h),
                    itemBuilder: (context, index) {
                      final data = provider.seeAllResponse?.data?[index];
                      return SeeAllCart(
                        data: data,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(
                                  id: data?.id,
                                ),
                              ));
                        },
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
