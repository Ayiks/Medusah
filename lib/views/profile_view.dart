import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

import '../utils/utils.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
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
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: Dimensions.radius20 * 4,
              ),
            ),
            SizedBox(height: Dimensions.height30),
            BigText(text: 'YOUR NAME', size: Dimensions.font16),
            SizedBox(height: Dimensions.height10),
            Text(
              'Edusah Emmanuel',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: Dimensions.height10),
            BigText(text: 'YOUR EMAIL', size: Dimensions.font16),
            Text(
              'EdusahEmmanuel@ gmail.com',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: Dimensions.height10),
            BigText(text: 'YOUR NUMBER', size: Dimensions.font16),
            Text(
              '+23354223356',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: Dimensions.height10),
            BigText(text: 'YOUR GENDER', size: Dimensions.font16),
            Text(
              'Male',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: Dimensions.height10),
            BigText(text: 'YOUR ROLE', size: Dimensions.font16),
            Text(
              'Director',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: Dimensions.height10),
            BigText(text: 'ABOUT ME', size: Dimensions.font16),
            Text(
              'I like women',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font26),
            ),
          ],
        ),
      )),
    );
  }
}
