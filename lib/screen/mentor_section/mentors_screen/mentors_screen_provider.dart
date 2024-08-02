import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lms/data/model/mentors_response/mentors_response.dart';
import 'package:lms/data/repository/metors_repository/mentors_repository.dart';

class MentorsScreenProvider extends ChangeNotifier {
  MentorsResponse? mentorsResponse;
  String search = "";
  Timer? timeHandle;
  String? type = "instractors";

  MentorsScreenProvider() {
    mentorsScreenApi(type, search);
  }
  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }

    timeHandle = Timer(const Duration(seconds: 1), () {
      mentorsScreenApi(type, search);
      notifyListeners();
    });

    //print("controller page $searchCode");
  }

  void selectTab(int index) {
    int selectTab = index;
    switch (selectTab) {
      case 0:
        mentorsScreenApi("instractors", search);
        type = "instractors";
        notifyListeners();
        break;
      case 1:
        mentorsScreenApi("organizations", search);
        type = "organizations";
          notifyListeners();
        break;
      case 2:
        mentorsScreenApi("consultations", search);
        type = "instractors";
          notifyListeners();
        break;
      default:
    }
  }

  void mentorsScreenApi(String? type, String? search) async {
    var apiResponse =
        await MentorsRepository.getMentorsRepositoryData(type, search);

    if (apiResponse.success == true) {
      mentorsResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
