import 'dart:io';

import 'package:flutter/material.dart';
import 'package:readme/readme.dart';

import 'materialdesignlogo.dart';

Future<void> main(List<String> args) async {
//  final info = getPackageInfo();
//
//  final shiledProps = await ShieldProps.read();
//
//  final readme = new Readme()
//    ..packageName = info.name
//    ..description = info.description
//    ..license = args.length > 0 ? args.first : 'MIT'
//    ..example = await getExample()
//    ..shields = compileShields(shiledProps);
//  stdout.write(readme);
  runApp(MaterialApp(
    home: SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(
            "Test",
            style: TextStyle(
                fontFamily: 'JosefinSans', package: 'materialdesignlogo'),
          ),
//          MdiLogo.ferrari(),
        ],
      )),
    )),
  ));
}
