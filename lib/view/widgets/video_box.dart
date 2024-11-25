import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Videobox extends StatelessWidget {
  String title, channelName, channelImage, videoImage, dateSince;
  String views;
  bool isHover = false;
  Videobox({
    super.key,
    required this.title,
    required this.channelName,
    required this.channelImage,
    required this.videoImage,
    required this.dateSince,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      radius: 0,
      onHover: (value) {},
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  videoImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              channelImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(left: 10),
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                            ),
                            Text(
                              channelName,
                              maxLines: 1,
                            ),
                            Text(
                              "$views . $dateSince",
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.more_vert_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
