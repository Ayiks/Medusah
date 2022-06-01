import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

import '../utils/utils.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  String dropdownType = 'Select option';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();


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
              child:const AppIcon(
                icon: Icons.arrow_back_ios_outlined,
                backgroundColor: Colors.orange,
                iconColor: Colors.white,
              )),
        ),
        title: const Text(
          'Create Product',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'Product Details'),
             const Divider(),
              Form(
                  child: GetBuilder<ProductController>(builder: (product){
                    return Column(
                      children: [
                        // SizedBox(height: Dimensions.height20),
                        TextFormField(
                          controller: _nameController,
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
                            height: Dimensions.height15),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              labelText: 'Type',
                              labelStyle: TextStyle(fontSize: Dimensions.font20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius15),
                                  ))),
                          value: dropdownType,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: Dimensions.font16 - 2),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownType = newValue!;
                            });
                          },
                          items: <String>[
                            'Select option',
                            'Paints',
                            'Thinner',
                            'Lacquer',
                            'Filler',
                            'Tapes',
                            'Putty',
                            'Primer',
                            'Sieve',
                            'Papers'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: Dimensions.font16 - 2)),
                            );
                          }).toList(),
                        ),

                        // TextFormField(
                        //   controller: _quantityController,
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
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _costPriceController,
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
                                controller: _sellingPriceController,
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
                        SizedBox(
                          width: double.maxFinite,
                          height: Dimensions.height30,
                          child: TextButton(
                            onPressed: () {
                              product.postProduct(
                                  productName: _nameController.text,
                                  category: dropdownType,
                                  sellingPrice: double.parse(_sellingPriceController.text),
                                  costPrice: double.parse(_costPriceController.text),
                                  // quantity: int.parse(_quantityController.text)
                              );

                            },
                            child:const Text(
                              'Create Product',
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
