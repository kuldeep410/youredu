import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/widgets/call_content.dart';
import 'package:lms/screen/drawer/widgets/meetings_content.dart';
import 'package:lms/screen/drawer/widgets/message_content.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
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
        child: const CustomAppBar(appBarName: 'Message'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 0.h),
                child: SizedBox(
                  height: 40.h,
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: AppColors.title,
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.white,
                      labelStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primary),
                      tabs: const [
                        Tab(
                          text: 'Messages',
                        ),
                        Tab(
                          text: 'Calls',
                        ),
                        Tab(
                          text: 'Meetings',
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab),
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24.0.w, vertical: 10.h),
                    child: const MessageContent(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24.0.w, vertical: 10.h),
                    child: const CallContent(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0.h),
                    child: const MeetingsContent(),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
