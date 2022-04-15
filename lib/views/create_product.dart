import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  String dropdownType = 'Select option';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.h),
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
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'Product Details'),
             const Divider(),
              Form(
                  child: Column(
                children: [
                  // SizedBox(height: 20.h),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: 'Type',
                        labelStyle: TextStyle(fontSize: 20.sp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15.r),
                        ))),
                    value: dropdownType,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownType = newValue!;
                      });
                    },
                    items: <String>[
                      'Select option',
                      'Paints',
                      'Thiner',
                      'Lacquer',
                      'Filler',
                      'Tapes'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 12.sp)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Category',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Quantity',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                              ),
                              prefixText: 'GHC ',
                              labelText: 'Cost Price',
                              labelStyle: TextStyle(fontSize: 20.sp)),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                              ),
                              prefixText: 'GHC ',
                              labelText: 'Selling Price',
                              labelStyle: TextStyle(fontSize: 20.sp)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.maxFinite,
                    height: 30.h,
                    child: TextButton(
                      onPressed: () {},
                      child:const Text(
                        'Create Product',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    ),
                  )
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
