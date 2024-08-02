import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/screen/profile/my_profile_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileProvider(),
      child: Consumer<MyProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'My Courses'),
            ),
            body: provider.profileResponse?.data?.enrolls?.courses.isEmpty ??
                    true == true
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: true,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "My Course not found",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            )),
                      )
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: GridView.builder(
                        itemCount: provider.profileResponse?.data?.enrolls
                                ?.courses.length ??
                            0,
                        itemBuilder: (context, index) {
                          final data = provider
                              .profileResponse?.data?.enrolls?.courses[index];
                          return InkWell(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context,
                                  // CourseDetailsScreen(
                                  //   id: data?.id,
                                  // )
                                  CourseDetailsWebView(
                                    courseId: data?.id,
                                    userId: provider.userId,
                                  ));
                            },
                            child: Card(
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    height: 135.h,
                                    fit: BoxFit.cover,
                                    imageUrl: data?.image ?? '',
                                    placeholder: (context, url) => Center(
                                      child: Image.asset(
                                          "assets/home_page/ic_no_image.png"),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            "assets/home_page/ic_no_image.png"),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          maxLine: 3,
                                          text: data?.title ?? '',
                                          color: AppColors.title,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/trending_courses/star_vector.png',
                                              height: 13.h,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            CustomText(
                                              text: data?.rate
                                                      ?.toStringAsFixed(2) ??
                                                  '',
                                              color: AppColors.title,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            CustomText(
                                              text:
                                                  '(${data?.reviewCount ?? ''} Reviews)',
                                              color: AppColors.body,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        minimumSize:
                                            Size(double.infinity, 28.h),
                                      ),
                                      onPressed: () {
                                        NavUtil.navigateScreen(
                                            context,
                                            CourseDetailsWebView(
                                              courseId: data?.id,
                                              userId: provider.userId,
                                            ));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const EnroleCourseDetailsPage(),
                                        //     ));
                                      },
                                      child: CustomText(
                                        text: "Play Now",
                                        color: AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                  // Expanded(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       CustomText(
                                  //         text: data?.price ?? '',
                                  //         color: AppColors.title,
                                  //         fontSize: 18.sp,
                                  //         fontWeight: FontWeight.w700,
                                  //       ),
                                  //       const Spacer(),
                                  //       const EnroleNowButton()
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 271.h,
                            mainAxisSpacing: 24),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
