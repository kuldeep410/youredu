import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';

class QuizeResultScreen extends StatelessWidget {
  const QuizeResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Result'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              'assets/home_page/result_banner.png',
              height: 100.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            RichText(
              text: const TextSpan(
                  text: "22",
                  style: TextStyle(
                      fontSize: 36,
                      color: AppColors.title,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "/30",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.title,
                            fontWeight: FontWeight.bold))
                  ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              'You Have successfully\npass the Exam.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.body,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnswerCart(
                  total: '28',
                  title: 'Total\nAnswer',
                  color: const Color(0xff5141E3).withOpacity(0.3),
                ),
                AnswerCart(
                  total: '22',
                  title: 'Correct\nAnswer',
                  color: const Color(0xff18BC80).withOpacity(0.3),
                ),
                AnswerCart(
                  total: '28',
                  title: 'Incorrect\nAnswer',
                  color: const Color(0xffFF6A54).withOpacity(0.3),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AnswerCart extends StatelessWidget {
  final String? total;
  final String? title;
  final Color? color;
  const AnswerCart({Key? key, this.title, this.total, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.h),
        child: Column(
          children: [
            Text(
              total ?? '',
              textAlign: TextAlign.center,
              style: GoogleFonts.inder(
                  fontSize: 16,
                  color: AppColors.title,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ), 
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: GoogleFonts.inder(
                  fontSize: 10,
                  color: AppColors.title,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
