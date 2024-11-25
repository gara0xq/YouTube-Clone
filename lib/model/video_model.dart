class VideoModel {
  String title, channelName, channelImage, videoImage, dateSince;
  String? views;

  VideoModel({
    required this.title,
    required this.channelName,
    required this.channelImage,
    required this.videoImage,
    required this.dateSince,
    required int views,
  }) {
    channelImage = "assets/channels/$channelImage";
    videoImage = "assets/sumbnails/$videoImage";

    if (views > 1000000) {
      this.views = "${views ~/ 1000000}M views";
    } else if (views > 1000) {
      this.views = "${views ~/ 1000}K views";
    } else {
      this.views = "${views.toInt()} views";
    }
  }
}
