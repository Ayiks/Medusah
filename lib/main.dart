import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/views/index_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 80, 60, 2),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 80, 60, 2),
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 80, 60, 2),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 80, 60, 2),
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)),
      ),
      themeMode: ThemeMode.system,
      home: const IndexView(),
    );
  }
}
