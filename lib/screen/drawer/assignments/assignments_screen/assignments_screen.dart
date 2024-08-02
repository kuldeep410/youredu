// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/assignments/assignments_details/assignments_details.dart';
import 'package:lms/screen/drawer/assignments/assignments_screen/assignment_provider.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen>
    with SingleTickerProviderStateMixin {
  @override
  // ignore: override_on_non_overriding_member
  // TabController? _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssignmentProvider(),
      child: Consumer<AssignmentProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'All Assignments'),
          ),
          body: Stack(
            children: [
              provider.assignmentResponse?.data?.assignments?.length != null
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          //tabbar
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 24.0.w, vertical: 10.h),
                          //   child: SizedBox(
                          //     height: 35.h,
                          //     child: TabBar(
                          //         isScrollable: true,
                          //         unselectedLabelColor: AppColors.title,
                          //         indicatorColor: AppColors.primary,
                          //         labelColor: AppColors.white,
                          //         labelStyle: TextStyle(
                          //             fontSize: 14.sp, fontWeight: FontWeight.w700),
                          //         indicator: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(25),
                          //             color: AppColors.primary),
                          //         tabs: const [
                          //           Tab(
                          //             text: 'All Assignment',
                          //           ),
                          //           Tab(
                          //             text: 'My Result & history',
                          //           ),
                          //         ],
                          //         controller: _tabController,
                          //         indicatorSize: TabBarIndicatorSize.tab),
                          //   ),
                          // ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.assignmentResponse?.data
                                    ?.assignments?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final data = provider.assignmentResponse?.data
                                  ?.assignments?[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: AllAssignmentListCart(
                                  title: data?.title,
                                  details: data?.details,
                                  deadline: data?.deadline,
                                  status: data?.status,
                                  onTap: () {
                                    debugPrint("${data?.id}");
                                    NavUtil.navigateScreen(
                                        context,
                                        AssignmentsDetailsPage(
                                          detailsId: data?.id,
                                        ));
                                  },
                                ),
                              );
                            },
                          ),
                          // Expanded(
                          //   child: TabBarView(controller: _tabController, children: [

                          //     // Padding(
                          //     //   padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                          //     //   child:  AllAssignmentCart(assignmentData: provider.assignmentResponse.data.assignments),
                          //     // ),
                          //     const MyResultAndHistory(),
                          //   ]),
                          // ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text(
                      'Assignment is not Available Right now',
                      textAlign: TextAlign.center,
                    )),
            ],
          ),
        );
      }),
    );
  }
}
