import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/profile_response/profile_response.dart';
import 'package:lms/screen/drawer/assignments/assignments_details/assignments_details.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_text.dart';

class AssignmentCart extends StatelessWidget {
  final ProfileResponse? profileResponse;

  const AssignmentCart({Key? key, this.profileResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return profileResponse?.data?.assignment?.isEmpty == true
        ? const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Assignment not found",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black26),
            ),
          )
        : ListView.builder(
            // scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: profileResponse?.data?.assignment?.length ?? 0,
            itemBuilder: (context, index) {
              final data = profileResponse?.data?.assignment?[index];
              return AllAssignmentListCart(
                deadline: data?.deadline.toString(),
                details: data?.details ?? '',
                status: 'Not Submitted',
                title: "${data?.title}".split(" ")[0],
                onTap: () {
                  return NavUtil.navigateScreen(
                      context,
                      AssignmentsDetailsPage(
                        detailsId: data?.id,
                      ));
                },
              );
            },
          );
  }
}

class AssignmentListCart extends StatelessWidget {
  final String? assignmentType;
  const AssignmentListCart({Key? key, this.assignmentType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
        ),
        CustomText(
          text: assignmentType,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.title,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultricies enim, donec id arcu, tristique sed. Pulvinar diam, eget tempor sed mattis eu.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.body,
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.h),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/mentors/time_vector.png',
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomText(
                      text: "Check timeline",
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 26.0.w, vertical: 8.h),
                child: CustomText(
                  text: "Submitted",
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
