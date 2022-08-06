import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List list=[];
  int random=0;
  String currentimg="images/black.png";

  Future<List> _initImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .toList();
    return imagePaths;
  }

  @override
  void initState() {
    super.initState();
    _initImages().then((value) {
      setState(() {
        list = value;
        random=Random().nextInt(list.length);
        currentimg=list[random];
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Expanded(child: Container(color: Colors.red,)),
          // GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount:
          // ), itemBuilder: itemBuilder)
        ],
      )
    );
  }
}
