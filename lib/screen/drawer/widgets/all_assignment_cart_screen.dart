import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/data/model/dashbaord_response/dashboard_response.dart';
import 'package:lms/screen/drawer/widgets/all_assignment_list_cart.dart';

class AllAssignmentCart extends StatelessWidget {
   final Assignment? assignmentData;
  const AllAssignmentCart({
    Key? key,this.assignmentData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AllAssignmentListCart(
            title: assignmentData?.title,
            details: assignmentData?.details,
            status: assignmentData?.status,
            deadline: assignmentData?.deadline,
            
           ),
          SizedBox(
            height: 24.h,
          ),
           AllAssignmentListCart(
             title: assignmentData?.title,
            details: assignmentData?.details,
            status: assignmentData?.status,
            deadline: assignmentData?.deadline,),
          SizedBox(
            height: 24.h,
          ),
           AllAssignmentListCart(
            title: assignmentData?.title,
            details: assignmentData?.details,
            status: assignmentData?.status,
            deadline: assignmentData?.deadline,
          )
        ],
      ),
    );
  }
}
