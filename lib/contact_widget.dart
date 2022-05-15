// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:offline_db/database_manager.dart';
import 'package:provider/provider.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0, spreadRadius: 3.0)],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text("ContactName"),
              Text("ContactNumber"),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "EditContactPage");
              },
              child: Icon(Icons.edit),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.delete),
          ),
        ],
      )
    );
  }
}
