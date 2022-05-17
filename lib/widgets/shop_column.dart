import 'package:flutter/material.dart';
import 'package:medusah/widgets/big_text.dart';

import '../utils/utils.dart';

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
            EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width10, bottom: Dimensions.height10, right: Dimensions.width10),
        decoration:  BoxDecoration(
            color: Color.fromARGB(255, 236, 234, 234),
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15- 6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10 - 5, left: Dimensions.width10 - 5, bottom: Dimensions.height10-5, right: Dimensions.width10 - 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15 -6),
                    color: Colors.orange,
                  ),
                  child: Icon(
                   icon,
                    size: Dimensions.iconSize24 +8,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: Dimensions.font26, fontWeight: FontWeight.w600),
                    ),
                    Text(subtitle,
                        style: TextStyle(
                          fontSize: Dimensions.font16,
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
                  width: Dimensions.width20,
                ),
                Icon(
                  Icons.more_vert,
                  size: Dimensions.iconSize16,
                )
              ],
            )
          ],
        ));
  }
}
