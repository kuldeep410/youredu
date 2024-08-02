import 'package:flutter/material.dart';
import 'package:lms/data/model/bookmark_response/bookmark_list_response.dart';
import 'package:lms/data/repository/bookmark_repository/bookmark_repository.dart';

class BookmarkScreenProvider extends ChangeNotifier {
  BookmarkListResponse? bookmarkResponse;

  BookmarkScreenProvider() {
    bookmarkApi();
  }




  void bookmarkApi() async {
    var apiResponse = await BookmarkRepository.getBookmarkRepositoryData();

    if (apiResponse.success == true) {
      bookmarkResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
