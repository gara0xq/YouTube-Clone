import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  bool menuOpen = false;
  bool drawerOpen = false;
  bool isMobile = false;
  double sideBarSize = 90;
  int currentRecomendedTap = 0;
  double mainSectionWidth = 0;

  List<String> recomendationTaps = [
    "All",
    "Music",
    "Gaming",
    "Geometry",
    "Computer programming",
    "Study skills",
    "Computer files",
    "Products",
    "Macintosh",
    "Media theories",
    "User interface design",
    "Thoughts",
    "Visual Effects",
    "Mixes",
    "Calisthenics",
    "Vocabulary",
    "Gadgets",
    "Currencies",
    "Recently updated",
    "Whatched",
    "New to you",
  ];

  menuButton() {
    if (isMobile) {
      drawerOpen = !drawerOpen;
    } else {
      menuOpen = !menuOpen;
      sideBarSize = menuOpen ? 250 : 90;
    }
    update();
  }

  changeRecommendTap(int index) {
    currentRecomendedTap = index;
    update();
  }

}
