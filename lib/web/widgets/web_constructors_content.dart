import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebInstructorsContent extends StatelessWidget {
  const WebInstructorsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFAFA),
      child: Row(
        children: [
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'Our Instructors',
                      color: AppColors.title,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.webButtonColor)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 32),
                        child: Center(
                          child: CustomText(
                            text: 'See All',
                            color: AppColors.webButtonColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 64.0, vertical: 12),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/mentors/person_one.png',
                              height: 133,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const CustomText(
                              text: "Maimuna",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.title,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const CustomText(
                              text: "Instructor",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              'assets/mentors/star_vector.png',
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
