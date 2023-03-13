import 'package:flutter/material.dart';
import 'package:ocr_calculator/Components/BottomNavItem.dart';
import 'package:ocr_calculator/Components/HomeScreenListItem.dart';
import 'package:ocr_calculator/Components/HomeScreenMainContent.dart';
import 'package:ocr_calculator/color/color.dart';

import 'CalculatorScreen.dart';
import 'CameraScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Screens = [
    CameraScreen(),
    CalculatorScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MyColor.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              children: [
                BottomNavItem(Icons.home_outlined, "Home", "home"),
                BottomNavItem(
                    Icons.format_list_bulleted_outlined, "List", "list"),
                SizedBox(
                  width: 40,
                ),
                BottomNavItem(
                    Icons.history_toggle_off_rounded, "History", "history"),
                BottomNavItem(Icons.settings_outlined, "Setting", "setting"),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColor.blue,
        foregroundColor: MyColor.yellow,
        onPressed: () {},
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: MyColor.blue,
        shadowColor: null,
        elevation: 0,
        title: Text(
          "OCR Calculator",
          style: TextStyle(
              color: MyColor.yellow,
              fontFamily: "BrownCasalova",
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenMainContent(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Recent Calculation",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Rockwell",
                      fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
              child: Divider(color: MyColor.darkGrey),
            ),
            Container(
              height: 290,
              child: ListView(
                children: [
                  HomeScreenListItem(),
                  HomeScreenListItem(),
                  HomeScreenListItem(),
                  HomeScreenListItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
