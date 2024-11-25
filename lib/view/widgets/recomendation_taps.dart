import 'package:flutter/material.dart';
import 'package:youtube/controller/home_page_controller.dart';

// ignore: must_be_immutable
class RecomendationTaps extends StatelessWidget {
  HomePageController controller;
  RecomendationTaps({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, i) => const SizedBox(width: 10),
        itemCount: controller.recomendationTaps.length,
        itemBuilder: (_, i) {
          return RecommendTap(controller: controller, index: i);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class RecommendTap extends StatelessWidget {
  HomePageController controller;
  int index;
  bool isHover = false;
  RecommendTap({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (value) {
        isHover = value;
      },
      onTap: () {
        controller.changeRecommendTap(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: index == controller.currentRecomendedTap
              ? Colors.white
              : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          controller.recomendationTaps[index],
          style: TextStyle(
              color: index == controller.currentRecomendedTap
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
