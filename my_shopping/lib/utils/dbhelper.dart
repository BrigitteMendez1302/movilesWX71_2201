import 'package:my_shopping/models/list_items.dart';
import 'package:my_shopping/models/shopping_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{

  final int version = 1; //opc.

  Database? db;



  Future<Database> openDb() async {

    if (db == null) {

      db = await openDatabase(join(await getDatabasesPath(),

          'shopp_v2.db'),

          onCreate: (database, version) {

            database.execute(

                'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');

            database.execute(

                'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, '

                    'name TEXT, quantity TEXT, note TEXT, FOREIGN KEY(idList) REFERENCES lists(id))');

          }, version: version

      );

    }

    return db!;

  }



  Future testDb() async{

    db = await openDb();



    await db!.execute('INSERT INTO lists(name, priority) VALUES("Memorias", 3)');

    await db!.execute('INSERT INTO items(idList, name, quantity, note) VALUES(1, "Memoria USB", "3 cajas", "Micro-memorias")');



    List lists = await db!.rawQuery('SELECT * FROM lists');

    List items = await db!.rawQuery('SELECT * FROM items');



    print(lists[0]);

    print(items[0]);

    // insert lists
    Future<int> insertList(ShoppingList list) async{
      int id = await this.db!.insert('lists', list.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      return id;
    }

    Future<int> insertItem(ListItems listItem) async{
      int id = await this.db!.insert('items', listItem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      return id;
    }

  }

}