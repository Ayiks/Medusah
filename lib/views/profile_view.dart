import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';
import 'package:medusah/widgets/big_text.dart';

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
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80.r,
              ),
            ),
            SizedBox(height: 30.h),
            BigText(text: 'YOUR NAME', size: 15.sp),
            SizedBox(height: 8.h),
            Text(
              'Edusah Emmanuel',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: 10.h),
            BigText(text: 'YOUR EMAIL', size: 15.sp),
            Text(
              'EdusahEmmanuel@ gmail.com',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: 10.h),
            BigText(text: 'YOUR NUMBER', size: 15.sp),
            Text(
              '+23354223356',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: 10.h),
            BigText(text: 'YOUR GENDER', size: 15.sp),
            Text(
              'Male',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: 10.h),
            BigText(text: 'YOUR ROLE', size: 15.sp),
            Text(
              'Director',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.orange,
            ),
            SizedBox(height: 10.h),
            BigText(text: 'ABOUT ME', size: 15.sp),
            Text(
              'I like women',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
            ),
          ],
        ),
      )),
    );
  }
}
