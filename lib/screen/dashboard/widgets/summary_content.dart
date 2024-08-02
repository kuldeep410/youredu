import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/dashbaord_response/dashboard_response.dart';
import 'package:lms/screen/dashboard/widgets/summary_cart.dart';

// ignore: must_be_immutable
class SummaryContent extends StatelessWidget {
  DashboardResponse? dashboardResponse;
  SummaryContent({Key? key, this.dashboardResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SummaryCart(
            image: "assets/home_page/dash_one.png",
            total: dashboardResponse?.data?.courseCount.toString() ?? '',
            type: "Courses",
            title: "Courses Count",
          ),
          SizedBox(
            width: 10.w,
          ),
          SummaryCart(
            image: "assets/home_page/dash_two.png",
            total: dashboardResponse?.data?.purchaseAmounts.toString() ?? "",
            type: "Purchase",
            title: "Purchase Count",
          ),
        ],
      ),
    );
  }
}
