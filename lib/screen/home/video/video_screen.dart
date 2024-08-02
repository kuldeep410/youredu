// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lms/data/model/course_details_response/course_details_response.dart';
// import 'package:lms/utils/app_consts.dart';
// import 'package:lms/widgets/custom_app_bar.dart';
// import 'package:lms/widgets/custom_text.dart';
// import 'package:video_player/video_player.dart';

// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   final CourseDetailsResponse? courseDetailsResponse;
//   const VideoApp({Key? key, this.courseDetailsResponse}) : super(key: key);

//   @override
//   State<VideoApp> createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//     _controller = VideoPlayerController.network(
//         "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.h),
//         child: const CustomAppBar(appBarName: 'Video Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           _controller.value.isPlaying
//                               ? _controller.pause()
//                               : _controller.play();
//                         });
//                       },
//                       child: Stack(children: [
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: VideoPlayer(_controller)),
//                         _controller.value.isPlaying
//                             ? const SizedBox()
//                             : Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 top: 0,
//                                 child: Image.asset(
//                                   'assets/home_page/video_vector.png',
//                                 ))
//                       ]),
//                     ),
//                   )
//                 : Container(),
//             SizedBox(
//               height: 12.h,
//             ),
//             CustomText(
//               text: widget.courseDetailsResponse?.data?.details?.slug ?? "",
//               color: AppColors.title,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w600,
//             ),
//             // SizedBox(
//             //   height: 12.h,
//             // ),
//             Html(
//               data: """
//                   ${widget.courseDetailsResponse?.data?.details?.courseShortDescription ?? ""}
//                   """,
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       _controller.value.isPlaying
//       //           ? _controller.pause()
//       //           : _controller.play();
//       //     });
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
