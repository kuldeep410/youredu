import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/home_response/home_response.dart';
import 'package:lms/data/model/slider_response/slider_response.dart';
import 'package:lms/data/repository/home_repository/home_repository.dart';
import 'package:lms/utils/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<Category>? categories;
  List<dynamic>? featuredClasses;
  List<Course>? latestClasses;
  List<Course>? bestRates;
  List<Course>? bestSellers;
  List<Slider>? sliders = [];
  List<Course>? freeClasses;
  List<Course>? discountClasses;
  List<SliderList> sliderList = [];
  List<String>? imageList;
  int? pageIndex = 0;
  String? userName;
  String? userId;
  String? userAvatar;

  HomeProvider() {
    getUserData();
    getHomeData();
  }

  final List<Widget> image = [
    Image.asset(
      'assets/home_page/banner.png',
      height: 155.h,
    ),
    Image.asset(
      'assets/home_page/banner.png',
      height: 155.h,
    ),
    Image.asset(
      'assets/home_page/banner.png',
      height: 155.h,
    )
  ];

  void changePage(int? index) {
    pageIndex = index;
    notifyListeners();
  }

  void getHomeData() async {
    var apiResponse = await HomeRepository.getHomeApi();

    if (apiResponse.success == true) {
      sliders = apiResponse.data?.data?.sliders;
      categories = apiResponse.data?.data?.categories;
      featuredClasses = apiResponse.data?.data?.courses?.featuredCourses;
      latestClasses = apiResponse.data?.data?.courses?.latestCourses;
      bestRates = apiResponse.data?.data?.courses?.bestRatedCourses;
      bestSellers = apiResponse.data?.data?.courses?.bestSellingCourses;
      freeClasses = apiResponse.data?.data?.courses?.freeCourses;
      discountClasses = apiResponse.data?.data?.courses?.discountCourses;
      notifyListeners();
    }
  }

  void getUserData() async {
    userName = await SPUtill.getValue(SPUtill.keyName);
    userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
    userId = await SPUtill.getValue(SPUtill.keyUserId);

    notifyListeners();
  }
}
