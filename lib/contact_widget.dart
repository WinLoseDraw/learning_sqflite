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
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ContactIDProvider>(context, listen: false).contactId = id;
                    Provider.of<ContactIDProvider>(context, listen: false).contactName = name;
                    Provider.of<ContactIDProvider>(context, listen: false).contactNumber = number;
                    Navigator.pushReplacementNamed(context, "EditContact");
                  },
                  child: Icon(Icons.edit),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<DatabaseManager>(context, listen: false).delete(id).then(
                          (value) => Provider.of<DatabaseManager>(context, listen: false).getAllContacts());
                },
                child: Icon(Icons.delete),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            ),
          ],
        )
    );
  }
}
