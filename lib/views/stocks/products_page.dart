import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/create_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            //padding: EdgeInsets.only(left: ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text(
              'Some product',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              children: [
                Text(
                  '10',
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'left',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
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
