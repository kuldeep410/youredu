import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/drawer/drawer_screen/drawer_screen.dart';
import 'package:lms/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:lms/screen/mentor_section/widgets/instructors_cart.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:provider/provider.dart';

class InstructorScreen extends StatefulWidget {
  const InstructorScreen({Key? key}) : super(key: key);

  @override
  State<InstructorScreen> createState() => _InstructorScreenState();
}

class _InstructorScreenState extends State<InstructorScreen> {
  // with SingleTickerProviderStateMixin
  // TabController? _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 3, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MentorsScreenProvider(),
      child: Consumer<MentorsScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              provider.getSearchValue(value);
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.title.withOpacity(0.3),
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: AppColors.border),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Image.asset(
                                    'assets/home_page/payment/Vector.png',
                                    scale: 1.5,
                                  ),
                                ),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        // Image.asset(
                        //   'assets/home_page/payment/filter_Icon.png',
                        //   height: 47,
                        // )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    InstructorsCart(mentorsResponse: provider.mentorsResponse),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
