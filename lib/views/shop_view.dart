import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/cart_controller.dart';
import 'package:medusah/views/create_product.dart';
import 'package:medusah/views/create_team.dart';
import 'package:medusah/views/products_view_page.dart';
import 'package:medusah/views/sales/sales_page.dart';
import 'package:medusah/views/stocks/products_page.dart';
import 'package:medusah/views/team_view.dart';
import 'package:medusah/widgets/big_text.dart';
import 'package:medusah/widgets/shop_column.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/product_controller.dart';
import '../utils/utils.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                left: Dimensions.width15,
                right: Dimensions.width15,
                bottom: Dimensions.height15),
            child: Column(
              children: [
                Center(
                  child: BigText(
                    text: 'Shop',
                    size: Dimensions.font26,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height45,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (_) => const TeamView()));
                      //   },
                      //   child: const ShopColumn(
                      //       icon: Icons.people_alt,
                      //       number: '0',
                      //       title: 'My Team',
                      //       subtitle: 'workers'),
                      // ),
                      GetBuilder<ProductController>(builder: (controller){

                        return GestureDetector(
                          onTap: () {
                          // if(controller.totalItems >=1)
                             Get.to(() => SalesPage());
                          },
                          child: const ShopColumn(
                              icon: Icons.people_alt,
                              number: '',
                              title: 'Sell',
                              subtitle: ''),
                        );
                      }),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ProductPage()));
                        },
                        child: ShopColumn(
                            icon: Icons.stacked_bar_chart_outlined,
                            number: 30.toString(),
                            title: 'My Stocks',
                            subtitle: 'Products'),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const SalesPage()));
                        },
                        child: const ShopColumn(
                            icon: Icons.receipt_long,
                            number: '',
                            title: 'Records',
                            subtitle: ''),
                      )
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
              padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width30),
              height: Dimensions.height10*15,
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
                        style: TextStyle(fontSize: Dimensions.font16),
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
                        style: TextStyle(fontSize: Dimensions.font16),
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
