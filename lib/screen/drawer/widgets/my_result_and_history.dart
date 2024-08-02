import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';

class MyResultAndHistory extends StatelessWidget {
  const MyResultAndHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.border)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomText(
                  text: "Course wise My results & history",
                  color: AppColors.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                const Divider(
                  color: AppColors.title,
                ),
                Table(
                  // textDirection: TextDirection.rtl,
                  // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                  border: TableBorder.all(width: 2.0, color: AppColors.border),
                  children: const [
                    TableRow(children: [
                      Text(
                        "Course",
                        textScaleFactor: 1,
                      ),
                      Text("Quize", textScaleFactor: 1),
                      Text("Assig..", textScaleFactor: 1),
                      Text("Total..", textScaleFactor: 1),
                    ]),
                    TableRow(children: [
                      Text("UXD-006", textScaleFactor: 1),
                      Text("88", textScaleFactor: 1),
                      Text("18.6", textScaleFactor: 1),
                      Text("88.186..", textScaleFactor: 1),
                    ]),
                    TableRow(children: [
                      Text("ML-006", textScaleFactor: 1),
                      Text("88 ", textScaleFactor: 1),
                      Text("18.6", textScaleFactor: 1),
                      Text("88.186..", textScaleFactor: 1),
                    ]),
                    TableRow(children: [
                      Text("ML-007 ", textScaleFactor: 1),
                      Text("88", textScaleFactor: 1),
                      Text("18.6", textScaleFactor: 1),
                      Text("88.186..", textScaleFactor: 1),
                    ]),
                    TableRow(children: [
                      Text("ML-008 ", textScaleFactor: 1),
                      Text("88", textScaleFactor: 1),
                      Text("18.6", textScaleFactor: 1),
                      Text("88.186..", textScaleFactor: 1),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    )
        //no result found cart///
        // Column(
        //   children: [
        //     SizedBox(
        //       height: 20.h,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             color: AppColors.primary.withOpacity(.10),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Padding(
        //             padding:
        //                 EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/mentors/filter_vector.png',
        //                   height: 14.h,
        //                 ),
        //                 SizedBox(
        //                   width: 8.w,
        //                 ),
        //                 CustomText(
        //                   text: "Filter",
        //                   color: AppColors.primary,
        //                   fontSize: 14.sp,
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 14.w,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //             color: AppColors.primary.withOpacity(.10),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Padding(
        //             padding:
        //                 EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/mentors/search_vector.png',
        //                   height: 16.h,
        //                 ),
        //                 SizedBox(
        //                   width: 8.w,
        //                 ),
        //                 CustomText(
        //                   text: "Search",
        //                   color: AppColors.primary,
        //                   fontSize: 14.sp,
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 14.w,
        //         ),
        //         Container(
        //           decoration: BoxDecoration(
        //             color: AppColors.primary,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Padding(
        //             padding:
        //                 EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        //             child: Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/mentors/dwlnd_vector.png',
        //                   height: 14.h,
        //                 ),
        //                 SizedBox(
        //                   width: 8.w,
        //                 ),
        //                 CustomText(
        //                   text: "Download",
        //                   color: AppColors.white,
        //                   fontSize: 14.sp,
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 40.h,
        //     ),
        //     Image.asset(
        //       'assets/mentors/file_box.png',
        //       height: 214.h,
        //     ),
        //     SizedBox(
        //       height: 30.h,
        //     ),
        //     CustomText(
        //       text: 'You have no results found!',
        //       fontSize: 16.sp,
        //       fontWeight: FontWeight.w600,
        //       color: AppColors.title,
        //     ),
        //     SizedBox(
        //       height: 12.h,
        //     ),
        //     Text(
        //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         height: 1.6,
        //         letterSpacing: 1.2,
        //         color: AppColors.body,
        //         fontSize: 14.sp,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 50.h,
        //     ),
        //     Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        //       child: ElevatedbuttonWidget(
        //         text: "Find Courses",
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => const BestSellingCourseDetails(),
        //               ));
        //         },
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
