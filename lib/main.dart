import 'package:bookmark_kit/BookMarkScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BookMark.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: Scaffold(body: HomeScreen())));
  }
}

class HomeScreen extends StatelessWidget {
  List<Bookmark> bookmarks = List.generate(
      20,
      (i) => Bookmark(
            'Bookmark $i',
            'Description of Bookmark $i goes here ' * 3,
          ));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, bookmarkIndex) => const Divider(),
        itemCount: bookmarks.length,
        itemBuilder: (context, int bookmarkIndex) {
          return ListTile(
              title: Text(
                bookmarks[bookmarkIndex].title,
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text(bookmarks[bookmarkIndex].description),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookMarkScreen(
                            bookmark: bookmarks[bookmarkIndex])));
              });
        });
  }
}
