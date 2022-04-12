import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_network/data/post_json.dart';
import 'package:social_network/data/user_json.dart';
import 'package:social_network/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Socially',
              style: TextStyle(
                fontSize: 20.0,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Feather.bell,
                color: black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feed',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xffffe0df), Color(0xffe1f6f4)],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: black,
                            size: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: List.generate(usersList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(usersList[index]['img']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
                children: List.generate(postsList.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 288,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(postsList[index]['postImg']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 288.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: black.withOpacity(0.25),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 288.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        postsList[index]['img'],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          postsList[index]['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: white,
                                          ),
                                        ),
                                        Text(
                                          postsList[index]['time'],
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Entypo.dots_three_vertical,
                                  color: white,
                                  size: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe5e5e5).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Feather.heart,
                                        color: white,
                                        size: 15,
                                      ),
                                      Text(
                                        postsList[index]['like'],
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe5e5e5).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        MaterialIcons.chat_bubble_outline,
                                        color: white,
                                        size: 15,
                                      ),
                                      Text(
                                        postsList[index]['comment'],
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe5e5e5).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.share,
                                        color: white,
                                        size: 15,
                                      ),
                                      Text(
                                        postsList[index]['share'],
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}
