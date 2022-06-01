import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/utils/utils.dart';
import 'package:medusah/views/settings_view.dart';
import 'package:medusah/views/shop_view.dart';
import 'package:medusah/views/stocks/products_page.dart';
import 'package:medusah/views/stocks/restock_page.dart';
import 'package:medusah/widgets/app_column.dart';
import 'package:medusah/widgets/big_text.dart';

import '../controllers/cart_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right:Dimensions.width15, top: Dimensions.height10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SettingsView()));
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80'),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              right: Dimensions.width15,
              left: Dimensions.width15,
              bottom: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: 'Hello,',
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: Dimensions.font26,
              ),
              BigText(
                text: 'Edusah 👋',
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: Dimensions.font26,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left:Dimensions.width10,
                    bottom: Dimensions.height10,
                    right: Dimensions.width10),
                //  height: Dimensions.height30,
                // width: Dimensions.width90,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius15)),
                ),
                child: Center(
                    child: BigText(
                  text: 'Overview',
                  color: Colors.white,
                )),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
               GetBuilder<ProductController>(builder: (products){
                return products.isLoaded
                    ?  GestureDetector(
                  onTap: (){
                    Get.to(() => ProductPage());
                  },
                      child: AppColumn(
                      text: 'Product',
                      quatity: products.productList.length,
                      image:
                      'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80'),
                    )
                    : Container();
              }),
              SizedBox(
                height: Dimensions.height15
              ),
              GestureDetector(
                onTap: (){
                  Get.to(() => ShopView());
                },
                child: const AppColumn(
                    text: 'Sales',
                    quatity: 2,
                    image:
                        'https://images.unsplash.com/photo-1580828343064-fde4fc206bc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
             GestureDetector(
               onTap: (){
                 Get.to(()=> RestockPage());
               },
               child:  GetBuilder<ProductController>(builder: (products){
                 return AppColumn(
                   text: 'Total Stock',
                   image:
                   'https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                   quatity: products.productList.length,);
               },)
             )
            ],
          ),
        ),
      )),
    );
  }
}
