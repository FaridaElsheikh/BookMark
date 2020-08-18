import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BookmarkListPage.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: Scaffold(body: BookmarkListPage())));
  }
}


