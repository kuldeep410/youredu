import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/widgets/shimmers.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const RectangularCardShimmer(
            height: 200,
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
            height: 20.h,
          ),
          const HorizontalListShimmer(),
          SizedBox(
            height: 20.h,
          ),
          const RectangularCardShimmer(
            height: 30,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.h,
          ),
          const HorizontalListShimmer()
        ],
      ),
    );
  }
}
