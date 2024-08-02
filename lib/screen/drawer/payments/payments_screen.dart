import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen>
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
        child: const CustomAppBar(appBarName: 'Payments'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
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
                            text: 'All',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 0.h),
                          child: const Tab(
                            text: 'Paid',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 0.h),
                          child: const Tab(
                            text: 'Unpaid',
                          ),
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab),
                ),
                SizedBox(
                  height: 750,
                  child: TabBarView(controller: _tabController, children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 46.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "\$35.68",
                                      color: AppColors.title,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    CustomText(
                                      text: "Account Balance",
                                      color: AppColors.title,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: AppColors.primary)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0.w, vertical: 12.h),
                                        child: CustomText(
                                          text: 'Charges',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.title,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset(
                                  'assets/mentors/payment.png',
                                  height: 77,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          CustomText(
                            text: "Balance History",
                            color: AppColors.title.withOpacity(.7),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          Center(
                            child: Image.asset(
                              'assets/mentors/balance.png',
                              height: 217.h,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Center(
                            child: CustomText(
                              text: "No Balance!",
                              color: AppColors.title.withOpacity(.7),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: .8,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.body),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0.w, vertical: 20.h),
                      child: const Column(
                        children: [
                          PaymentsCart(
                              paymentType: 'Paid', paymentStatus: "Learn More"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0.w, vertical: 20.h),
                      child: const Column(
                        children: [
                          PaymentsCart(
                              paymentType: "Unpaid", paymentStatus: "Pay Now"),
                        ],
                      ),
                    ),
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

class PaymentsCart extends StatelessWidget {
  final String? paymentType, paymentStatus;
  const PaymentsCart({Key? key, this.paymentType, this.paymentStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "\$35.68",
                color: AppColors.title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 9.h,
              ),
              CustomText(
                text: "Account Balance",
                color: AppColors.title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.success)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 14.h),
                      child: CustomText(
                        text: paymentType,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 12.h),
                      child: CustomText(
                        text: paymentStatus,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/mentors/paid_img.png',
            height: 38,
          )
        ],
      ),
    );
  }
}
