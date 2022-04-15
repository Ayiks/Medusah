import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({Key? key}) : super(key: key);

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  String dropdownRole = 'Select option';

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
        title: const Text(
          'My Team',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  SizedBox(height: 20.h),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(fontSize: 20.sp)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: 'Role',
                        labelStyle: TextStyle(fontSize: 20.sp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15.r),
                        ))),
                    value: dropdownRole,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownRole = newValue!;
                      });
                    },
                    items: <String>[
                      'Select option',
                      'Admin',
                      'User',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 12.sp)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.maxFinite,
                    height: 30.h,
                    child: TextButton(
                      onPressed: () {},
                      child:const Text(
                        'Add Team Member',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    ),
                  )
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
