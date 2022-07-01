import 'dart:convert';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:hlsvideostreaming/feed_player/feed_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

const urls = [
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1213_shipra_mam_7_papercrumpling_ice_cream/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1215_shipra_mam_8_papercruumpling_birthday_cap_1/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1216_shipra_mam/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1405_shagun_mam_v2/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1410_15121_minion_fonts_a_to_p/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1418_smiley_cartoon_fonts_with_shagun_maam_t_to_z_4754/hls_class/class_video.m3u8",
  "https://tech-assignments.yellowclass.com/1608/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1609/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/9610/hls_session/session_video.m3u8",
  "https://tech-assignments.yellowclass.com/1618/hls_class/class_video.m3u8",
];
int curr_pos = -1;
double curr_pos_visibility = 0;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(),
        MyAppBody(),
        MyAppBottomNavigationBar(),
      ],
    );
  }
}

class MyAppBar extends StatefulWidget {
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  int idx = 0;
  final arr = [
    "All",
    "Cricket",
    "Dubbing",
    "Live",
    "Hockey",
    "Football",
    "Bollywood",
    "Hollywood",
    "Tollywood",
    "Taylor Swift",
    "Hellen keller"
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color(0xff474747),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: arr.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      idx = index;
                    });
                  },
                  child: ChoiceChip(
                      selectedColor: Colors.white,
                      disabledColor: Colors.grey.shade600,
                      label: Text(
                        arr[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (idx == index ? Colors.black : Colors.white),
                        ),
                      ),
                      selected: (idx == index ? true : false)),
                ),
              );
            }),
      ),
    );
  }
}

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: FeedPlayer(),
    );
  }
}

class MyVideoCard extends StatelessWidget {
  MyVideoCard({required this.url, required this.index});
  String url;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyVideoWidget(url: url, index: index),
          // MySeekerWidget(),
          // MyVideoInfo(),
        ],
      ),
    );
  }
}

class MyVideoWidget extends StatefulWidget {
  MyVideoWidget({required this.url, required this.index});

  String url;
  int index;

  @override
  State<MyVideoWidget> createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<MyVideoWidget> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.index.toString()),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager?.pause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },

      child: Container(
        child: Column(
          children: [
            Text(
              "${widget.index}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            FlickVideoPlayer(flickManager: flickManager)
          ],
        ),
      ),
    );
  }
}

class MyAppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color(0xff474747),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getBottomNavigationBarWidgets(icon: Icons.home, str: 'Home'),
            getBottomNavigationBarWidgets(
                icon: Icons.slow_motion_video, str: 'Shorts'),
            Expanded(
              child: const CircleAvatar(
                backgroundColor: Color(0xff1f1c1c),
                radius: 20,
                child: Icon(
                  Icons.add_rounded,
                ),
              ),
            ),
            getBottomNavigationBarWidgets(
                icon: Icons.subscriptions, str: 'Subscription'),
            getBottomNavigationBarWidgets(
                icon: Icons.library_add, str: 'Library'),
          ],
        ),
      ),
    );
  }

  Widget getBottomNavigationBarWidgets(
      {required IconData icon, required String str}) {
    return Expanded(
      // flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          Text(
            str,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
