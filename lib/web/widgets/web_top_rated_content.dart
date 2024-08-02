import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebTopRatedContent extends StatelessWidget {
  const WebTopRatedContent({
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
                  height: 143,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'Top Rated Courses',
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
                  height: 40,
                ),
                Container(
                  color: const Color(0xffFAFAFA),
                  child: Image.asset(
                    'assets/web/home_page/top_rated_one.png',
                    height: 370,
                    width: 370,
                  ),
                )
              ],
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
