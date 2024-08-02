import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                hintText: 'Search',
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.title.withOpacity(0.3),
                    fontWeight: FontWeight.w600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    'assets/home_page/payment/Vector.png',
                    scale: 1.5,
                  ),
                ),
                border: const OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
