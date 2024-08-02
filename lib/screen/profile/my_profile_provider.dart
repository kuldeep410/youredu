import 'package:flutter/material.dart';
import 'package:lms/data/model/profile_response/profile_response.dart';
import 'package:lms/data/model/profile_response/user_certificate_response.dart';
import 'package:lms/data/repository/profile_repository/profile_repository.dart';
import 'package:lms/data/repository/profile_repository/user_certificate_repository.dart';
import 'package:lms/utils/shared_preferences.dart';

class MyProfileProvider extends ChangeNotifier {
  ProfileResponse? profileResponse;
  UserCertificateResponse? userCertificateResponse;
  String? userName;
  String? userAvatar;
  String? userJoinDate;
  String? userId;
  List<Course>? courses;

  MyProfileProvider() {
    getUserData();
    myProfileApi();
    userCertificateApi();
  }

  void myProfileApi() async {
    var apiResponse = await ProfileRepository.getProfileRepositoryData();

    if (apiResponse.success == true) {
      profileResponse = apiResponse.data;
      courses = apiResponse.data?.data?.enrolls?.courses;
      notifyListeners();
    }
  }

  void getUserData() async {
    userName = await SPUtill.getValue(SPUtill.keyName);
    userId = await SPUtill.getValue(SPUtill.keyUserId);
    userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
    userJoinDate = await SPUtill.getValue(SPUtill.keyJoinDate);

    notifyListeners();
  }

  void userCertificateApi() async {
    var apiResponse =
        await UserCertificateRepository.getUserCertificateRepositoryData();

    if (apiResponse.success == true) {
      userCertificateResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
