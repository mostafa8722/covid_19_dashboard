
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,

      ),
      home: HomeScreen(),
    );
  }
}