import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/meetings/meetings_details/meetings_details_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

import '../../widgets/list_meetings.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({Key? key}) : super(key: key);

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Meetings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
            child: SizedBox(
              height: 35.h,
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: AppColors.title,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.white,
                  labelStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primary),
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 0.h),
                      child: const Tab(
                        text: 'All',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 0.h),
                      child: const Tab(
                        text: 'My Meetings',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 0.h),
                      child: const Tab(
                        text: 'Schedule Meetings',
                      ),
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      ListMeetings(
                        meetingsTime: "06:32 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "06:32 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "06:32 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "10:41 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "05:32 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "12:32 pm",
                      ),
                      ListMeetings(
                        meetingsTime: "010:32 pm",
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const ListMyMeetings(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ListMyMeetings extends StatelessWidget {
  const ListMyMeetings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavUtil.navigateScreen(context, const MeetingsDetails());
      },
      child: Container(
        color: const Color(0xffF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '06:00 pm',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.title,
                      ),
                      CustomText(
                        text: 'sunday',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.body,
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 40,
                      child: Row(children: [
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1, //thickness of divier line
                        ),
                      ])),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Design thinking',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.title,
                      ),
                      CustomText(
                        text: 'Maimuna, Dubai',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.body,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.primary)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 8.h),
                      child: CustomText(
                        text: 'See Meeting Details',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.0.w, vertical: 8.h),
                      child: CustomText(
                        text: 'Join Meeting',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
