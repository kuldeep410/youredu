import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class AcademyCart extends StatelessWidget {
  final String? image, title;
  const AcademyCart({Key? key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image!,
          // 'assets/web/home_page/academy_section_one.png',
          height: 100,
          width: 100,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: AppColors.webtitle,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                height: 1.3,
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer enim nisi.",
                color: AppColors.body,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        )
      ],
    );
  }
}
