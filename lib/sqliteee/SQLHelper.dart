import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  ///create table with nametodo and column name as title and task
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        task TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }

  //create database
  static Future<sql.Database> db() async {
    return sql.openDatabase('mytodo.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> addTask(String title, String task) async {
    final db = await SQLHelper.db();
    final data = {'title': title, 'task': task};
    final id = await db.insert('todo', data);
    return id;
  }

//read all the data from db u can use rawQuery() function too
  static Future<List<Map<String, dynamic>>> readData() async {
    final db = await SQLHelper.db();
    return db.query('todo', orderBy: "id");
  }

  //to read single data by id
  static Future<List<Map<String, dynamic>>> readSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query('todo', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // updating table data
  static Future<int> updateTask(int id, String title, String task) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'task': task,
      'createdAt': DateTime.now().toString()
    };
    final result = await db.update('todo', data);
    return result;
  }

  //delete Task
  static Future<void> deleteTask(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('todo', where: "id =?", whereArgs: [id]);
    } catch (error) {
      debugPrint("Some error occured $error");
    }
  }
}
