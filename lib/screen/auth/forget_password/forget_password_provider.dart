import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/repository/auth_repository/auth_repository.dart';
import 'package:lms/screen/auth/login_screen/login_screen.dart';
import 'package:lms/utils/nav_utail.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  void forgetPasswordApi(context) async {
    var fromData = {
      "email": emailController.text,
    };
    var apiResponse = await AuthRepository.forgetPasswordApi(fromData);

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
