import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/body_response/auth_body/body_sign_up.dart';
import 'package:lms/data/repository/auth_repository/auth_repository.dart';
import 'package:lms/screen/auth/verification_screen.dart';
import 'package:lms/utils/nav_utail.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void signUpApi(context) async {
    var fromData = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passController.text,
      "password_confirmation": confirmPasswordController.text
    };
    var bodySignUp = BodySignUp(
      email: emailController.text,
      password: passController.text,
      fullName: nameController.text,
      passwordConfirmation: confirmPasswordController.text,
    );
    var apiResponse = await AuthRepository.getSignUp(fromData);

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
          context, VerificationScreen(email: emailController.text));
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
