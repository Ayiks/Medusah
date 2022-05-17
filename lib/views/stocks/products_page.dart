import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/utils/utils.dart';
import 'package:medusah/views/create_product.dart';
import 'package:medusah/widgets/icon_text_widget.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  Dimensions.radius20),
                              bottomRight: Radius.circular(
                                  Dimensions.radius20)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text:product.productList[index].name!),
                            SizedBox(
                                height: Dimensions.height10
                            ),
                            Text(product.productList[index].category!),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.attach_money_outlined,
                                    text: product.productList[index].price!.toString(),
                                    iconColor: Colors.red),
                                IconAndTextWidget(
                                    icon: Icons.production_quantity_limits,
                                    text: product.productList[index].quantity!.toString(),
                                    iconColor: Colors.green)
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),

              );
            }): Container();
        },),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CreateProduct()));
        },
        child: Icon(
          Icons.add,
          size: Dimensions.font20+15,
          color: Colors.white,
        ),
      ),
    );
  }
}
