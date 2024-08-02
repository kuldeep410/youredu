import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/profile_response/profile_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/enrole_course_details/enrole_course_detials_page.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class MyProfileCourses extends StatelessWidget {
  final ProfileResponse? profileResponse;

  const MyProfileCourses({Key? key, this.profileResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return profileResponse?.data?.enrolls?.courses.isEmpty == true
        ? const Text(
            "You haven't course enrolled yet",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black26),
          )
        : SizedBox(
            child: GridView.builder(
              itemCount: profileResponse?.data?.enrolls?.courses.length ?? 0,
              itemBuilder: (context, index) {
                final data = profileResponse?.data?.enrolls?.courses[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: AppColors.primary.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      NavUtil.navigateScreen(
                          context, CourseDetailsScreen(id: data?.id));
                    },
                    child: Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            height: 140.h,
                            fit: BoxFit.cover,
                            imageUrl: data?.image ?? '',
                            placeholder: (context, url) => Center(
                              child: Image.asset(
                                  "assets/home_page/ic_no_image.png"),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/home_page/ic_no_image.png"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  maxLine: 3,
                                  text: data?.title ?? '',
                                  color: AppColors.title,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 12.h,
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
                                      text: data?.rate.toString() ?? '',
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              minimumSize: Size(double.infinity, 28.h),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EnroleCourseDetailsPage(),
                                  ));
                            },
                            child: CustomText(
                              text: "Play Now",
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
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
                  ),
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 270.h,
                  mainAxisSpacing: 24),
            ),
          );
  }
}
