import 'package:flutter/material.dart';
import 'package:youtube/controller/home_page_controller.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  HomePageController controller;
  CustomAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          width < 700
              ? const SizedBox()
              : IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    controller.menuButton();
                  },
                  icon: Container(
                    width: 60,
                    alignment: Alignment.center,
                    child: const Icon(Icons.menu_rounded),
                  ),
                ),
          Container(
            width: 150,
            height: 30,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/channels/youtube.png",
              scale: 40,
            ),
          ),
          const Spacer(),
          width < 900
              ? const SizedBox()
              : Container(
                  width: width / 3,
                  height: 50,
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade800,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
          Container(
            width: width < 900 ? 30 : 60,
            height: 50,
            decoration: BoxDecoration(
              color: width < 900 ? Colors.transparent : Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          Container(
            width: width < 900 ? 30 : 45,
            height: 45,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: width < 900 ? Colors.transparent : Colors.grey.shade800,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.mic,
              color: Colors.grey.shade300,
            ),
          ),
          width < 900 ? const SizedBox() : const Spacer(),
          Container(
            width: width < 900 ? 30 : 40,
            height: 40,
            margin: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.video_call_outlined,
              color: Colors.grey.shade300,
            ),
          ),
          Container(
            width: width < 900 ? 30 : 40,
            height: 40,
            margin: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("assets/channels/1ch.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
