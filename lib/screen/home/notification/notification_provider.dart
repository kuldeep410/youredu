import 'package:flutter/material.dart';
import 'package:lms/data/model/notification_response/notification_response.dart';
import 'package:lms/data/repository/notification_respository/notification_repository.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationResponse? notificationResponse;

  NotificationProvider() {
    notificationApi();
  }
  void notificationApi() async {
    var apiResponse = await NotificationRepository.getNotificationRepositoryData();

    if (apiResponse.success == true) {
      notificationResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
