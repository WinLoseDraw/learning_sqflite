// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_contact_page.dart';
import 'homepage.dart';

void main() {
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => HomePage(),
        "NewContact" : (context) => NewContactPage(),
      },
      initialRoute: "/",
    );
  }
}
