import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/custom_text_heading.dart';
import 'package:lms/widgets/custom_text.dart';

class HeaderBannerSection extends StatelessWidget {
  const HeaderBannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TypographyHeading(
                          text:
                              'Make your self as a\ntechnology expert with\nour courses',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CustomText(
                          text: "Lorem ipsum dolor sit amet consectetur. Scelerisque interdum eget vel malesuada eget metus et. Volutpat quis imperdiet pulvinar vitae.",
                          fontSize: 16,
                          color: AppColors.body,
                          height: 1.5,
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.webButtonColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/web/home_page/ic_book.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const CustomText(
                                    text: "See All Courses",
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.webButtonColor),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Image.asset(
                                        "assets/web/home_page/search_vector_one.png",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: "Search Courses",
                                      color: AppColors.webButtonColor
                                          .withOpacity(0.4),
                                      fontSize: 18,
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
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Image.asset(
                    "assets/web/home_page/bannar_image_one.png",
                  )),
                ],
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ],
    );
  }
}
