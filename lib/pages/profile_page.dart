import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_network/data/me_post_json.dart';
import 'package:social_network/theme/colors.dart';
import 'package:video_player/video_player.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPhoto = true;
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(meVideoList[0]['videoUrl']);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(200),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: black),
              ),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hossein Jafarinejad',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'hosseinjfr72@gmail.com',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '35',
                      style: TextStyle(
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1,552',
                      style: TextStyle(
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '182',
                      style: TextStyle(
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = true;
                    });
                  },
                  icon: Icon(
                    Foundation.photo,
                    size: 25,
                    color: isPhoto ? primary : black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = false;
                    });
                  },
                  icon: Icon(
                    Foundation.play_video,
                    size: 30,
                    color: !isPhoto ? primary : black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            isPhoto
                ? Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(mePostList.length, (index) {
                      return Container(
                        width: (size.width - 70) / 2,
                        height: (size.height - 70) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(mePostList[index]),
                              fit: BoxFit.cover),
                        ),
                      );
                    }),
                  )
                : Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(meVideoList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          playVideo(context, meVideoList[index]['videoUrl']);
                        },
                        child: Container(
                          width: (size.width - 70) / 2,
                          height: (size.height - 70) / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(meVideoList[index]['img']),
                                fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: Icon(
                              AntDesign.playcircleo,
                              size: 60,
                              color: white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
          ],
        ),
      ),
    );
  }

  playVideo(BuildContext context, videoUrl) {
    _controller = VideoPlayerController.network(videoUrl);
    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
    _controller.play();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ));
  }
}
