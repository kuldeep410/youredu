import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/widgets/shimmers.dart';

class CourseDetailsShimmer extends StatelessWidget {
  const CourseDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const RectangularCardShimmer(
              height: 250,
              width: double.infinity,
            ),
            SizedBox(
              height: 20.h,
            ),
            const RectangularCardShimmer(
              height: 60,
              width: double.infinity,
            ),
            SizedBox(
              height: 10.h,
            ),
            const RectangularCardShimmer(
              height: 60,
              width: double.infinity,
            ),
            SizedBox(
              height: 20.h,
            ),
            const RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 10.h,
            ),
            const RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 10.h,
            ),
            const RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 10.h,
            ),
            const RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 10.h,
            ),
            const RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
