import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/all_courses/all_courses_provider.dart';
import 'package:lms/screen/home/all_courses/components/all_courses_cart.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:provider/provider.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllCoursesProvider(),
      child: Consumer<AllCoursesProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body:
                // provider.allCoursesResponse?.data?.isEmpty ??
                //         true == true
                //     ? const Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Visibility(
                //             visible: true,
                //             child: Align(
                //                 alignment: Alignment.center,
                //                 child: Text(
                //                   "All courses not found",
                //                   style: TextStyle(
                //                       fontSize: 26,
                //                       fontWeight: FontWeight.bold,
                //                       color: Colors.black26),
                //                 )),
                //           )
                //         ],
                //       )
                //     :
                SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              provider.getSearchValue(value);
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.title.withOpacity(0.3),
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.border),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Image.asset(
                                    'assets/home_page/payment/Vector.png',
                                    scale: 1.5,
                                  ),
                                ),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        // Image.asset(
                        //   'assets/home_page/payment/filter_Icon.png',
                        //   height: 47,
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      child: GridView.builder(
                        itemCount:
                            provider.allCoursesResponse?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data =
                              provider.allCoursesResponse?.data?[index];
                          return AllCoursesCart(
                            data: data,
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context,
                                  CourseDetailsScreen(
                                    id: data?.id,
                                  ));
                            },
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisExtent: 300.h,
                            mainAxisSpacing: 10),
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                    ),
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
