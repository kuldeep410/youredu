import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lms/data/model/all_courses_response/all_courses_response.dart';
import 'package:lms/data/repository/all_courses_repository/all_courses_repository.dart';

class AllCoursesProvider extends ChangeNotifier {
  AllCoursesResponse? allCoursesResponse;
  String search = "";
  Timer? timeHandle;

  AllCoursesProvider() {
    mentorsScreenApi(search);
  }
  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }

    timeHandle = Timer(const Duration(seconds: 1), () {
      mentorsScreenApi(search);
      notifyListeners();
    });

    //print("controller page $searchCode");
  }

  void mentorsScreenApi(String? search) async {
    var apiResponse = await AllCoursesRepository.getAllCoursesRepositoryData(search);

    if (apiResponse.success == true) {
      allCoursesResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
