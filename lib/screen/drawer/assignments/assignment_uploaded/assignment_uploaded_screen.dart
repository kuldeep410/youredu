import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/assignments/assignment_uploaded/assignment_upload_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:lms/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

class AssignmentUploadedScreen extends StatelessWidget {
  const AssignmentUploadedScreen({super.key, this.assignmentId});
  final int? assignmentId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssignmentUploadProvider(assignmentId: assignmentId),
      child: Consumer<AssignmentUploadProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Assignments Details'),
            ),
            body: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 36.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 24.w),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryBg),
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0.w, vertical: 16.h),
                          child: Column(
                            children: [
                              CustomText(
                                text: 'You Uploaded',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.title,
                              ),
                              const Divider(),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  provider.pickAssignmentFile();
                                },
                                child: Container(
                                  height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryBg),
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColors.white),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0.w, vertical: 8.h),
                                    child: Center(
                                      child: provider.assignmentFileName == null
                                          ? const Text(
                                              "Add A File",
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(provider.assignmentFileName ??
                                              ''),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Image.asset(
                                    //       'assets/home_page/file_img.png',
                                    //       height: 20.h,
                                    //     ),
                                    //     SizedBox(
                                    //       width: 6.w,
                                    //     ),
                                    //     CustomText(
                                    //       text: '2 files',
                                    //       fontSize: 16.sp,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: const Color(0xff4A43EC),
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 36.h),
                  child: ElevatedButtonWidget(
                    onPressed: () {
                      provider.uploadFile(context, assignmentId);
                    },
                    text: 'Submit',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
