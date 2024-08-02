import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/notification/notification_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: Consumer<NotificationProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Notification'),
            ),
            body:  provider.notificationResponse?.data?.notifications?.isEmpty ??
                    true == true
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: true,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Notification not found",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            )),
                      )
                    ],
                  )
                : ListView.builder(
              itemCount:
                  provider.notificationResponse?.data?.notifications?.length ??
                      0,
              itemBuilder: (context, index) {
                final data =
                    provider.notificationResponse?.data?.notifications?[index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0.w, vertical: 17.h),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/home_page/ic_notification.png',
                            height: 40,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: data?.title ?? '',
                                  color: AppColors.title,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.6,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                CustomText(
                                  text: data?.message ?? '',
                                  color: AppColors.title,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomText(
                                  text: data?.createdAt.toString() ?? '',
                                  color: const Color(0xffA8BBFF),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
