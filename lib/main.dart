import 'package:clone_flo/pages/home/home.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * System Statusbar Color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: FloColors.white)),
          primaryColor: FloColors.white,
          backgroundColor: FloColors.black,
          splashColor: FloColors.transparent,
          highlightColor: FloColors.transparent,
        ),
        home: Builder(builder: (BuildContext context) {
          return const HomePage();
        }));
  }
}
