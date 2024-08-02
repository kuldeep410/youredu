import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  final Function()? onPressed;

  const NewAppBar({Key? key, this.appBarName, this.onTap, this.onPressed})
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
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset(
              'assets/home_page/icons8-menu-30.png',
              height: 20, // Height ka value yahaan set karein
              width: 20, // Width ka value yahaan set karein
            ),
          ),
        ),
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '$appBarName',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
          //   child: InkWell(
          //     onTap: onPressed,
          //     child: Image.asset('assets/home_page/add_to_cart.png'),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(17),
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                'assets/home_page/icons8-doorbell-60.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
