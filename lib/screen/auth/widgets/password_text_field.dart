// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class PasswordFromField extends StatefulWidget {
  final Function()? onTap;
  String? title;
  String? hintText;
  IconButton? suffixIcon;
  Icon? prefixIcon;
  PasswordFromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap})
      : super(key: key);

  @override
  State<PasswordFromField> createState() => _PasswordFromFieldState();
}

class _PasswordFromFieldState extends State<PasswordFromField> {
  String? title;
  String? hintText;
  IconButton? suffixIcon;
  Icon? prefixIcon;
  @override
  Widget build(BuildContext context) {
    bool isObscure = true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          obscureText: isObscure,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
              hintText: '$hintText',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    // ignore: dead_code
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.withOpacity(.2),
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  }),
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.hintTextColor,
                  fontWeight: FontWeight.w400),
              border: const OutlineInputBorder()),
        ),
      ],
    );
  }
}
