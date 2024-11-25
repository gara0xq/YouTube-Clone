import 'package:flutter/material.dart';
import 'package:youtube/controller/home_page_controller.dart';

// ignore: must_be_immutable
class Sidebar extends StatelessWidget {
  HomePageController controller;
  Sidebar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height - 50,
      width: width < 900 ? 0 : controller.sideBarSize,
      child: !controller.drawerOpen && controller.isMobile
          ? const SizedBox()
          : Column(
              children: [
                SideBarItem(
                    controller: controller,
                    icon: Icons.home_rounded,
                    title: "Home"),
                SideBarItem(
                    controller: controller,
                    icon: Icons.video_label,
                    title: "Shorts"),
                SideBarItem(
                    controller: controller,
                    icon: Icons.subscriptions,
                    title: "Subscriptions"),
                SideBarItem(
                    controller: controller,
                    icon: Icons.person_outline,
                    title: "You"),
                SideBarItem(
                  controller: controller,
                  icon: Icons.download_done,
                  title: "Downloads",
                ),
              ],
            ),
    );
  }
}

// ignore: must_be_immutable
class SideBarItem extends StatelessWidget {
  bool isHover = false;
  HomePageController controller;
  IconData icon;
  String title;

  SideBarItem(
      {super.key,
      required this.controller,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      onHover: (value) {
        isHover = value;
      },
      child: controller.menuOpen || controller.drawerOpen
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Icon(icon),
                  const Spacer(),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isHover ? Colors.grey.withAlpha(30) : Colors.transparent,
              ),
              child: Column(
                children: [
                  Icon(icon),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
    );
  }
}
