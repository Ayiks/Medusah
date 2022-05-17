import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/utils/utils.dart';
import 'package:medusah/views/index_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(
    //     designSize: const Size(360, 690),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (_) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         theme: ThemeData(
    //           primarySwatch: Colors.orange,
    //           tabBarTheme: TabBarTheme(
    //             labelColor: Colors.black,
    //             labelStyle: TextStyle(fontSize: 20.sp),
    //           ),
    //           scaffoldBackgroundColor: Color.fromARGB(255, 237, 249, 249),
    //           appBarTheme: AppBarTheme(
    //             titleTextStyle: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 26.sp,
    //                 fontWeight: FontWeight.bold),
    //             backgroundColor: Colors.white,
    //             elevation: 0,
    //             centerTitle: false,
    //             iconTheme: const IconThemeData(
    //               color: Color.fromARGB(255, 80, 60, 2),
    //             ),
    //           ),
    //           iconTheme: const IconThemeData(
    //             color: Color.fromARGB(255, 80, 60, 2),
    //           ),
    //           textTheme: const TextTheme(
    //               bodyText1: TextStyle(color: Colors.black),
    //               bodyText2: TextStyle(color: Colors.black)),
    //         ),
    //         darkTheme: ThemeData(
    //           scaffoldBackgroundColor: Colors.black87,
    //           appBarTheme: const AppBarTheme(
    //             backgroundColor: Colors.black,
    //             elevation: 0,
    //             centerTitle: false,
    //             iconTheme: IconThemeData(
    //               color: Color.fromARGB(255, 80, 60, 2),
    //             ),
    //           ),
    //           iconTheme: const IconThemeData(
    //             color: Color.fromARGB(255, 80, 60, 2),
    //           ),
    //           textTheme: const TextTheme(
    //               bodyText1: TextStyle(color: Colors.white),
    //               bodyText2: TextStyle(color: Colors.white)),
    //         ),
    //         themeMode: ThemeMode.light,
    //         home: const IndexView(),
    //       );
    //     });
   Get.find<ProductController>().getProductList();
    return  GetMaterialApp(
      title: 'Medusah',
      debugShowCheckedModeBanner: false,
      home: IndexView(),
      theme: ThemeData(
              primarySwatch: Colors.orange,
              tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 20),
              ),
              scaffoldBackgroundColor: Color.fromARGB(255, 237, 249, 249),
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
    ) ;
  }
}
