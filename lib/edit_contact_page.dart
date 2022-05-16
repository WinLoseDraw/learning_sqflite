// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database_manager.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({Key? key}) : super(key: key);

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {

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
                if (validateDetails(inputContactName, inputContactNumber)) {
                  Provider.of<DatabaseManager>(context, listen: false).update(Contact(contactName: inputContactName, contactNumber: inputContactNumber, contactId: Provider.of<ContactIDProvider>(context, listen: false).contactId)).then(
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
                  hintText: Provider.of<ContactIDProvider>(context, listen: false).contactName,
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
                  hintText: Provider.of<ContactIDProvider>(context, listen: false).contactNumber.toString(),
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
