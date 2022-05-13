import 'package:sqflite/sqflite.dart';

const String TableName = "Contacts";
const String ContactID = "ContactID";
const String SerialNumber = "SerialNumber";
const String ContactName = "ContactName";
const String ContactNumber = "ContactNumber";

class Contact {

  int? contactId;
  String contactName;
  int contactNumber;

  Map<String, Object?> toMap() {
    var map = <String, Object?> {
      ContactName: contactName,
      ContactNumber: contactNumber,
    };
    if (contactId != null) {
      map[ContactID] = contactId;
    }
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) :
    contactId = map[ContactID],
    contactName = map[ContactName],
    contactNumber = map[ContactNumber];
}

class DatabaseManager {

  Database? db;

  Future open(String path) async {
    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              '''create table $TableName (
              $ContactID integer primary key autoincrement,
              $ContactName text not null,
              $ContactNumber integer)'''
          );
        }
    );
  }

  Future<Contact> insert(Contact contact) async {
    contact.contactId = (await db?.insert(TableName, contact.toMap()))!;
    return contact;
  }

  Future<Contact?> getContact(int contactId) async {
    List<Map> maps = await db?.query(TableName,
        columns: [ContactID, ContactName, ContactNumber],
        where: '$ContactID = ?',
        whereArgs: [contactId]) as List<Map<dynamic, dynamic>>;
    if (maps.isNotEmpty) {
      return Contact.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  Future<int?> delete(int contactId) async {
    return await db?.delete(TableName,
      where: '$ContactID = ?',
      whereArgs: [contactId]);
  }

  Future<int?> update(Contact contact) async {
    return await db?.update(TableName, contact.toMap(),
        where: '$ContactID = ?',
        whereArgs: [contact.contactId]);
  }

  Future close() async {
    db?.close();
  }
}