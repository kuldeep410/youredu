// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/auth/login_screen/login_screen.dart';
import 'package:lms/screen/onboarding/model/onboarding_model.dart';
import 'package:lms/utils/app_consts.dart';

class OnbardingScreen extends StatefulWidget {
  const OnbardingScreen({Key? key}) : super(key: key);

  @override
  _OnbardingScreenState createState() => _OnbardingScreenState();
}

class _OnbardingScreenState extends State<OnbardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 40.0.w, top: 16.h),
              child: SizedBox(
                  height: 20.h,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LogInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.title,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      children: [
                        Image.asset(
                          "${contents[i].image}",
                          // "assets/images/checkout/illustration.png",
                          height: 260.h,
                        ),
                        SizedBox(height: 60.h),
                        Text(
                          "${contents[i].title}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5,
                            color: AppColors.title,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          " ${contents[i].discription}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.body,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            // Positioned(
            //   bottom: 0, // Button ko screen ke bottom par rakhne ke liye
            //   left: 0, // Button ko screen ke left par rakhne ke liye
            //   right: 0, // Button ko screen ke right par rakhne ke liye
            //   child: SizedBox(
            //     height: 48.h,
            //     child: InkWell(
            //       onTap: () {
            //         if (currentIndex == contents.length - 1) {
            //           Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) => const LogInScreen(),
            //             ),
            //           );
            //         }
            //         _controller.nextPage(
            //           duration: const Duration(milliseconds: 100),
            //           curve: Curves.bounceIn,
            //         );
            //       },
            //       child: Image.asset('assets/onboarding/next_vector.png'),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? AppColors.primary : AppColors.border,
      ),
    );
  }
}
