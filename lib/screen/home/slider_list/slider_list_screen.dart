// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lms/screen/home/course_details/course_details_screen/course_details_screen.dart';
// import 'package:lms/screen/home/slider_list/slider_list_provider.dart';
// import 'package:lms/screen/home/widgets/best_selling_courses_cart.dart';
// import 'package:lms/widgets/custom_app_bar.dart';
// import 'package:provider/provider.dart';

// class SliderListScreen extends StatelessWidget {
//   final int? sliderId;

//   const SliderListScreen({Key? key, this.sliderId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => SliderListProvider(sliderId),
//       child: Consumer<SliderListProvider>(
//         builder: (context, provider, _) {
//           return Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(70.h),
//               child: const CustomAppBar(appBarName: 'Slider Details'),
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     imageUrl: provider.sliderDetailsResponse?.data?.image ?? "",
//                     placeholder: (context, url) => Center(
//                       child: Image.asset("assets/home_page/ic_no_image.png"),
//                     ),
//                     errorWidget: (context, url, error) =>
//                         Image.asset("assets/home_page/ic_no_image.png"),
//                   ),
//                   ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: provider
//                               .sliderDetailsResponse?.data?.webinars?.length ??
//                           0,
//                       itemBuilder: (context, index) {
//                         var data = provider
//                             .sliderDetailsResponse?.data?.webinars?[index];
//                         return BestSellingCoursesCart(
//                           image: data?.image ?? "",
//                           courseTitle: data?.title ?? "",
//                           price: data?.price.toString() ?? "",
//                           reviewCount: data?.reviewsCount ?? 0,
//                           rate: data?.rate ?? "",
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       CourseDetailsScreen(id: data?.id),
//                                 ));
//                           },
//                         );
//                       })
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
