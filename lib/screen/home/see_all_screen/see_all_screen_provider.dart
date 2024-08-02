import 'package:flutter/material.dart';
import 'package:lms/data/model/see_all_response/see_all_response.dart';
import 'package:lms/data/repository/see_all_repository/see_all_repository.dart';

class SeeAllScreenProvider extends ChangeNotifier {
  SeeAllResponse? seeAllResponse;

  SeeAllScreenProvider(String? slugName) {
    sellAllScreenApi(slugName);
  }
  void sellAllScreenApi(String? slugName) async {
    var apiResponse =
        await SeeAllRepository.getSeeAllRepositoryData(slugName);

    if (apiResponse.success == true) {
      seeAllResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
