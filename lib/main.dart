import 'package:flutter/material.dart';
import 'package:flutter_webservice_test/pages/characters/character_details_page.dart';
import 'package:flutter_webservice_test/pages/characters/character_list_page.dart';
import 'package:flutter_webservice_test/pages/welcome/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: {
        "detail" : (context) => CharacterDetailsPage(),
        "list"   : (context) => CharacterListPage()
      },
    );
  }
}