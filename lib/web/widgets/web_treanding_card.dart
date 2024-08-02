import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebTreandingCard extends StatelessWidget {
  const WebTreandingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 4,
      child: SizedBox(
        height: 547,
        width: 370,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/web/home_page/treanding_one.png",
                height: 224,
                width: 324,
              ),
              const SizedBox(
                height: 28,
              ),
              const CustomText(
                text: '100 Days of Code: The Complete Python\nPro Bootcamp for 2022',
                color: AppColors.title,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "by Herman Jack",
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.italic,
                    color: AppColors.body,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  const CustomText(
                    text: '4.3',
                    color: AppColors.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/web/home_page/star_vector.png',
                    height: 22,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Spacer(),
                  const CustomText(
                    text: '\$26.99',
                    color: AppColors.secondary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "\$36.75",
                    style: GoogleFonts.inter(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.body,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                color: AppColors.webButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: CustomText(
                      text: 'Add to  cart',
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.webButtonColor)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: CustomText(
                      text: 'Enroll Now',
                      color: AppColors.webButtonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
