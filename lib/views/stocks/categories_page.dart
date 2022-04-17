import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/create_product.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text(
              'Some Category',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
            ),
          )
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CreateProduct()));
        },
        child: Icon(
          Icons.add,
          size: 35.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
