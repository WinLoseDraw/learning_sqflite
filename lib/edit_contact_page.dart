// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({Key? key}) : super(key: key);

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Contact",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Icon(Icons.check),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.lightBlue),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)))
              )
          ),
        ),
        leadingWidth: 80,
        actions: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
                child: Icon(Icons.close),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.lightBlue),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)))
                )
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("hehe",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.deepOrangeAccent
              ),
            ),
          ],
        ),
      ),
    );
  }
}
