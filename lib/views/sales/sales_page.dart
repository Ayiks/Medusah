import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/cart_controller.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/utils.dart';
import '../../widgets/small_text.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  //String dropdownType = 'Select option';
  // List<Widget> _items = [];

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
        title: const Text(
          'Sell',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showBarModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return itemWidget();
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              top: Dimensions.height10 / 2,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: _cartList.length,
                        itemBuilder: (context, index) {
                          return
                            Container(
                            width: double.infinity,
                            height: 100,
                            child: Row(children: [
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: cartController
                                            .getItems[index].name!),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: 'GHC' +
                                              cartController
                                                  .getItems[index].price!
                                                  .toString(),
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              left: Dimensions.width10,
                                              right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                          child: Row(children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    _cartList[index].product!,
                                                    -1);
                                              },
                                              child: Icon(Icons.remove,
                                                  color: Colors.orange),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            BigText(
                                                text: _cartList[index]
                                                    .quantity!
                                                    .toString()), //popularProduct.inCartItem.toString()),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    _cartList[index].product!,
                                                    1);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.orange,
                                              ),
                                            )
                                          ]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ]),
                          );
                        });
                  },
                ),
              )),
        ]),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width30,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(children: [
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(
                        text: 'GHC' + cartController.totalAmount.toString()),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    // popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.orange,
                    ),
                    child: BigText(
                      text: 'Sold',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // addItem() async {
  //   setState(() {
  //     var product = Get.find<ProductController>().productList;
  //     _items.add(
  //         GetBuilder<ProductController>(builder: (product){
  //           return AlertDialog(
  //             content: ListView.builder(
  //               shrinkWrap: true,
  //               itemCount: product.productList.length,
  //                 itemBuilder: (context, index){
  //               return Container(
  //                 child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Expanded(
  //                             child: DropdownButtonFormField(
  //                               decoration: InputDecoration(
  //                                   labelText: 'Item',
  //                                   labelStyle: TextStyle(fontSize: Dimensions.font20),
  //                                   border: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.all(
  //                                         Radius.circular(Dimensions.radius15),
  //                                       ))),
  //                               value: dropdownType,
  //                               icon: const Icon(Icons.arrow_drop_down),
  //                               elevation: 16,
  //                               style: TextStyle(color: Colors.black, fontSize: Dimensions.font16 - 2),
  //                               onChanged: (String? newValue) {
  //                                 setState(() {
  //                                   dropdownType = newValue!;
  //                                 });
  //                               },
  //                               items: <String>[
  //                                 'Select option',
  //                                 product.productList[index].name!.toString()
  //                               ].map<DropdownMenuItem<String>>((String value) {
  //                                 return DropdownMenuItem<String>(
  //                                   value: value,
  //                                   child: Text(value, style: TextStyle(fontSize: Dimensions.font16 - 2)),
  //                                 );
  //                               }).toList(),
  //                             ),
  //                           ),
  //                           SizedBox(width: Dimensions.width30 *2,),
  //                           Expanded(child: Row(children: [
  //                             GestureDetector(
  //                               onTap: () {
  //                                 // cartController.addItem(
  //                                 //     _cartList[index].product!,
  //                                 //     -1);
  //                               },
  //                               child: Icon(Icons.remove,
  //                                 // color: AppColors.signColor
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: Dimensions.width10 / 2,
  //                             ),
  //                             BigText(
  //                                 text:'0'), //popularProduct.inCartItem.toString()),
  //                             SizedBox(
  //                               width: Dimensions.width10 / 2,
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 // cartController.addItem(
  //                                 //     _cartList[index].product!,
  //                                 //     1);
  //                               },
  //                               child: Icon(
  //                                 Icons.add,
  //                                 //color: AppColors.signColor,
  //                               ),
  //                             )
  //                           ]))
  //                         ],
  //                       ),
  //
  //                       // TextFormField(
  //                       //   keyboardType: TextInputType.number,
  //                       //   decoration: InputDecoration(
  //                       //       border: OutlineInputBorder(
  //                       //         borderRadius: BorderRadius.all(
  //                       //           Radius.circular(Dimensions.radius15),
  //                       //         ),
  //                       //       ),
  //                       //       labelText: 'Quantity',
  //                       //       labelStyle: TextStyle(fontSize: Dimensions.font20)),
  //                       // ),
  //                     ]),
  //               );
  //             }),
  //           );
  //         })
  //         );
  //   });
  // }

}

class itemWidget extends StatelessWidget {
  const itemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        color: Colors.white,
        child: GetBuilder<ProductController>(
          builder: (product) {
            return ListView.builder(
                padding: EdgeInsets.only(
                    left: Dimensions.width20, top: Dimensions.height20),
                itemCount: product.productList.length,
                itemBuilder: (context, index) {
                  var products = product.productList[index];
                  Get.find<ProductController>()
                      .initProduct(products, Get.find<CartController>());
                  return Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.height20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          product.addItem(products);
                        },
                        child: BigText(text: products.name!)),
                  );
                });
          },
        ));
  }
}
