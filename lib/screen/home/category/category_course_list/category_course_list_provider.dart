import 'package:flutter/material.dart';
import 'package:lms/data/model/category_response/category_course_list_response.dart';
import 'package:lms/data/repository/category_repository/category_details_repository.dart';

class CategoryCourseListProvider extends ChangeNotifier {
  CategoryCourseListResponse? categoryDetailsResponse;
  bool? isSubTitle;

  CategoryCourseListProvider(int? categoryId) {
    categoryDetailsApi(categoryId);
  }

  void categoryDetailsApi(int? categoryId) async {
    var apiResponse =
        await CategoryCourseListRepository.getCategoryCourseListData(
            categoryId);
    if (apiResponse.success == true) {
      categoryDetailsResponse = apiResponse.data;
      // subCategory();
      notifyListeners();
    }
  }

  // subCategory() {
  //   if (categoryDetailsResponse!.data!.subCategories!.isEmpty) {
  //     isSubTitle = false;
  //   } else {
  //     isSubTitle = true;
  //   }
  //   notifyListeners();
  // }
}
