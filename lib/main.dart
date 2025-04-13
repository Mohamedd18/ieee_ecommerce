import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/register.dart';

import 'layout.dart';

void main() {
  runApp(MyApp(
    home: Layout(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required Layout home});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
    );
  }
}
