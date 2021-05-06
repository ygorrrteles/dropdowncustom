import 'package:dropdowncustom/controller.dart';
import 'package:dropdowncustom/custom_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final controller = Controller();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selecting"),
            SizedBox(height: 10),
            CustomDropDown(
              tagList: controller.tagList,
            ),
          ],
        ),
      ),
    );
  }
}
