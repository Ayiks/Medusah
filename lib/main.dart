import 'package:flutter/material.dart';
import 'package:medusah/views/index_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 20.sp),
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: false,
                iconTheme: const IconThemeData(
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
            themeMode: ThemeMode.light,
            home: const IndexView(),
          );
        });
  }
}
