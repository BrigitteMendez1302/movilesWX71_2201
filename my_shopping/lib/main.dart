import 'package:flutter/material.dart';
import 'package:my_shopping/utils/dbhelper.dart';
import 'package:my_shopping/models/list_items.dart';
import 'package:my_shopping/models/shopping_list.dart';

void main() {

  runApp(MyApp());

}



class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    //DbHelper helper = DbHelper();

    //helper.testDb();



    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.green,

      ),

      home: Scaffold(

        appBar: AppBar(

          title: Text("My shopping list!!!"),

        ),

        body: ShowList(),

      ),

    );

  }

}



class ShowList extends StatefulWidget {

  @override

  State<ShowList> createState() => _ShowListState();

}



class _ShowListState extends State<ShowList> {

  DbHelper helper = DbHelper();



  @override

  Widget build(BuildContext context) {

    return Container();

  }

}