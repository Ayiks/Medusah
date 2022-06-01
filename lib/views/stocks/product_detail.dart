import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';

import '../../utils/utils.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class ProductDetail extends StatelessWidget {
  final int pageId;
  final String page;
   ProductDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  final TextEditingController _sellingPrice = TextEditingController();
  final TextEditingController _costPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().productList[pageId];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(Dimensions.height10),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child:const AppIcon(
                icon: Icons.arrow_back_ios_outlined,
                backgroundColor: Colors.orange,
                iconColor: Colors.white,
              )),
        ),
        title: BigText(text: 'Product Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      child: GetBuilder<ProductController>(builder: (controller){
                        _costPrice.text = product.costPrice!.toString();
                        _sellingPrice.text =product.sellingPrice!.toString();
                        return Column(
                          children: [
                            // SizedBox(height: Dimensions.height20),
                            TextFormField(
                              enabled: false,
                              initialValue: product.name!,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius15),
                                    ),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(fontSize: Dimensions.font20)),
                            ),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            // TextFormField(
                            //   initialValue: product.quantity!.toString(),
                            //   keyboardType: TextInputType.number,
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.all(
                            //           Radius.circular(Dimensions.radius15),
                            //         ),
                            //       ),
                            //       labelText: 'Quantity',
                            //       labelStyle: TextStyle(fontSize: Dimensions.font20)),
                            // ),
                            // SizedBox(
                            //   height: Dimensions.height15,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _costPrice,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(Dimensions.radius15),
                                          ),
                                        ),
                                        prefixText: 'GHC ',
                                        labelText: 'Cost Price',
                                        labelStyle: TextStyle(fontSize: Dimensions.font20)),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width20),
                                Expanded(
                                  child: TextFormField(
                                    controller: _sellingPrice,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(Dimensions.radius15),
                                          ),
                                        ),
                                        prefixText: 'GHC ',
                                        labelText: 'Selling Price',
                                        labelStyle: TextStyle(fontSize: Dimensions.font20)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: Dimensions.height20),
                            Container(
                              margin: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height20),
                              width: double.maxFinite,
                              height: Dimensions.height15*3,
                              child: TextButton(
                                onPressed: () {
                                  print('tapped');
                                  controller.updatePrice(id: product.id!, sellingPrice: double.parse(_sellingPrice.text), costPrice: double.parse(_costPrice.text));
                                },
                                child:const Text(
                                  'Update Product',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                              ),
                            )
                          ],
                        );
                      },)
                  )
                ],
              ),
            )),
      ),
    );
  }
}
