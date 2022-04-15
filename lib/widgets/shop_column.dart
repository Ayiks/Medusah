import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/big_text.dart';

class ShopColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String number;
  const ShopColumn({Key? key, required this.icon, required this.number, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h, right: 10.w),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 234, 234),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 5.h, left: 5.w, bottom: 5.h, right: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.orange,
                  ),
                  child: Icon(
                   icon,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(subtitle,
                        style: TextStyle(
                          fontSize: 15.sp,
                        )
                        //fontWeight: FontWeight.w600),
                        )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                BigText(text: number),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.more_vert,
                  size: 16.sp,
                )
              ],
            )
          ],
        ));
  }
}
