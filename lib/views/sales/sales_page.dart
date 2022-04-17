import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

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
              child: const AppIcon(
                icon: Icons.arrow_back_ios_outlined,
                backgroundColor: Colors.orange,
                iconColor: Colors.white,
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.w, top: 30.h, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Analytic Overview',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // const Divider(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 150.w,
              //       padding: EdgeInsets.only(
              //           left: 20.w, right: 10.w, top: 10.h, bottom: 10.h),
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.all(Radius.circular(20.r)),
              //           border: Border.all(width: 1.5, color: Colors.orange)),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text(
              //             'Sales',
              //             style:
              //                 TextStyle(color: Colors.black54, fontSize: 20.sp),
              //           ),
              //           SizedBox(
              //             height: 15.h,
              //           ),
              //           BigText(
              //             text: 'GHC 2,000',
              //             color: Colors.black,
              //             size: 25.sp,
              //           ),
              //           SizedBox(
              //             height: 5.h,
              //           ),
              //           Text(
              //             'Total Products',
              //             style:
              //                 TextStyle(color: Colors.black54, fontSize: 15.sp),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       width: 150.w,
              //       padding: EdgeInsets.only(
              //           left: 20.w, right: 10.w, top: 10.h, bottom: 10.h),
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.all(Radius.circular(20.r)),
              //           border: Border.all(width: 1.5, color: Colors.orange)),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text(
              //             'Purchases',
              //             style:
              //                 TextStyle(color: Colors.black54, fontSize: 20.sp),
              //           ),
              //           SizedBox(
              //             height: 15.h,
              //           ),
              //           BigText(
              //             text: 'GHC 2,000',
              //             color: Colors.black,
              //             size: 25.sp,
              //           ),
              //           SizedBox(
              //             height: 5.h,
              //           ),
              //           Text(
              //             'Total Products Sold',
              //             style:
              //                 TextStyle(color: Colors.black54, fontSize: 15.sp),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              const Text(
                'Daily Sales Record',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),

              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BigText(text: 'Something something Product'),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Quantity')),
                        )),
                        SizedBox(width: 5.w),
                        Expanded(
                            child: TextFormField(
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)))
                                .then((value) => {});
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Date')),
                        )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.h,
            padding: EdgeInsets.only(
                top: 30.h, bottom: 30.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
                  child: BigText(
                    text: '\$12.88 ' + ' x ' + ' 0 ',
                    color: Colors.black,
                    size: 26.sp,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.orange,
                  ),
                  child: BigText(
                    text: 'Sold',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
