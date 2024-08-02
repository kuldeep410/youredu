import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class AddMobileWalletCart extends StatelessWidget {
  final String? image;
  final String? text;
  final String? cardNumber;
  const AddMobileWalletCart({Key? key, this.image, this.text, this.cardNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              '$image',
              // 'assets/images/checkout/ms_card.png',
              height: 56.h,
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$text',
                  // 'Mastercard, Visa',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '$cardNumber',
                  // 'Add New Card',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.body),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
