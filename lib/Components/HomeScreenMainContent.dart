import 'package:flutter/material.dart';

import '../color/color.dart';
import 'Button.dart';

class HomeScreenMainContent extends StatelessWidget {
  const HomeScreenMainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColor.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total Calculation",
            style: TextStyle(
              color: MyColor.yellow,
              fontFamily: "rockwell",
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Text(
              "1,250,750 IQD",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "rockwell",
                fontSize: 33,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(Icons.calculate_outlined),
                Button(Icons.document_scanner_outlined)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 35,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ],
      ),
    );
  }
}
