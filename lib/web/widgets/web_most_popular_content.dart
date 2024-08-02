import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/web/widgets/web_most_popular_card.dart';
import 'package:lms/widgets/custom_text.dart';

class WebMostPopularContent extends StatelessWidget {
  const WebMostPopularContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff468DFF),
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 142,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: 'Most Popular Course',
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.white)),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'Design',
                              color: AppColors.white.withOpacity(.6),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white.withOpacity(.6),
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Image.asset(
                        "assets/web/home_page/arrow_back.png",
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/web/home_page/arrow_forward.png",
                        height: 26,
                        width: 26,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      WebMostPopularCard(),
                      SizedBox(
                        width: 8,
                      ),
                      WebMostPopularCard(),
                      SizedBox(
                        width: 8,
                      ),
                      WebMostPopularCard(),
                    ],
                  ),
                  const SizedBox(
                    height: 142,
                  ),
                ],
              )),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
