import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int quatity;
  final String? image;
  const AppColumn({Key? key, required this.text, required this.quatity,  this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top:10.h,
            left:10.w,
            bottom: 10.h,
            right: 10.w),
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 30.h,
                        left:30.w,
                        bottom: 30.h,
                        right: 30.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // color: Color(0xFF69c5df),
                      image:  DecorationImage(
                          image: NetworkImage(
                              image!),
                          fit: BoxFit.cover),
                    )),
                SizedBox(
                  width: 30.w,
                ),
                BigText(
                  text: text,
                  size: 26.sp,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                BigText(text: quatity.toString()),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size:16.sp,
                )
              ],
            )
          ],
        ));
  }
}
