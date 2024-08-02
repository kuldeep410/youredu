import 'package:flutter/material.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class WebOrganizationsContent extends StatelessWidget {
  const WebOrganizationsContent({
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
                      text: 'Organizations',
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
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      WebOrganizationCard(),
                      SizedBox(
                        width: 64,
                      ),
                      WebOrganizationCard(),
                      SizedBox(
                        width: 64,
                      ),
                      WebOrganizationCard(),
                      SizedBox(
                        width: 64,
                      ),
                      WebOrganizationCard(),
                    ],
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

class WebOrganizationCard extends StatelessWidget {
  const WebOrganizationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'assets/mentors/organizer_five.png',
          height: 133,
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomText(
          text: "Udemy",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.title,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(
          text: "Organizer",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
