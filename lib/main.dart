import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String inp;
  String rez = "No Value Entered";
  final myController = TextEditingController();
  TextEditingController textinput1 = TextEditingController();

  void _countWords() {
    setState(() {
      rez = inp;
      log(rez.toString());
    });
    final splitter = rez.split(RegExp('\\s'));
    int k1 = 0;

    for (String a in splitter) {
      if (a.contains('a')) {
        k1++;
      }
    }
    // return k1;
    Text(k1.toString());

    rez = k1.toString();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 150,
              child: TextFormField(
                style: TextStyle(fontSize: 40),
                onChanged: (data) => inp = data,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter text',
                  labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed:
                      // _setText,
                      _countWords,
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text('Press')),
            ),
             Text(
              "$rez",
              style: TextStyle(fontSize: 40),
            ),Text(
              "Hello",
              style: TextStyle(fontSize: 40),
            ),

          ],


        ),
      ),

      /*floatingActionButton: FloatingActionButton(

        onPressed: (){
          _setText;
          Text(text1);
        },
        child: const Icon(Icons.add),



      ),*/
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
