import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/home/course_details/widgets/add_card_cart.dart';

class PaymentCardContent extends StatelessWidget {
  const PaymentCardContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/add_card.png',
            text: 'Mastercard, Visa',
            cardNumber: 'Add new card',
          ),
          SizedBox(
            height: 12.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/ms_card.png',
            text: 'Mastercard',
            cardNumber: '**** 5678',
          ),
          SizedBox(

            height: 12.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/city.png',
            text: 'City',
            cardNumber: '2535 2664',
          ),
          SizedBox(
            height: 12.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/america.png',
            text: 'Bank of America',
            cardNumber: '**** 5678',
          ),
          SizedBox(
            height: 12.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/visa.png',
            text: 'Visa',
            cardNumber: '**** 5678',
          ),
          SizedBox(
            height: 12.h,
          ),
          const PaymentListCart(
            image: 'assets/home_page/payment/add_card.png',
            text: 'Mastercard, Visa',
            cardNumber: 'Add new card',
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
