import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/splash_screen/splash_screen.dart';
import 'package:lms/screen/drawer/assignments/assignments_screen/assignments_screen.dart';
import 'package:lms/screen/drawer/bookmark/bookmark_screen.dart';
import 'package:lms/screen/drawer/certificate/certificate_screen.dart';
import 'package:lms/screen/drawer/drawer_screen/drawer_screen_provider.dart';
import 'package:lms/screen/drawer/my_courses/my_courses_screen.dart';
import 'package:lms/screen/drawer/settings/settings_screen.dart';
import 'package:lms/screen/profile/my_profile_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrawerScreenProvider(),
      child: Consumer<DrawerScreenProvider>(
        builder: (context, provider, _) {
          return Drawer(
            backgroundColor: AppColors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 64.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.0.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/app_bar_icon/back_vector.png',
                                height: 39.h,
                              ),
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            // InkWell(
                            //   onTap: () async {
                            //     logOut(context);
                            //   },
                            //   child: const Padding(
                            //     padding: EdgeInsets.all(16.0),
                            //     child: Icon(
                            //       Icons.logout,
                            //       color: Colors.red,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 80.h,
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: 10.h,
                            child: Column(
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                      height: 130.h,
                                      width: 130.w,
                                      fit: BoxFit.cover,
                                      imageUrl: provider.userAvatar ?? '',
                                      placeholder: (context, url) => Center(
                                            child: Image.asset(
                                                "assets/home_page/ic_no_image.png"),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              "assets/home_page/ic_no_image.png")),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                CustomText(
                                  text: provider.userName ?? '',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.title,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                CustomText(
                                  text: provider.userEmail ?? '',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary,
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    Column(
                      children: [
                        DrawerListContent(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyProfileScreen(
                                    isBottomNav: false,
                                  ),
                                ));
                          },
                          image: 'assets/mentors/icons8-male-user-60.png',
                          title: "My profile",
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const MessageScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/star_icon.png',
                        //   title: "Message",
                        // ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        DrawerListContent(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyCoursesScreen(),
                                ));
                          },
                          image: 'assets/mentors/icons8-courses-64.png',
                          title: "My Courses",
                        ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const MeetingsScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/star_icon.png',
                        //   title: "Meetings",
                        // ),
                        SizedBox(
                          height: 34.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AssignmentsScreen(),
                                ));
                          },
                          image: 'assets/mentors/icons8-assignment-50.png',
                          title: "Assignments",
                        ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const QuizzesScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/star_icon.png',
                        //   title: "Quizzes",
                        // ),
                        SizedBox(
                          height: 34.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CertificateScreen(),
                                ));
                          },
                          image: 'assets/mentors/icons8-certified-50.png',
                          title: "Cirtificates",
                        ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const BookmarkScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/star_icon.png',
                        //   title: "Bookmark",
                        // ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const CommentsScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/star_icon.png',
                        //   title: "Comments",
                        // ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const PaymentsScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/icon_payments.png',
                        //   title: "Payments",
                        // ),
                        SizedBox(
                          height: 24.h,
                        ),

                        DrawerListContent(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsScreen(),
                                ));
                          },
                          image: 'assets/mentors/icons8-setting-50.png',
                          title: "Settings",
                        ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const SubscriptionScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/icon_settings.png',
                        //   title: "Subscriptions",
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        //   child: ExpansionTile(
                        //     title: Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 10.0),
                        //       child: CustomText(
                        //         text: "Settings",
                        //         fontSize: 15.sp,
                        //         fontWeight: FontWeight.w600,
                        //         color: AppColors.title,
                        //       ),
                        //     ),
                        //     leading: Image.asset(
                        //       'assets/mentors/icon_settings.png',
                        //       fit: BoxFit.cover,
                        //       height: 32.h,
                        //     ), //add icon
                        //     childrenPadding: const EdgeInsets.only(
                        //         left: 20), //children padding
                        //     children: [
                        //       ListTile(
                        //         title: const Text(
                        //           "About Us",
                        //           style: TextStyle(
                        //               color: AppColors.title, fontSize: 16),
                        //         ),
                        //         onTap: () {
                        //           // Navigator.push(
                        //           //     context,
                        //           //     MaterialPageRoute(
                        //           //       builder: (context) => const AboutUsScreen(),
                        //           //     ));
                        //         },
                        //       ),

                        //       ListTile(
                        //         title: const Text(
                        //           "App Terms",
                        //           style: TextStyle(
                        //               color: AppColors.title, fontSize: 16),
                        //         ),
                        //         onTap: () {
                        //           //action on press
                        //         },
                        //       ),

                        //       //more child menu
                        //     ],
                        //   ),
                        // ),
                        // const DrawerListContent(
                        //   image: 'assets/mentors/icon_settings.png',
                        //   title: "Settings",
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // DrawerListContent(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               const NotificationScreen(),
                        //         ));
                        //   },
                        //   image: 'assets/mentors/icon_notification.png',
                        //   title: "Notifications",
                        // ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                      ],
                    )
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

void logOut(context) async {
  await SPUtill.deleteKey(
    SPUtill.keyAuthToken,
  );
  await SPUtill.deleteKey(
    SPUtill.keyName,
  );
  await SPUtill.deleteKey(
    SPUtill.keyEmail,
  );
  await SPUtill.deleteKey(
    SPUtill.keyMobile,
  );
  await SPUtill.deleteKey(
    SPUtill.keyAvatar,
  );
  await SPUtill.deleteKey(
    SPUtill.keyStatus,
  );
  await SPUtill.deleteKey(
    SPUtill.keyJoinDate,
  );
  await SPUtill.deleteKey(
    SPUtill.keyDateBirth,
  );
  NavUtil.pushAndRemoveUntil(context, const SplashScreen());
}

class DrawerListContent extends StatelessWidget {
  final String? image, title;
  final Function()? onTap;

  const DrawerListContent({Key? key, this.image, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  image!,
                  // 'assets/mentors/profile_icon.png',
                  height: 32.h,
                ),
              ),
              //Spacer(),
              Expanded(
                child: CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
              ),

              const Expanded(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.body,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
