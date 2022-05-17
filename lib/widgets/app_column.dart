import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/utils.dart';
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
            top:Dimensions.height10,
            left:Dimensions.width10,
            bottom: Dimensions.height10,
            right: Dimensions.width10),
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15 - 6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height30,
                        left:Dimensions.width30,
                        bottom: Dimensions.height30,
                        right: Dimensions.width30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15 - 10),
                      // color: Color(0xFF69c5df),
                      image:  DecorationImage(
                          image: NetworkImage(
                              image!),
                          fit: BoxFit.cover),
                    )),
                SizedBox(
                  width: Dimensions.width30,
                ),
                BigText(
                  text: text,
                  size: Dimensions.font26,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                BigText(text: quatity.toString()),
                SizedBox(
                  width: Dimensions.width20,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size:Dimensions.iconSize16,
                )
              ],
            )
          ],
        ));
  }
}
