// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:offline_db/database_manager.dart';
import 'package:provider/provider.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget({Key? key, required this.name, required this.number, required this.id}) : super(key: key);

  String name;
  int number;
  int id;

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
                Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Text(number.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
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
