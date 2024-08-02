// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/dashboard/dashboard_screen_provider.dart';
import 'package:lms/screen/dashboard/widgets/account_balance_cart.dart';
import 'package:lms/screen/dashboard/widgets/summary_cart.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardScreenProvider(),
      child: Consumer<DashboardScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            height: 40.h,
                            fit: BoxFit.cover,
                            imageUrl: provider.userAvatar ?? '',
                            placeholder: (context, url) => Center(
                              child: Image.asset(
                                  "assets/home_page/ic_no_image.png"),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/home_page/ic_no_image.png"),
                          ),
                        ),
                        // Image.asset(
                        //   'assets/home_page/UserIcon.png',
                        //   height: 39.h,
                        //   width: 39.w,
                        // ),
                        SizedBox(
                          width: 12.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: provider.userName ?? '',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.title,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            CustomText(
                              text: 'Welcome Back',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.body,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SummaryCart(
                            image: "assets/home_page/dash_one.png",
                            total: provider.dashboardResponse?.data?.courseCount
                                    .toString() ??
                                '',
                            type: "Courses",
                            title: "Courses Count",
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: SummaryCart(
                            image: "assets/home_page/dash_two.png",
                            total: provider
                                    .dashboardResponse?.data?.purchaseAmounts
                                    .toString() ??
                                "",
                            type: "Purchase",
                            title: "Purchase Count",
                          ),
                        ),
                      ],
                    ),
                    // SummaryContent(
                    //     dashboardResponse: provider.dashboardResponse),
                    SizedBox(
                      height: 20.h,
                    ),
                    // AccountBalanceCart(
                    //     dashboardResponse: provider.dashboardResponse),
                    // SizedBox(
                    //   height: 34.h,
                    // ),
                    CustomText(
                      text: "Assignment",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.title,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider
                              .dashboardResponse?.data?.assignments?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final data = provider
                            .dashboardResponse?.data?.assignments?[index];
                        return AllAssignmentListCart(
                          title: data?.title,
                          details: data?.details,
                          status: data?.status,
                          deadline: data?.deadline,
                        );
                      },
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
