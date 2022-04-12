import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_network/pages/home_page.dart';
import 'package:social_network/theme/colors.dart';
import 'dart:math' as math;

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text('Chat'),
        ),
        Center(
          child: Text('Upload'),
        ),
        Center(
          child: Text('Saved'),
        ),
        Center(
          child: Text('Profile'),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: Icon(
                Feather.home,
                size: 25,
                color: activeTab == 0 ? primary : black,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                Icons.chat_bubble_outline,
                size: 25,
                color: activeTab == 1 ? primary : black,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 3;
                });
              },
              child: Icon(
                Feather.heart,
                size: 25,
                color: activeTab == 3 ? primary : black,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 4;
                });
              },
              child: Icon(
                Icons.account_box_outlined,
                size: 30,
                color: activeTab == 4 ? primary : black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFloatingActionButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = 2;
        });
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                color: grey.withOpacity(0.3),
                blurRadius: 15.0,
                offset: Offset(0, 1),
              ),
            ],
            color: black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
              child: Icon(
                Ionicons.md_add_circle_outline,
                color: activeTab == 2 ? primary : white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
