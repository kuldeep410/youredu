import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/category/category_course_list/category_course_list_screen.dart';
import 'package:lms/screen/home/category/see_all_category/see_all_category_provider.dart';
import 'package:lms/screen/home/category/widgets/category_grid_view_cart.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class SeeAllCategory extends StatelessWidget {
  const SeeAllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeeAllCategoryProvider(),
      child: Consumer<SeeAllCategoryProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'All Category'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.h,
                      child: GridView.builder(
                        itemCount: provider.categories?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context,
                                  CategoryCourseListPage(
                                    categoryId: provider.categories?[index].id,
                                  ));
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryGridViewCart(
                                  image: provider.categories?[index].icon,
                                  categoryTitle:
                                      provider.categories?[index].title,
                                ),
                              ),
                            ),
                          );
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisExtent: 120.h,
                            mainAxisSpacing: 8),
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                    ),
                    // ///////high school//////////

                    // /////////ENGINEERING/////////
                    // CustomText(
                    //   text: "ENGINEERING",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const EngineeringContent(),
                    // /////////DATA SCIENCE/////////
                    // CustomText(
                    //   text: "DATA SCIENCE",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const DataScienceContent(),
                    // /////////Grapics Design///////
                    // CustomText(
                    //   text: "Graphic Design",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const GraphicsContent(),
                    // /////////Digital Marketing///////
                    // CustomText(
                    //   text: "Digital Marketing",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const DigitalMarketingContent(),
                    // /////////WEB DESIGN & DEVELOPEMENT///////
                    // CustomText(
                    //   text: "WEB DESIGN & DEVELOPEMENT",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const WebDevelopmentContent(), /////////FLUTTER MOBILE APP DEVELOPEMENT///////
                    // CustomText(
                    //   text: "FLUTTER MOBILE APP DEVELOPEMENT",
                    //   color: AppColors.primary,
                    //   fontSize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // const FlutterDevelopmentContent(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
