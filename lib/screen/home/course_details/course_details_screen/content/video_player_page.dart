import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/widgets/custom_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController? controller;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Video Player'),
      ),
      body: YoutubePlayer(
        controller: controller ??
            YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId("")!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
        liveUIColor: Colors.amber,
      ),
    );
  }
}
