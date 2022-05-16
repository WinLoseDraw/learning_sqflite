// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database_manager.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {

  String errorMessage = "";
  String inputContactName = "";
  int inputContactNumber = 0;

  bool validateDetails(String name, int number) {
    if (name.isEmpty) {
      errorMessage = "Please enter a name.";
      return false;
    }
    else if (number.toString().length != 10) {
      errorMessage = "Please enter a valid number.";
      return false;
    }
    else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact",
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
                if (validateDetails(inputContactName, inputContactNumber)) {
                  Provider.of<DatabaseManager>(context, listen: false).insert(Contact(contactName: inputContactName, contactNumber: inputContactNumber)).then(
                          (value) => Provider.of<DatabaseManager>(context, listen: false).getAllContacts().then((value) => Navigator.pushReplacementNamed(context, "/")));
                }
                else {
                  setState(() {
                    errorMessage = errorMessage;
                  });
                }
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
            Text("Contact Name:",
              style: TextStyle(
                  fontSize: 22.0,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Enter contact name",
                ),
                onChanged: (text) => inputContactName = text,
              ),
            ),
            Text("Contact Number:",
              style: TextStyle(
                  fontSize: 22.0,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Enter a 10 digit number",
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) => inputContactNumber = int.parse(text),
              ),
            ),
            Text(errorMessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
