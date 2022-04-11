import 'package:flutter/material.dart';
import 'package:medusah/utils/utils.dart';
import 'package:medusah/widgets/big_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height45,
              left: Dimensions.width15,
              right: Dimensions.width15,
              bottom: Dimensions.height15),
          child: Column(
            children: [
              Center(
                child: BigText(
                  text: 'Shop',
                  size: Dimensions.font26,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          left: Dimensions.width10,
                          right: Dimensions.width10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20)),
                          color: Colors.grey[300]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20, left: Dimensions.width30),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(onPressed: () {}, child: Text('Create Product')),
                  Divider(),
                  TextButton(onPressed: () {}, child: Text('Create Team')),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
