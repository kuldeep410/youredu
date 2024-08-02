import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  const BookmarkAppBar({Key? key, this.appBarName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/app_bar_icon/back_vector.png',
            ),
          ),
        ),
        elevation: 0,
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          '$appBarName',
          // 'Forget Password',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
