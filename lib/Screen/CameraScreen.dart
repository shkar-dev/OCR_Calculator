import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_calculator/color/color.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<int> total = [];
  late int myvalue;
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "0";
  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognizedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      setState(() {});
      scannedText = "Error";
    }
  }

  void getRecognizedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";
      }
    }
    myvalue = int.parse(scannedText);
    total.add(myvalue);
    scannedText = totalValues(total).toString();
    textScanning = false;
    setState(() {});
  }

  // void show(String text) {
  //   myvalue = int.parse(text);
  //   print(myvalue + 10);
  // }

  int totalValues(List<int> values) {
    int sum = 0;
    for (int i = 0; i < values.length; i++) {
      sum += values[i];
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.blue,
        centerTitle: true,
        title: Text(
          "OCR Calculator",
          style: TextStyle(
              color: MyColor.yellow,
              fontFamily: "BrownCasalova",
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        elevation: 0,
      ),
      body: (!textScanning)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!textScanning && imageFile == null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.darkGrey,
                      ),
                      child: Center(
                        child: Text("Camera"),
                      ),
                    ),
                  ),
                if (imageFile != null)
                  Image.file(
                    File(imageFile!.path),
                    height: 200,
                    width: double.infinity,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 140,
                      height: 55,
                      child: FilledButton(
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Camera",
                              style: TextStyle(
                                fontFamily: "BrownCasalova",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Color.fromRGBO(252, 163, 17, 1),
                              ),
                            ),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Color.fromRGBO(252, 163, 17, 1),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(18, 21, 59, 1)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 140,
                      height: 55,
                      child: FilledButton(
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Gallery",
                              style: TextStyle(
                                fontFamily: "BrownCasalova",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Color.fromRGBO(252, 163, 17, 1),
                              ),
                            ),
                            Icon(
                              Icons.image_outlined,
                              color: Color.fromRGBO(252, 163, 17, 1),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(18, 21, 59, 1)),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColor.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Text(
                            "Total",
                            style: TextStyle(
                              color: MyColor.yellow,
                              fontFamily: "rockwell",
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          scannedText + " IQD",
                          style: TextStyle(
                            color: MyColor.yellow,
                            fontFamily: "rockwell",
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Divider(
                          color: MyColor.lightgrey,
                        ),
                      ),
                      if (total.length != 0)
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: ListView.builder(
                              itemCount: total.length,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: MyColor.yellow),
                                ),
                                child: ListTile(
                                  trailing: InkWell(
                                    onTap: () {
                                      total.removeAt(index);
                                      scannedText =
                                          totalValues(total).toString();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                  style: ListTileStyle.drawer,
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      total[index].toString() + " IQD",
                                      style: TextStyle(
                                        color: MyColor.yellow,
                                        fontFamily: "RobotoRegular",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            child: Center(
                                child: Text(
                              "Nothing found ",
                              style: TextStyle(
                                  color: MyColor.yellow, fontSize: 30),
                            )),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: MyColor.yellow,
                backgroundColor: MyColor.blue,
              ),
            ),
    );
  }
}
