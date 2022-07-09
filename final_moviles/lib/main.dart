import 'package:flutter/material.dart';
import 'package:final_moviles/UI/category_list.dart';

void main() {
  runApp(const MyCategories());
}

class MyCategories extends StatelessWidget {
  const MyCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BestGourmet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryList(),
    );
  }
}