import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/controller/home_page_controller.dart';
import 'package:youtube/utils/videos.dart';
import 'package:youtube/view/widgets/custom_app_bar.dart';
import 'package:youtube/view/widgets/main_videos.dart';
import 'package:youtube/view/widgets/recomendation_taps.dart';
import 'package:youtube/view/widgets/side_bar.dart';
import 'package:youtube/view/widgets/video_box.dart';

class HomePageScreen extends StatelessWidget {
  final controller = Get.put(HomePageController());
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (width < 900) {
      controller.menuOpen = false;
      controller.isMobile = true;
      controller.sideBarSize = 60;
    } else {
      controller.isMobile = false;
      controller.drawerOpen = false;
    }
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return Column(
            children: [
              CustomAppBar(controller: controller),
              Stack(
                children: [
                  SizedBox(
                    height: height - 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        width < 900
                            ? const SizedBox()
                            : Sidebar(controller: controller),
                        SizedBox(
                          width: width < 900
                              ? width
                              : width - controller.sideBarSize,
                          child: Column(
                            children: [
                              RecomendationTaps(controller: controller),
                              SizedBox(
                                height: height - 120,
                                child: ListView(
                                  children: [
                                    MainVideos(controller: controller),
                                    MainVideos(controller: controller),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  width > 900
                      ? const SizedBox()
                      : Container(
                          height: height - 70,
                          width: controller.drawerOpen ? 250 : 0,
                          color: const Color(0xff0f0f0f),
                          child: Sidebar(controller: controller),
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
