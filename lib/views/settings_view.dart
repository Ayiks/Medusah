import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:15.w, vertical:15.h),
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
            const  CircleAvatar(
                radius: 60,
                backgroundImage:  NetworkImage(
                    'https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              ),
              SizedBox(
                height:10.h,
              ),
              BigText(
                text: "Edusah Emmanuel",
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              SizedBox(
                height:10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(20.r)),
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
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Workspace',
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.h,
                        right: 10.w,
                        left:10.w,
                        bottom: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      color: Colors.grey[350],
                    ),
                    child:const ListTile(
                      leading: CircleAvatar(),
                      title: Text('Paints'),
                      subtitle: Text("Inventory"),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BigText(
                    text: 'Manage',
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.h,
                        right: 10.w,
                        left:10.w,
                        bottom:10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      color: Colors.grey[350],
                    ),
                    child: const ListTile(
                      leading: CircleAvatar(),
                      title: Text('Team'),
                      subtitle: Text("Inventory"),
                    ),
                  ),
                  SizedBox(
                    height:10.w,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 45.h,
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
