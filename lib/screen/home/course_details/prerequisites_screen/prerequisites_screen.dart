// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lms/data/model/favorites_response/favorites_toggle_response.dart';
// import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
// import 'package:lms/screen/home/widgets/most_popular_cart.dart';
// import 'package:lms/widgets/custom_app_bar.dart';

// class PrerequisitesScreen extends StatelessWidget {
//   final FavoritesToggleResponse? favoritesToggleResponse;

//   const PrerequisitesScreen({Key? key, this.favoritesToggleResponse})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(70.h),
//           child: const CustomAppBar(appBarName: 'Prerequisites course'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: GridView.builder(
//               itemCount: favoritesToggleResponse?.data?.length ?? 0,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12.w,
//                   mainAxisExtent: 250.h,
//                   mainAxisSpacing: 16.h),
//               itemBuilder: (context, index) {
//                 return CoursesCart(
//                   id: favoritesToggleResponse?.data?[index].webinar?.id,
//                   assetImage:
//                       favoritesToggleResponse?.data?[index].webinar?.image ?? "",
//                   title:
//                       favoritesToggleResponse?.data?[index].webinar?.title ?? "",
//                   price:
//                       favoritesToggleResponse?.data?[index].webinar?.price ?? "",
//                   review: favoritesToggleResponse
//                           ?.data?[index].webinar?.reviewsCount ??
//                       0,
//                   isFavourite:
//                       favoritesToggleResponse?.data?[index].webinar?.isFavorite,
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CourseDetailsScreen(
//                               id: favoritesToggleResponse
//                                   ?.data?[index].webinar?.id),
//                         ));
//                   },
//                 );
//               }),
//         ));
//   }
// }
