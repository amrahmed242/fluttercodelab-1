import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_workshop/src/screens/second_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
              title: Text(
                'flutter study jam',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              centerTitle: true,
            ),
            ListTile(
              title: Text("data"),
              onTap: ()=>debugPrint("ff"),
            )
              ],
            ),
          ),
            appBar: AppBar(
              title: Text(
                'flutter study jam',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              centerTitle: true,
            ),
            body: RandomWords()));
  }
}

class RandomWords extends StatefulWidget {
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: Text("data"),
      trailing: new Icon(Icons.favorite,color: Colors.cyanAccent,),
      leading: CircleAvatar(child: Text(pair.toString().toUpperCase().substring(0,1)),),
      onTap: ()  {
            Navigator.push(context,MaterialPageRoute(builder: (context) => SecondScreen(pair)));
      }      
    );
  }

}