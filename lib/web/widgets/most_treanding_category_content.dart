import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebMostTreandingCategoryContent extends StatelessWidget {
  const WebMostTreandingCategoryContent({
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
                const CustomText(
                  text: 'Most Trending Category',
                  color: AppColors.title,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/web/home_page/treanding_vector_one.png',
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const CustomText(
                              text: 'Advanced Python',
                              color: AppColors.title,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    )),
                    const Expanded(child: Column()),
                    const Expanded(child: Column()),
                  ],
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
