// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/splash_screen/splash_screen.dart';
import 'package:lms/screen/drawer/assignments/assignments_details/assignments_details.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
import 'package:lms/screen/home/enrole_course_details/enrole_course_detials_page.dart';
import 'package:lms/screen/profile/my_profile_provider.dart';
import 'package:lms/screen/profile/widgets/certificate_content.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  final bool? isBottomNav;

  const MyProfileScreen({Key? key, this.isBottomNav}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  List<String> examType = ["My Courses", "Assignments", "Certificate"];
  var selectedIndex = 0;
  ScrollController? _scrollViewController;
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyProfileProvider(),
        child: Consumer<MyProfileProvider>(builder: (context, provider, _) {
          return Scaffold(
            appBar: widget.isBottomNav == false
                ? PreferredSize(
                    preferredSize: Size.fromHeight(70.h),
                    child: const CustomAppBar(appBarName: 'Profile'),
                  )
                : const PreferredSize(
                    // ignore: sort_child_properties_last
                    child: SizedBox(),
                    preferredSize: Size.fromHeight(0)),
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(
                  controller: _scrollViewController,
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Center(
                          child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(20.0.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 100.0.h,
                                width: 80.0.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0.r),
                                    border:
                                        Border.all(color: AppColors.primary),
                                    image: DecorationImage(
                                        image: NetworkImage(provider
                                                .userAvatar ??
                                            'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(provider.userName ?? 'Kristin Watson',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w900)),
                                    const Divider(
                                      color: Color(0xFF333333),
                                      indent: 8,
                                      endIndent: 8,
                                    ),
                                    CustomText(
                                      text:
                                          'Member since ${provider.userJoinDate ?? ''}',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      elevation: 8.0,
                      shadowColor: Colors.white,
                      pinned: true,
                      floating: true,
                      snap: false,
                      collapsedHeight: 56.0001,
                      expandedHeight: 50.0,
                      clipBehavior: Clip.hardEdge,
                      flexibleSpace: FlexibleSpaceBar.createSettings(
                        currentExtent: 0,
                        minExtent: 0,
                        maxExtent: 0,
                        child: Wrap(
                          children: List.generate(
                            examType.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 6),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? AppColors.primary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CustomText(
                                  text: examType[index],
                                  fontSize: 14.sp,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xff9F9F9F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    selectedIndex == 0
                        ? SliverGrid.builder(
                            itemCount: provider.profileResponse?.data?.enrolls
                                    ?.courses.length ??
                                0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisExtent: 275.h,
                                    mainAxisSpacing: 24),
                            itemBuilder: (context, index) {
                              final data = provider.profileResponse?.data
                                  ?.enrolls?.courses[index];
                              return Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color:
                                            AppColors.primary.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  onTap: () {
                                    NavUtil.navigateScreen(context,
                                        CourseDetailsScreen(id: data?.id));
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          height: 110.h,
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
                                          height: 10.h,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
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
                                                    text: data?.rate
                                                            ?.toStringAsFixed(
                                                                2) ??
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
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            minimumSize:
                                                Size(double.infinity, 28.h),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CourseDetailsScreen(
                                                    id: data?.id,
                                                  ),
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
                          )
                        : selectedIndex == 1
                            ? SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  final data = provider.profileResponse?.data
                                      ?.assignment?[index];
                                  return AllAssignmentListCart(
                                    deadline: data?.deadline.toString(),
                                    details: data?.details ?? '',
                                    status: 'Not Submitted',
                                    title: "${data?.title}".split(" ")[0],
                                    onTap: () {
                                      return NavUtil.navigateScreen(
                                          context,
                                          AssignmentsDetailsPage(
                                            detailsId: data?.id,
                                          ));
                                    },
                                  );
                                },
                                    childCount: provider.profileResponse?.data
                                            ?.assignment?.length ??
                                        0),
                              )
                            : selectedIndex == 2
                                ? CertificateContent(
                                    userCertificateResponse:
                                        provider.userCertificateResponse,
                                  )
                                : const SizedBox()
                  ]),
            ),
          );
        }));
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
