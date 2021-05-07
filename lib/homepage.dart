import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_drop_down.dart';

class HomePage extends StatelessWidget {
  List<TagModel> labelOptions = [
    TagModel(label: 'Field 1'),
    TagModel(label: 'Field 2',selected: true),
    TagModel(label: 'Field 3'),
    TagModel(label: 'Field 4'),
    TagModel(label: 'Field 5'),
  ];

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
            CustomDropDown(
              tagList: labelOptions,
              onDelete: (){
                print("cliquei no delete");
              },
              onSelected: (){
                print("cliquei para selecionar");
              },
            ),
            ElevatedButton(
              onPressed: () {
                print(
                  labelOptions.where((element) => element.selected == true),
                );
              },
              child: Text("teste"),
            )
          ],
        ),
      ),
    );
  }
}