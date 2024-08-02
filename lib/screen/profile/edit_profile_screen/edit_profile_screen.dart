import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/screen/profile/edit_profile_screen/edit_profile_provider.dart';
import 'package:lms/screen/profile/widgets/basic_info_content.dart';
import 'package:lms/screen/profile/widgets/password_content.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileProvider(),
      child: Consumer<EditProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Edit Profile'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Column(
                        children: [
                          // ClipOval(
                          //   child: CachedNetworkImage(
                          //     height: 130.h,
                          //     width: 130.w,
                          //     fit: BoxFit.cover,
                          //     imageUrl: provider.userAvatar ?? '',
                          //     placeholder: (context, url) => Center(
                          //       child: Image.asset(
                          //           "assets/home_page/ic_no_image.png"),
                          //     ),
                          //     errorWidget: (context, url, error) => Image.asset(
                          //         "assets/home_page/ic_no_image.png"),
                          //   ),
                          // ),
                          InkWell(
                            onTap: () => provider.pickImage(context),
                            child: provider.imagePath == null
                                ? provider.userAvatar != null
                                    ? Container(
                                        height: 84.h,
                                        width: 84.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                provider.userAvatar ?? '',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            border: Border.all(
                                                color: const Color(0xff999999),
                                                width: 2)),
                                      )
                                    : Container(
                                        height: 84.h,
                                        width: 84.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.border),
                                      )
                                : Container(
                                    height: 84.h,
                                    width: 84.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(
                                            provider.imagePath!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            color: const Color(0xff999999),
                                            width: 2)),
                                  ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomText(
                            text: provider.userName ?? '',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.title,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          CustomText(
                            text:
                                'Member since ${provider.userJoinDate ?? ''}',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColors.body,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.primary,
                        labelStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w700),
                        tabs: const [
                          Tab(
                            text: 'Basic Info',
                          ),
                          Tab(
                            text: 'Password',
                          ),
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab),
                    SizedBox(
                      height: 480.h,
                      child: TabBarView(controller: _tabController, children: [
                        BasicInfoContent(provider: provider),
                         PasswordContent(provider: provider),
                      ]),
                    ),
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
