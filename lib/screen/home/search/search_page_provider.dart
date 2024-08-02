import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/model/search_Response/search_page_response.dart';
import 'package:lms/data/repository/search_repository/search_page_repository.dart';

class SearchPageProvider extends ChangeNotifier {
  SearchPageResponse? searchPageResponse;
  String search = "";
  Timer? timeHandle;

  SearchPageProvider() {
    // searchScreenApi(search);
  }
  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }
 
    timeHandle = Timer(const Duration(seconds: 1), () {
      searchScreenApi(search);
      notifyListeners();
    });

    //print("controller page $searchCode");
  }

  void searchScreenApi(String? search) async {
    var apiResponse =
        await SearchPageRepository.getSearchPageRepositoryData(search);

    if (apiResponse.success == true) {
      searchPageResponse = apiResponse.data;
      if (searchPageResponse?.result == true) {
        Fluttertoast.showToast(msg: searchPageResponse?.message ?? "");
      }
      notifyListeners();
    }
  }
}
