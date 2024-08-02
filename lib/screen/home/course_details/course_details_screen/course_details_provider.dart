import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lms/data/model/bookmark_response/bookmark_response.dart';
import 'package:lms/data/model/course_details_response/course_details_response.dart';
import 'package:lms/data/model/course_enroll_response/course_enroll_response.dart';
import 'package:lms/data/model/favorites_response/favorites_toggle_response.dart';
import 'package:lms/data/repository/course_details_repository/course_details_repository.dart';
import 'package:lms/screen/home/course_details/learning_screen/learning_screen.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/utils/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/details_text_content.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/video_player_page.dart';

class CourseDetailsProvider extends ChangeNotifier {
  CourseDetailsResponse? courseDetailsResponse;
  BookmarkResponse? bookmarkToggleResponse;
  CourseEnrollResponse? courseEnrollResponse;
  bool? isProduct;
  String? bottomName;
  String? slugName;
  String? userId;
  String? videoId;
  YoutubePlayerController? controller;

  CourseDetailsProvider(int? id) {
    // controller.initialVideoId = "3l6Q4QL-j4Q";
    courseDetailsApi(id);
    getUserData();
  }

  void getUserData() async {
    userId = await SPUtill.getValue(SPUtill.keyUserId);
  }

  Future<CourseDetailsResponse?> courseDetailsApi(int? id) async {
    var apiResponse =
        await CourseDetailsRepository.getCourseDetailsRepositoryApi(id);
    if (apiResponse.success == true) {
      courseDetailsResponse = apiResponse.data;
      return apiResponse.data!;
    }
    return null;
  }

  void getCourseEnrollApi(id, context, slugName) async {
    var apiResponse = await CourseDetailsRepository.getCourseEnrollApi(id);
    if (apiResponse.success == true) {
      courseEnrollResponse = apiResponse.data;

      if (courseEnrollResponse?.status == "enrolled") {
        NavUtil.navigateScreen(
            context,
            LearningScreen(
                url: "${AppConst.baseUrl}/course/learning-course/$slugName"));
      } else {
        Fluttertoast.showToast(msg: courseEnrollResponse?.message ?? "");
      }
      notifyListeners();
    }
  }

  lessonTypePage(context, String type) {
    switch (type) {
      case 'Youtube':
        return NavUtil.navigateScreen(context, const VideoPlayerPage());
      case "Text":
        return NavUtil.navigateScreen(context, const DetailsTextContent());
    }
  }

  void bookmarkToggleApi(int? id) async {
    var apiResponse = await CourseDetailsRepository.bookmarkToggle(id);
    if (apiResponse.success == true) {
      courseDetailsApi(id);
      bookmarkToggleResponse = apiResponse.data;
      if (bookmarkToggleResponse?.result == true) {
        Fluttertoast.showToast(msg: apiResponse.message ?? '');
      } else {
        Fluttertoast.showToast(msg: "Something went wrong");
      }
      notifyListeners();
    }
  }
}

Future<void> showMyDialog(
    context, FavoritesToggleResponse? favoritesToggleResponse) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("${favoritesToggleResponse?.message}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              // NavUtil.navigateScreen(
              //     context,
              //     PrerequisitesScreen(
              //         favoritesToggleResponse: favoritesToggleResponse));
            },
          ),
        ],
      );
    },
  );
}
