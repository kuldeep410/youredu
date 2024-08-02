import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/payment_list/payment_method.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Buy Now'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Center(
                  child: Image.asset(
                'assets/home_page/buy_now_one.png',
                height: 260.h,
              )),
              SizedBox(
                height: 32.h,
              ),
              CustomText(
                text: "Learn Python: The Complete Python\nProgramming Course",
                color: AppColors.title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "4.7",
                    color: AppColors.title,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Image.asset(
                    'assets/home_page/course_details_star.png',
                    height: 13.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    text: "(3,726 ratings)",
                    color: AppColors.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Image.asset(
                    'assets/home_page/course_details_person.png',
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    text: "21,628 Students",
                    color: AppColors.body,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text:
                    "Learn A-Z everything about Python, from thebasics, to advanced topics like Python GUI, Python Data Analysis, and more!",
                color: AppColors.body,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primary)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0.w, vertical: 13.h),
                      child: CustomText(
                        text: "\$26.00 USD",
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentMethod(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 14.5.h),
                      child: CustomText(
                        text: "Buy Course",
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
