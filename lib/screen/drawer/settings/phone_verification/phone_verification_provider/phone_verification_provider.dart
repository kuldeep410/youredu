import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/repository/auth_repository/auth_repository.dart';

import '../../../../../data/body_response/auth_body/body_phone_verification.dart';
import '../../../../../utils/nav_utail.dart';
import '../../../../auth/login_screen/login_screen.dart';
import '../verify_otp_screen.dart';

class PhoneVerificationProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();

  String? codeController;

  void getOtpToPhoneNumber(context, String? phoneNumber) async {
    var fromData = {
      "phone": phoneNumber,
    };
    var apiResponse = await AuthRepository.sendOtpToPhone(fromData);
    if (apiResponse.success == true) {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      NavUtil.navigateScreen(
          context,
          PhoneVerificationOTPScreen(
            phoneNumber: phoneNumber,
          ));
    } else {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    notifyListeners();
  }

  changePin(String? pin) {
    codeController = pin;
    notifyListeners();
  }

  void verificationPhone(context, phoneNumber) async {
    var fromData = {
      "phone": phoneNumber,
      "code": int.parse(codeController.toString())
    };
    var apiResponse = await AuthRepository.getPhoneValidation(fromData);

    if (apiResponse.success == true) {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      NavUtil.navigateScreen(context, const LogInScreen());
    } else {
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    notifyListeners();
  }
}
