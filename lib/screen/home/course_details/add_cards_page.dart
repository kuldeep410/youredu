import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/widgets/text_form_field.dart';
import 'package:lms/screen/home/course_details/payment_success_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/elevated_button_widget.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add Card'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    FromField(
                      title: "Card Number",
                      hintText: "5592-4578-2146",
                      prefixIcon: const Icon(Icons.credit_card_rounded),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Method',
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/home_page/payment/mastercard_vector.png",
                              height: 22.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Method',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 12,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FromField(
                            title: 'Validity',
                            hintText: '06/2024',
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: FromField(
                            title: 'CVC',
                            hintText: '06/2024',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    FromField(
                      title: 'Name',
                      hintText: 'Card Holder Name',
                    ),
                    /////Billing Address//////
                    SizedBox(
                      height: 16.h,
                    ),

                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ElevatedButtonWidget(
                  text: 'Done',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PaymentSuccessfullScreen(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
