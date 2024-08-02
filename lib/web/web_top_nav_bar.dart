import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lms/widgets/custom_text.dart';

import '../utils/app_consts.dart';

class WebTopNavBar extends StatelessWidget {
  const WebTopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Row(
                  children: [
                    const Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/web/home_page/web_logo_one.png',
                            fit: BoxFit.cover,
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              child: Wrap(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      style: menuButtonStyle,
                                      child: const Text("Home")),
                                  TextButton(
                                      onPressed: () {},
                                      style: menuButtonStyle,
                                      child: const Text("Courses")),
                                  TextButton(
                                      onPressed: () {},
                                      style: menuButtonStyle,
                                      child: const Text("Store")),
                                  TextButton(
                                      onPressed: () {},
                                      style: menuButtonStyle,
                                      child: const Text("Forums")),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            decoration: BoxDecoration(
                                color: AppColors.webButtonColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Row(
                              children: [
                                CustomText(
                                  text: "Become Instructor",
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.1),
              )
            ],
          ),
        ),
      ],
    );
  }
}

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.transparent,
    textStyle: buttonTextStyle,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));
const Color textPrimary = Color(0xFF111111);
const Color textSecondary = Color(0xFF3A3A3A);
TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        letterSpacing: 1,
        fontWeight: FontWeight.bold));
