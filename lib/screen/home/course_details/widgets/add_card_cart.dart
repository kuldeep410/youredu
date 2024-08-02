import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';

class PaymentListCart extends StatelessWidget {
  final String? image;
  final String? text;
  final String? cardNumber;
  const PaymentListCart({Key? key, this.image, this.text, this.cardNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image.asset(
              //   '$image',
              //   // 'assets/images/checkout/ms_card.png',
              //   height: 56.h,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  height: 56.h,
                  width: 70,
                  fit: BoxFit.cover,
                  imageUrl: image ?? '',
                  placeholder: (context, url) => Center(
                    child:
                    Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/home_page/ic_no_image.png"),
                ),
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
                  const SizedBox(height: 5,),
                  Text(
                    'Pay With $cardNumber',
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
      ),
    );
  }
}
