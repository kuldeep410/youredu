import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/enrole_course_details/enrole_course_detials_page.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class PaymentSuccessfullScreen extends StatelessWidget {
  const PaymentSuccessfullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Payments'),
      ),
      body: SafeArea(
          child: Stack(children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  'assets/home_page/payment/succesful.png',
                  height: 140.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Payment Success!",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'You have successfully buy \n\'Paython - Basic Introduction\'',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.8,
                      letterSpacing: 1,
                      color: AppColors.body,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 180.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 16,
          right: 16,
          child: ElevatedButtonWidget(
            text: 'View Course',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnroleCourseDetailsPage(),
                  ));
            },
          ),
        ),
      ])),
    );
  }
}
