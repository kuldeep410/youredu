import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/body_response/auth_body/body_verificaton.dart';
import 'package:lms/data/repository/auth_repository/auth_repository.dart';
import 'package:lms/screen/auth/login_screen/login_screen.dart';
import 'package:lms/utils/nav_utail.dart';

class VerificationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  // OtpFieldController codeController = OtpFieldController();
  String? codeController;

  changePin(String? pin) {
    codeController = pin;
    notifyListeners();
  }

  void verificationApi({context, String? email}) async {
    var bodyVerification = BodyVerification(
        email: email, code: int.parse(codeController.toString()));
    var apiResponse = await AuthRepository.getValidation(bodyVerification);

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
