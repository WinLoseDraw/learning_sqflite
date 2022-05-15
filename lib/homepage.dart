// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:offline_db/database_manager.dart';
import 'package:offline_db/new_contact_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  void initState() {
    super.initState();
    Provider.of<DatabaseManager>(context).open();
  }

  @override

  Widget build(BuildContext context) {

    DatabaseManager primaryDbManager = Provider.of<DatabaseManager>(context);
    primaryDbManager.allContacts();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Contacts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "NewContact");
                },
                child: Text("+",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w300,
                    )
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)))
              )
            ),
          )
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
