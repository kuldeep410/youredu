import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lms/data/model/course_details_response/course_details_response.dart';
import 'package:lms/screen/home/course_details/course_details_screen/course_details_provider.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/widgets/custom_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailsContent extends StatelessWidget {
  final AsyncSnapshot<CourseDetailsResponse?>? state;
  final CourseDetailsProvider? provider;
  final int? id;
  const CourseDetailsContent({super.key, this.state, this.provider, this.id});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state?.data?.data?.details?.videoUrl != null
                      ? YoutubePlayer(
                          controller: provider?.controller ??
                              YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    state!.data!.data!.details!.videoUrl!)!,
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
                                imageUrl: provider?.courseDetailsResponse?.data
                                        ?.details?.creatorImg ??
                                    "",
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                      "assets/home_page/ic_no_image.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        "assets/home_page/ic_no_image.png"),
                              ),
                            ),
                            SizedBox(
                              width: 12.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: provider?.courseDetailsResponse?.data
                                          ?.details?.creatorName ??
                                      "",
                                  color: AppColors.title,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                CustomText(
                                  text: provider?.courseDetailsResponse?.data
                                          ?.details?.creatorTitle ??
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
                            provider?.bookmarkToggleApi(id);
                          },
                          icon: Icon(
                            provider?.courseDetailsResponse?.data?.details
                                        ?.isBookmark ==
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
                        text: provider
                                ?.courseDetailsResponse?.data?.details?.rating
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
                            "${provider?.courseDetailsResponse?.data?.details?.rating ?? 0.0}"),
                        itemBuilder: (context, index) => const Icon(
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
                            "(${provider?.courseDetailsResponse?.data?.details?.ratingsCount ?? ""} ratings)",
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
                            "${provider?.courseDetailsResponse?.data?.details?.studentCount ?? ""} Students",
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
                    text:
                        provider?.courseDetailsResponse?.data?.details?.title ??
                            "",
                    color: AppColors.title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  HtmlWidget(provider?.courseDetailsResponse?.data?.details
                          ?.courseShortDescription ??
                      ""),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider
                            ?.courseDetailsResponse?.data?.curriculum?.length ??
                        0,
                    itemBuilder: (context, i) {
                      final data =
                          provider?.courseDetailsResponse?.data?.curriculum?[i];
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
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data?.lessons?.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  provider?.lessonTypePage(context,
                                      data?.lessons?[index].lessonType ?? '');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    // border: Border.all(
                                    //     color: AppColors.border)
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        data?.lessons?[index].title ?? '',
                                        style: const TextStyle(
                                            color: Color(0xff57595A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      data?.lessons?[index].lessonType ==
                                              "Youtube"
                                          ? Image.asset(
                                              'assets/app_bar_icon/play_button.png',
                                              height: 20,
                                            )
                                          : const Icon(
                                              Icons.article_outlined,
                                              color: AppColors.primary,
                                              size: 20,
                                            )
                                    ],
                                  ),
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
                  HtmlWidget(provider?.courseDetailsResponse?.data?.details
                          ?.learnDescription ??
                      ""),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
