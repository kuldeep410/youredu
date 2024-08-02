import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebMostPopularCard extends StatelessWidget {
  const WebMostPopularCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 499,
        width: 370,
        child: Column(
          children: [
            Image.asset(
              "assets/web/home_page/popular_one.png",
              height: 261,
              width: 370,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.secondary,
                            ),
                            CustomText(
                              text: 'Web Design',
                              color: AppColors.title,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const CustomText(
                        text: '\$170',
                        color: AppColors.webButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    text: '100 Days of Code: The Complete Python\nPro Bootcamp for 2022',
                    color: AppColors.title,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: '4.3',
                        color: AppColors.title,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        'assets/web/home_page/star_vector.png',
                        height: 14,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const CustomText(
                        text: '(3,788)',
                        color: AppColors.title,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/web/home_page/person_vector.png',
                        height: 21,
                        width: 13,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const CustomText(
                        text: '7.3K',
                        color: AppColors.title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                      Image.asset(
                        'assets/web/home_page/visibility_vector.png',
                        height: 10,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const CustomText(
                        text: '56K',
                        color: AppColors.title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                      Image.asset(
                        'assets/web/home_page/star_outlined_vector.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                       const CustomText(
                        text: '7.3',
                        color: AppColors.title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                      Image.asset(
                        'assets/web/home_page/person_img.png',
                        height: 49,
                        width: 45,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
