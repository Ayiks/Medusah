import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/create_product.dart';
import 'package:medusah/views/create_team.dart';
import 'package:medusah/views/products_view_page.dart';
import 'package:medusah/views/team_view.dart';
import 'package:medusah/widgets/big_text.dart';
import 'package:medusah/widgets/shop_column.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 40.h, left: 15.w, right: 15.w, bottom: 15.h),
            child: Column(
              children: [
                Center(
                  child: BigText(
                    text: 'Shop',
                    size: 26.sp,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ProductViewPage()));
                        },
                        child: ShopColumn(
                            icon: Icons.stacked_bar_chart_outlined,
                            number: 30.toString(),
                            title: 'My Stocks',
                            subtitle: 'Products'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const TeamView()));
                        },
                        child: const ShopColumn(
                            icon: Icons.people_alt,
                            number: '0',
                            title: 'My Team',
                            subtitle: 'workers'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const ShopColumn(
                          icon: Icons.receipt_long,
                          number: '',
                          title: 'Records',
                          subtitle: '')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.only(top: 20.h, left: 30.w),
              height: 150.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CreateProduct()));
                      },
                      child: Text(
                        'Create Product',
                        style: TextStyle(fontSize: 15.sp),
                      )),
                  const Divider(),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CreateTeam()));
                      },
                      child: Text(
                        'Create Team',
                        style: TextStyle(fontSize: 15.sp),
                      )),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
