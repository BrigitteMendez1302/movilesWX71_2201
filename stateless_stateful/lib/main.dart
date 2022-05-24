import 'package:flutter/material.dart';



void main() {

  runApp(MyStatefulApp());

}



class MyStatelessApp extends StatelessWidget {

  int counter = 0;



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(

          title: Text("Ejm de StatelessWidget"),

        ),

        body: Center(

          child: Text(counter.toString(),
          style: TextStyle(fontSize: 40),),

        ),

        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.plus_one),

          onPressed: (){

            counter++;

            print(counter);//para imprimir en consola

          },

        ),



      ),

    );

  }

}

class MyStatefulApp extends StatefulWidget {
  const MyStatefulApp({Key? key}) : super(key: key);

  @override
  State<MyStatefulApp> createState() => _MyStatefulAppState();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(

          title: Text("Ejm de StatelessWidget"),

        ),

        body: Center(

          child: Text(counter.toString(),
            style: TextStyle(fontSize: 40),),

        ),

        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.plus_one),

          onPressed: (){
            counter++;
            print(counter);//para imprimir en consola
            setState(() {});
          },
        ),
      ),
    );
  }
}
