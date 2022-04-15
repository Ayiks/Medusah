import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/stocks/categories_page.dart';
import 'package:medusah/views/stocks/products_page.dart';
import 'package:medusah/views/stocks/restock_page.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/shop_column.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.all(10.h),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios_outlined,
                    backgroundColor: Colors.orange,
                    iconColor: Colors.white,
                  )),
            ),
            bottom: const TabBar(
              //isScrollable: true,
              // labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
              tabs: [
                Tab(
                  text: "Products",
                ),
                Tab(
                  text: "Categories",
                ),
                Tab(
                  text: "Restock",
                ),
              ],
            ),
            title: const Text(
              'My Products',
            ),
            centerTitle: true,
          ),
          body: const TabBarView(
              children: [ProductPage(), CategoriesPage(), RestockPage()])),
    );
  }
}
