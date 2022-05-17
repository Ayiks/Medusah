import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';

import '../utils/utils.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

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
              child: const AppIcon(
                icon: Icons.arrow_back_ios_outlined,
                backgroundColor: Colors.orange,
                iconColor: Colors.white,
              )),
        ),
        title: const Text('My Team'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: TextButton(onPressed: () {}, child: Text('Add Member')),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15-6)),
              border: Border.all(width: 1.5, color: Colors.orange)),
          child: const ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80')),
            title: Text('Nana Yaw'),
            subtitle: Text('Manager'),
          ),
        ),
      )),
    );
  }
}
