import 'package:flutter/material.dart';
import 'package:lms/data/model/mentors_response/mentors_profile_details_response.dart';

class BadgesCart extends StatelessWidget {
  final MentorsDetailsResponse? mentorsDetailsResponse;
  const BadgesCart({Key? key, this.mentorsDetailsResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Column());

    // Padding(
    //   padding: const EdgeInsets.only(top: 20.0),
    //   child: GridView.builder(
    //     itemCount: mentorsDetailsResponse?.data?.user?.badges?.length ?? 0,
    //     itemBuilder: (context, index) {
    //       return CachedNetworkImage(
    //         height: 60.h,
    //         imageUrl:
    //             mentorsDetailsResponse?.data?.user?.badges?[index].image ?? '',
    //         placeholder: (context, url) => Center(
    //           child: Image.asset("assets/home_page/ic_no_image.png"),
    //         ),
    //         errorWidget: (context, url, error) => const Icon(Icons.error),
    //       );
    //     },
    //     physics: const NeverScrollableScrollPhysics(),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       crossAxisSpacing: 30,
    //     ),
    //   ),
    // );
  }
}
