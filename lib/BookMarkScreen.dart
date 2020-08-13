import 'package:bookmark_kit/BookMark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkScreen extends StatelessWidget {
  final Bookmark bookmark;

  BookMarkScreen({this.bookmark});

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(bookmark.title,style: TextStyle(fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(bookmark.description,style: TextStyle(fontSize: 15),),
      ),
    );
  }
}
