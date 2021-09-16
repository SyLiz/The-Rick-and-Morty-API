import 'package:flutter/material.dart';
import 'package:rickandmortyapi/pages/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Rick and Morty',
      home: LoadingPage(),
    );
  }
}
