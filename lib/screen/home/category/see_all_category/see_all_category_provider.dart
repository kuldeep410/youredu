import 'package:flutter/material.dart';
import 'package:lms/data/model/category_response/featured_category_response.dart';
import 'package:lms/data/repository/category_repository/see_all_category_repository.dart';

class SeeAllCategoryProvider extends ChangeNotifier {
  List<Category>? categories;

  SeeAllCategoryProvider() {
    seeAllCategoryData();
  }

  void seeAllCategoryData() async {
    var apiResponse = await SeeAllCategoryRepository.getSellAllCategoryApi();

    if (apiResponse.success == true) {
      categories = apiResponse.data?.data?.categories;
      notifyListeners();
    }
  }
}
