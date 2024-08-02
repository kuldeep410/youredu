import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/web/widgets/academy_cart.dart';
import 'package:lms/widgets/custom_text.dart';

class AcademyContent extends StatelessWidget {
  const AcademyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFAFA),
      width: double.infinity,
      child: const Row(
        children: [
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: CustomText(
                      text: "Why Choose Onest Academy",
                      color: Color(0xff212736),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: CustomText(
                      text:
                          "Look into yourself, get something in return as your achievment.",
                      color: AppColors.body,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AcademyCart(
                        image: 'assets/web/home_page/academy_section_one.png',
                        title: "Online Course From \nExperts",
                      )),
                      Expanded(
                          child: AcademyCart(
                        image: 'assets/web/home_page/academy_section_two.png',
                        title: "Online Course From \nExperts",
                      )),
                      Expanded(
                          child: AcademyCart(
                        image: 'assets/web/home_page/academy_section_three.png',
                        title: "Online Course From \nExperts",
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                ],
              )),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
