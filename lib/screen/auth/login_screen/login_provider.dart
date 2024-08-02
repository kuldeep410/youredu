import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/body_response/auth_body/body_login.dart';
import 'package:lms/data/repository/auth_repository/auth_repository.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';

import '../../../data/model/auth_response/login_response.dart';
import '../../home/bottom_nav_bar/bottom_nav_bar.dart';

class LogInProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void setDataSharePreferences(ResponseLogin? responseLogin) {
    SPUtill.setValue(SPUtill.keyAuthToken, responseLogin?.data?.token);
    SPUtill.setValue(
        SPUtill.keyUserId, responseLogin?.data?.user?.userId.toString());
    SPUtill.setValue(SPUtill.keyName, responseLogin?.data?.user?.name);
    SPUtill.setValue(SPUtill.keyEmail, responseLogin?.data?.user?.email);
    SPUtill.setValue(SPUtill.keyMobile, responseLogin?.data?.user?.mobile);
    SPUtill.setValue(SPUtill.keyAvatar, responseLogin?.data?.user?.avatar);
    SPUtill.setValue(SPUtill.keyStatus, responseLogin?.data?.user?.status);
    SPUtill.setValue(SPUtill.keyDateBirth,
        responseLogin?.data?.user?.dateOfBirth.toString());
    SPUtill.setValue(
        SPUtill.keyJoinDate, responseLogin?.data?.user?.joinDate.toString());
    SPUtill.setValue(SPUtill.keyVerificationSetUp,
        responseLogin?.data?.user?.verificationSetup);
  }

  void loginApi(context) async {
    var bodyLogin = BodyLogin(
        email: nameController.text,
        password: passController.text,
        rememberMe: 1);
    var apiResponse = await AuthRepository.getLogin(bodyLogin);
    if (apiResponse.success == true) {
      setDataSharePreferences(apiResponse.data);
      NavUtil.pushAndRemoveUntil(context, const BottomNavBar());
      Fluttertoast.showToast(
          msg: apiResponse.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
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
