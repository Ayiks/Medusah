import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/routes/route_helper.dart';
import 'package:medusah/utils/utils.dart';
import 'package:medusah/widgets/small_text.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RestockPage extends StatefulWidget {
  const RestockPage({Key? key}) : super(key: key);

  @override
  State<RestockPage> createState() => _RestockPageState();
}

class _RestockPageState extends State<RestockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(Dimensions.height10),
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
        title: Text('Stocks'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            //padding: EdgeInsets.only(left: ),
            child:
            GetBuilder<ProductController>(builder: (product) {
              return product.isLoaded ?
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.productList.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap:(){
                        Get.toNamed(RouteHelper.getQuantityUpdate(index, 'quantity'));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height10,
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        margin: EdgeInsets.only(
                          top: Dimensions.height10/2,
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            bottom: Dimensions.height10/2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        BigText(text:product.productList[index].name!, size: Dimensions.font16+2,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BigText(text: product.productList[index].quantity!.toString(), size:  Dimensions.font16+2,),
                                product.productList[index].quantity!  <=3
                                    ? SmallText(text: 'Restock', color: Colors.red,)
                                    : SmallText(text: "In Stock", color: Colors.green,)
                              ],
                            )
                          ],
                        ),

                      ),
                    );
                  }): Container();
            },),
          )),
    );
  }
}
