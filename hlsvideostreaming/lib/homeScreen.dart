import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
        color: Colors.blueGrey,
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
                      disabledColor: Colors.grey,
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
      child: Container(
        color: Colors.blue,
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
          builder: (context, snapshot){
            var new_data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: new_data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: MyVideoCard(
                      url:
                          new_data[index]['videoUrl']),
                );
              });
          },
          
        ),
      ),
    );
  }
}

class MyVideoCard extends StatelessWidget {
  MyVideoCard({required this.url});
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyVideoWidget(url: url),
          // MySeekerWidget(),
          // MyVideoInfo(),
        ],
      ),
    );
  }
}

class MyVideoWidget extends StatefulWidget {
  MyVideoWidget({required this.url});

  String url;

  @override
  State<MyVideoWidget> createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<MyVideoWidget> {
  late VideoPlayerController _videoPlayerController;

  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url)
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : Container(),

          IconButton(onPressed: () {
            setState(() {
              _videoPlayerController.value.isPlaying
                  ? _videoPlayerController.pause()
                  : _videoPlayerController.play();
                  isPlaying = (_videoPlayerController.value.isPlaying ? true : false);
            });
          }, 
          icon: Icon(isPlaying ? Icons.pause : Icons.play_circle_filled)),
        ],
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
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getBottomNavigationBarWidgets(icon: Icons.home, str: 'Home'),
            getBottomNavigationBarWidgets(
                icon: Icons.slow_motion_video, str: 'Shorts'),
            Expanded(
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
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
