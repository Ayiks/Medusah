import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medusah/widgets/app_icon.dart';

import '../utils/utils.dart';

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
          padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  SizedBox(height: Dimensions.height20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15),
                          ),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: Dimensions.font20)),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15),
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: Dimensions.font20)),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15),
                          ),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(fontSize: Dimensions.font20)),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: 'Role',
                        labelStyle: TextStyle(fontSize: Dimensions.font20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15),
                        ))),
                    value: dropdownRole,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: Dimensions.font16 - 2),
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
                        child: Text(value, style: TextStyle(fontSize: Dimensions.font16 - 2)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: Dimensions.height20),
                  SizedBox(
                    width: double.maxFinite,
                    height: Dimensions.height30,
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
