import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lms/data/model/course_details_response/course_details_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_provider.dart';
import 'package:lms/screen/home/course_details/payment_list/payment_method.dart';
import 'package:lms/screen/home/course_details/payment_request/course_details_webview.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/nav_utail.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/course_details_content.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/course_details_shimmer.dart';
import 'package:lms/screen/home/course_details/course_details_screen/content/details_button_content.dart';

class CourseDetailsScreen extends StatelessWidget {
  final int? id;

  const CourseDetailsScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseDetailsProvider(id),
      child: Consumer<CourseDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Details'),
            ),
            body: FutureBuilder<CourseDetailsResponse?>(
                future: provider.courseDetailsApi(id),
                builder: (context, state) {
                  if (state.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w, vertical: 16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.data?.data?.details?.videoUrl != null
                                    ? YoutubePlayer(
                                        controller: provider.controller ??
                                            YoutubePlayerController(
                                              initialVideoId:
                                                  YoutubePlayer.convertUrlToId(
                                                      state.data!.data!.details!
                                                          .videoUrl!)!,
                                              flags: const YoutubePlayerFlags(
                                                autoPlay: false,
                                                mute: false,
                                              ),
                                            ),
                                        liveUIColor: Colors.amber,
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: CachedNetworkImage(
                                              height: 50.h,
                                              fit: BoxFit.cover,
                                              imageUrl: provider
                                                      .courseDetailsResponse
                                                      ?.data
                                                      ?.details
                                                      ?.creatorImg ??
                                                  "",
                                              placeholder: (context, url) =>
                                                  Center(
                                                child: Image.asset(
                                                    "assets/home_page/ic_no_image.png"),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      "assets/home_page/ic_no_image.png"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: provider
                                                        .courseDetailsResponse
                                                        ?.data
                                                        ?.details
                                                        ?.creatorName ??
                                                    "",
                                                color: AppColors.title,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              CustomText(
                                                text: provider
                                                        .courseDetailsResponse
                                                        ?.data
                                                        ?.details
                                                        ?.creatorTitle ??
                                                    "",
                                                color: AppColors.body,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          provider.bookmarkToggleApi(id);
                                        },
                                        icon: Icon(
                                          provider.courseDetailsResponse?.data
                                                      ?.details?.isBookmark ==
                                                  true
                                              ? Icons.bookmark_added_rounded
                                              : Icons.bookmark_add_outlined,
                                          color: AppColors.primary,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: provider.courseDetailsResponse?.data
                                              ?.details?.rating
                                              .toString() ??
                                          "",
                                      color: AppColors.title,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    RatingBarIndicator(
                                      rating: double.parse(
                                          "${provider.courseDetailsResponse?.data?.details?.rating ?? 0.0}"),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 15.0,
                                      direction: Axis.horizontal,
                                    ),
                                    // Image.asset(
                                    //   'assets/home_page/course_details_star.png',
                                    //   height: 13.h,
                                    // ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    CustomText(
                                      text:
                                          "(${provider.courseDetailsResponse?.data?.details?.ratingsCount ?? ""} ratings)",
                                      color: AppColors.primary,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/home_page/course_details_person.png',
                                      height: 16.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    CustomText(
                                      text:
                                          "${provider.courseDetailsResponse?.data?.details?.studentCount ?? ""} Students",
                                      color: AppColors.body,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomText(
                                  text: provider.courseDetailsResponse?.data
                                          ?.details?.title ??
                                      "",
                                  color: AppColors.title,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                HtmlWidget(provider.courseDetailsResponse?.data
                                        ?.details?.courseShortDescription ??
                                    ""),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: provider.courseDetailsResponse
                                          ?.data?.curriculum?.length ??
                                      0,
                                  itemBuilder: (context, i) {
                                    final data = provider.courseDetailsResponse
                                        ?.data?.curriculum?[i];
                                    return ExpansionTile(
                                      title: Text(
                                        data?.sectionName ?? '',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      children: <Widget>[
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: data?.lessons?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                // border: Border.all(
                                                //     color: AppColors.border)
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data?.lessons?[index]
                                                            .title ??
                                                        '',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff57595A),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/app_bar_icon/play_button.png',
                                                    height: 20,
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  },
                                ),
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1D1F)),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                HtmlWidget(provider.courseDetailsResponse?.data
                                        ?.details?.learnDescription ??
                                    ""),
                                SizedBox(
                                  height: 100.h,
                                ),
                              ],
                            ),
                          ),

                          // : const SizedBox(),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: provider.isProduct == false
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 30, left: 25, right: 25),
                    color: Colors.grey.shade200,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: provider.courseDetailsResponse?.data
                                      ?.details?.isDiscount
                                      .toString() ??
                                  "",
                              color: AppColors.title,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              provider.courseDetailsResponse?.data?.details
                                      ?.price
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                          onPressed: () {
                            // provider.cartAddApi(id, context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.0.w, vertical: 15.h),
                            child: CustomText(
                              text: "Buy Course",
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                :
                // : settingProvider
                //             .baseSettingsResponse?.data?.paymentGateway ==
                //         "1"
                // ?
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 30, left: 25, right: 25),
                    color: Colors.grey.shade200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        if (provider.courseDetailsResponse?.data?.details
                                ?.isPurchased ==
                            true) {
                          NavUtil.navigateScreen(
                              context,
                              CourseDetailsWebView(
                                courseId: provider
                                    .courseDetailsResponse?.data?.details?.id,
                                userId: provider.userId,
                              )
                              //  LearningScreen(url: "https://academy.onesttech.com/course/learning-course/${provider.slugName}")
                              );
                        } else {
                          // provider.getCourseEnrollApi(id,context,provider.slugName);
                          NavUtil.navigateScreen(
                              context,
                              PaymentMethod(
                                courseId: provider
                                    .courseDetailsResponse?.data?.details?.id,
                              ));
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.0.w, vertical: 15.h),
                        child: provider.courseDetailsResponse?.data?.details
                                    ?.isPurchased ==
                                true
                            ? CustomText(
                                text: "Start Learning",
                                // text: provider.bottomName,
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )
                            : CustomText(
                                text: "Buy Course",
                                // text: provider.bottomName,
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
