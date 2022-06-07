import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  final int version = 1;
  Database? db;

  Future<Database> openDb() async{
    db ??= await openDatabase(join(await getDatabasesPath(), 'shop.db'), onCreate: (database, version){
        database.execute('CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
        database.execute('CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT, FOREIGN KEY(idList) REFERENCES list(id)');
      }, version: version);
    return db!;
  }
}