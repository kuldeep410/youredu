import 'package:flutter/material.dart';
import 'package:lms/data/model/mentors_response/mentors_profile_details_response.dart';
import 'package:lms/data/repository/metors_repository/mentors_profile_details_repository.dart';

class MentorsProfileDetailsProvider extends ChangeNotifier {
  MentorsDetailsResponse? mentorsDetailsResponse;
  String? type = "about";
  int? userResponseId;

  MentorsProfileDetailsProvider(int? userId) {
    userResponseId = userId;
    mentorsScreenApi();
  }

  // void selectTab(int index) {
  //   int selectTab = index;
  //   switch (selectTab) {
  //     case 0:
  //       mentorsScreenApi("about");
  //       break;
  //     case 1:
  //       mentorsScreenApi("course");
  //       break;
  //     case 2:
  //       mentorsScreenApi(
  //         "badge",
  //       );
  //       break;
  //     case 3:
  //       mentorsScreenApi(
  //         "review",
  //       );
  //       break;

  //     default:
  //   }
  //   notifyListeners();
  // }

  void mentorsScreenApi() async {
    var apiResponse =
        await MentorsProfileDetailsRepository.getMentorsProfileDetailsData(userResponseId);
    if (apiResponse.success == true) {
      mentorsDetailsResponse = apiResponse.data;
      notifyListeners();
    }
  }
}
