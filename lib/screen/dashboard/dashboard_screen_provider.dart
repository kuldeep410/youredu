import 'package:flutter/material.dart';
import 'package:lms/data/model/dashbaord_response/dashboard_response.dart';
import 'package:lms/data/repository/dashboard_repository/dashboard_repository.dart';
import 'package:lms/utils/shared_preferences.dart';

class DashboardScreenProvider extends ChangeNotifier {
  DashboardResponse? dashboardResponse;
  String? userName;
  String? userAvatar;
  String? userJoinDate;

  DashboardScreenProvider() {
    getUserData();
    // myProfileApi();
    dashboardapi();
  }

  // void myProfileApi() async {
  //   var apiResponse = await ProfileRepository.getProfileRepositoryData();

  //   if (apiResponse.success == true) {
  //     profileResponse = apiResponse.data;
  //     notifyListeners();
  //   }
  // }

  void getUserData() async {
    userName = await SPUtill.getValue(SPUtill.keyName);
    userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
    userJoinDate = await SPUtill.getValue(SPUtill.keyJoinDate);

    notifyListeners();
  }

  void dashboardapi() async {
    var apiResponse = await DashboardRepsitory.getDashboardRepsitoryData();

    if (apiResponse.success == true) {
      dashboardResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
