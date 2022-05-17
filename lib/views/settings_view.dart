import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

import '../utils/utils.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:Dimensions.width10, vertical:Dimensions.height15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const AppIcon(icon: Icons.close_sharp))),
              CircleAvatar(
                radius: Dimensions.radius30 * 2,
                backgroundImage:  NetworkImage(
                    'https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              ),
              SizedBox(
                height:Dimensions.height10,
              ),
              BigText(
                text: "Edusah Emmanuel",
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              SizedBox(
                height:Dimensions.height10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius20)),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('View Proile'),
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Workspace',
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        right: Dimensions.width10,
                        left:Dimensions.width10,
                        bottom: Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                      color: Colors.grey[350],
                    ),
                    child:const ListTile(
                      leading: CircleAvatar(),
                      title: Text('Paints'),
                      subtitle: Text("Inventory"),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: 'Manage',
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        right: Dimensions.width10,
                        left:Dimensions.width10,
                        bottom:Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                      color: Colors.grey[350],
                    ),
                    child: const ListTile(
                      leading: CircleAvatar(),
                      title: Text('Team'),
                      subtitle: Text("Inventory"),
                    ),
                  ),
                  SizedBox(
                    height:Dimensions.height10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: Dimensions.height45,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red[300]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
