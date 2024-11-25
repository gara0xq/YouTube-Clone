import 'package:flutter/material.dart';
import 'package:youtube/controller/home_page_controller.dart';
import 'package:youtube/utils/videos.dart';
import 'package:youtube/view/widgets/video_box.dart';

// ignore: must_be_immutable
class MainVideos extends StatelessWidget {
  HomePageController controller;
  MainVideos({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height - 250,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width < 700
              ? 1
              : width < 1100
                  ? 2
                  : width < 1400
                      ? 3
                      : width < 1700
                          ? 4
                          : 5,
        ),
        itemCount: videos.length,
        itemBuilder: (_, i) {
          return Videobox(
            title: videos[i].title,
            channelName: videos[i].channelName,
            channelImage: videos[i].channelImage,
            videoImage: videos[i].videoImage,
            dateSince: videos[i].dateSince,
            views: videos[i].views!,
          );
        },
      ),
    );
  }
}
