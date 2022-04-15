import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/views/settings_view.dart';
import 'package:medusah/widgets/app_column.dart';
import 'package:medusah/widgets/big_text.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right:15.w, top: 10.h),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SettingsView()));
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80'),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 15.h,
              right: 15.w,
              left: 15.w,
              bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: 'Hello,',
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: 26.sp,
              ),
              BigText(
                text: 'Edusah 👋',
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: 26.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.h,
                    left:10.w,
                    bottom: 10.h,
                    right: 10.w),
                //  height: Dimensions.height30,
                // width: Dimensions.width90,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.all(Radius.circular(20.r)),
                ),
                child: Center(
                    child: BigText(
                  text: 'Overview',
                  color: Colors.white,
                )),
              ),
              SizedBox(
                height: 20.h,
              ),
              const AppColumn(
                  text: 'Total Product',
                  quatity: 12,
                  image:
                      'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80'),
              SizedBox(
                height: 15.h,
              ),
              const AppColumn(
                  text: 'Total Sales',
                  quatity: 100,
                  image:
                      'https://images.unsplash.com/photo-1580828343064-fde4fc206bc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
              SizedBox(
                height: 15.h,
              ),
             const AppColumn(
                  text: 'Total Stock',
                  quatity: 300,
                  image:
                      'https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
            ],
          ),
        ),
      )),
    );
  }
}
