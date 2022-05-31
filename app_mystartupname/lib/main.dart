import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      home: RandomWord(),
    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final List<WordPair> suggestions = <WordPair>[];
  final TextStyle biggerFont = TextStyle(fontSize: 16);

  final Set<WordPair> saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text("Name StartUp Gen"),
      ),
      body: buildSggestions(),
    );
  }

  Widget buildSggestions(){
    return ListView.builder(
        padding: EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int i){
          if (i.isOdd){
            return const Divider(
              thickness: 2,
            );
    }
          final int index = i ~/ 2;
          print(i);

          if (index >= suggestions.length){
            suggestions.addAll(generateWordPairs().take(10));
    }
          return buildRow(suggestions[index]);
    }
    );
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }
}