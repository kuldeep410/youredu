import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/mentors_response/mentors_response.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/components/Instractor_info_content.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/components/badges_cart.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/components/mentors_courses.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/mentors_profile_details_provider.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/components/about_cart.dart';
import 'package:lms/screen/mentor_section/mentors_profile_details/components/reviews_cart.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MentorsProfile extends StatefulWidget {
  final Instructor? users;

  const MentorsProfile({Key? key, this.users}) : super(key: key);

  @override
  State<MentorsProfile> createState() => _MentorsProfileState();
}

class _MentorsProfileState extends State<MentorsProfile>
    with SingleTickerProviderStateMixin {
  List<String> examType = ["About", "Courses", "Badges", "Reviews"];
  var selectedIndex = 0;
  ScrollController? _scrollViewController;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MentorsProfileDetailsProvider(widget.users?.id),
      child: Consumer<MentorsProfileDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const CustomAppBar(appBarName: 'Profile'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  controller: _scrollViewController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: InstructorInfoContent(
                          provider: provider, users: widget.users),
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
                        ? AboutCart(
                            mentorsDetailsResponse:
                                provider.mentorsDetailsResponse,
                          )
                        : selectedIndex == 1
                            ? MentorsCourses(
                                mentorsDetailsResponse:
                                    provider.mentorsDetailsResponse,
                              )
                            : selectedIndex == 2
                                ? BadgesCart(
                                    mentorsDetailsResponse:
                                        provider.mentorsDetailsResponse)
                                : selectedIndex == 3
                                    ? ReviewsCart(
                                        mentorsDetailsResponse:
                                            provider.mentorsDetailsResponse,
                                      )
                                    : const SizedBox(),
                  ],
                ),
              )

              // SingleChildScrollView(
              //   child: Padding(
              //     padding:
              //         EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
              //     child: Column(
              //       children: [
              //         InstructorInfoContent(
              //             provider: provider, users: widget.users),
              //         Center(
              //           child: Column(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   color: Colors.white,
              //                 ),
              //                 child: TabBar(
              //                     // onTap: (int index) {
              //                     //   provider.selectTab(index);
              //                     // },
              //                     unselectedLabelColor: AppColors.body,
              //                     indicatorColor: AppColors.primary,
              //                     labelColor: AppColors.primary,
              //                     labelStyle: TextStyle(
              //                         fontSize: 14.sp,
              //                         fontWeight: FontWeight.w700),
              //                     tabs: const [
              //                       Tab(
              //                         text: 'About',
              //                       ),
              //                       Tab(
              //                         text: 'Courses',
              //                       ),
              //                       // Tab(
              //                       //   text: 'Badges',
              //                       // ),
              //                       Tab(
              //                         text: 'Reviews',
              //                       ),
              //                     ],
              //                     controller: _tabController,
              //                     indicatorSize: TabBarIndicatorSize.tab),
              //               ),
              //               SizedBox(
              //                 height: 298.h,
              //                 child: TabBarView(
              //                     physics: const NeverScrollableScrollPhysics(),
              //                     controller: _tabController,
              //                     children: [
              //                       AboutCart(
              //                           mentorsDetailsResponse:
              //                               provider.mentorsDetailsResponse),
              //                       Padding(
              //                         padding: const EdgeInsets.all(16.0),
              //                         child: MentorsCourses(
              //                           mentorsDetailsResponse:
              //                               provider.mentorsDetailsResponse,
              //                         ),
              //                       ),
              //                       // BadgesCart(
              //                       //     mentorsDetailsResponse:
              //                       //         provider.mentorsDetailsResponse),
              //                       ReviewsCart(
              //                         mentorsDetailsResponse:
              //                             provider.mentorsDetailsResponse,
              //                       )
              //                     ]),
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              );
        },
      ),
    );
  }
}
