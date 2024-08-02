import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
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
        child: const CustomAppBar(appBarName: 'Subscription'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                SizedBox(
                  height: 35.h,
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
                      tabs: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 0.h),
                          child: const Tab(
                            text: 'Light',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 0.h),
                          child: const Tab(
                            text: 'Standard',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 0.h),
                          child: const Tab(
                            text: 'Premium',
                          ),
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab),
                ),
                Expanded(
                  child:
                      TabBarView(controller: _tabController, children: const [
                    SubscriptionCart(
                        type: "Lite", text: 'Start 5 days Free Trail'),
                    SubscriptionCart(type: "Standard", text: 'Get Started'),
                    SubscriptionCart(type: "Premium", text: 'Get Started'),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionCart extends StatelessWidget {
  final String? type, text;
  const SubscriptionCart({Key? key, this.type, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                CustomText(
                  text: type,
                  color: AppColors.title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text: "Hit the ground running.",
                  color: AppColors.body,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColors.primary, width: 2)),
                  child: Center(
                    child: CustomText(
                      text: text,
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  text: "£39/Month",
                  color: AppColors.title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: "\$0.50/SUBSCRIBER",
                  color: AppColors.title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: "(Per subscriber per month)",
                  color: AppColors.body,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    CustomText(
                      text: "5 Courses at a time",
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    CustomText(
                      text: "10 times meeetings with Mentors",
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    CustomText(
                      text: "Github Portfolios/Design Portfolios",
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    CustomText(
                      text: "20 days support",
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          ElevatedbuttonWidget(
            text: "Subscribe",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
