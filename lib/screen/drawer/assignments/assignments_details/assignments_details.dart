import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/assignments/assignment_uploaded/assignment_uploaded_screen.dart';
import 'package:lms/screen/drawer/assignments/assignments_details/assignment_details_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:lms/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

class AssignmentsDetailsPage extends StatelessWidget {
  final int? detailsId;
  const AssignmentsDetailsPage({super.key, this.detailsId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssignmentDetailsProvider(detailsId),
      child: Consumer<AssignmentDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Assignments Details'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: provider.assignmentResponse?.data?.assignment
                            ?.courseTitle ??
                        "Title Not found",
                    color: AppColors.title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: provider
                            .assignmentResponse?.data?.assignment?.details ??
                        "Details Not Found",
                    color: AppColors.body,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: "Assign By ",
                    color: AppColors.title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.body,
                        child: CachedNetworkImage(
                          height: 60.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                          imageUrl: provider.assignmentResponse?.data
                                  ?.assignment?.instructor?.image ??
                              '',
                          placeholder: (context, url) => Center(
                            child:
                                Image.asset("assets/home_page/ic_no_image.png"),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/home_page/ic_no_image.png"),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: provider.assignmentResponse?.data?.assignment
                                    ?.instructor?.name ??
                                'Name not found',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.title,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomText(
                            text: provider.assignmentResponse?.data?.assignment
                                    ?.instructor?.designation ??
                                'Mathmatics',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.body,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    text: "File Attachments",
                    color: AppColors.title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  provider.assignmentResponse?.data?.assignment?.file != null
                      ? Row(
                          children: [
                            CachedNetworkImage(
                              height: 41.h,
                              fit: BoxFit.cover,
                              imageUrl: provider.assignmentResponse?.data
                                      ?.assignment?.file?.image ??
                                  '',
                              placeholder: (context, url) => Center(
                                child: Image.asset(
                                    "assets/home_page/ic_no_image.png"),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                  "assets/home_page/ic_no_image.png"),
                            ),
                            // Image.network(
                            //   provider.assignmentResponse?.data?.assignment?.file
                            //           ?.image ??
                            //       '',
                            //   height: 41.h,
                            // ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: provider.assignmentResponse?.data
                                                ?.assignment?.file?.name ??
                                            '',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.title,
                                      ),
                                      // CustomText(
                                      //   text: '4.5MB',
                                      //   fontSize: 12.sp,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: AppColors.title,
                                      // ),
                                      CustomText(
                                        text: 'Download',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryBg,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: CustomText(
                            text: 'Not Submitted Assignment Yet',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.title,
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Spacer(),
                  provider.assignmentResponse?.data?.assignment?.status ==
                          'Not Submitted'
                      ? ElevatedButtonWidget(
                          text: 'Add Submission',
                          onPressed: () {
                            NavUtil.navigateScreen(
                                context,
                                AssignmentUploadedScreen(
                                  assignmentId: provider.assignmentResponse
                                          ?.data?.assignment?.id ??
                                      0,
                                ));
                            // showDialog(
                            //   context: context,
                            //   builder: (ctx) => AlertDialog(
                            //     actions: <Widget>[
                            //       Center(
                            //         child: Padding(
                            //           padding: EdgeInsets.symmetric(vertical: 50.0.h),
                            //           child: Column(
                            //             children: [
                            //               CustomText(
                            //                 text: 'Upload your Assignment',
                            //                 fontSize: 16.sp,
                            //                 fontWeight: FontWeight.w700,
                            //                 color: AppColors.title,
                            //               ),
                            //               SizedBox(
                            //                 height: 32.h,
                            //               ),
                            //               Center(
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     const UploadAssignmentCart(
                            //                       image:
                            //                           'assets/home_page/upload_vector.png',
                            //                       title: 'Upload from\nmobile',
                            //                     ),
                            //                     SizedBox(
                            //                       width: 16.w,
                            //                     ),
                            //                     const UploadAssignmentCart(
                            //                       image:
                            //                           'assets/home_page/upload_vector.png',
                            //                       title: 'Upload from\nmobile',
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // );
                          },
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UploadAssignmentCart extends StatelessWidget {
  final String? image;
  final String? title;

  const UploadAssignmentCart({Key? key, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavUtil.navigateScreen(context, const AssignmentUploadedScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.primaryBg.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                image ?? '',
                // 'assets/home_page/upload_vector.png',
                height: 24.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                title ?? '',
                // 'Upload from\nmobile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.body,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
