import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/account.dart';
import 'package:medusah/views/dashboard.dart';
import 'package:medusah/views/shop_view.dart';

class IndexView extends StatefulWidget {
  const IndexView({Key? key}) : super(key: key);

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  // ignore: prefer_final_fields
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [DashboardView(), ShopView(), AccountView()],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize:24.sp,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          //selectedItemColor: Theme.of(context).iconTheme.color,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop_two_outlined), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'Account'),
          ]),
    );
  }
}
