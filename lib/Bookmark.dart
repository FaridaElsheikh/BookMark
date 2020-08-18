import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookmark {
  final String title;
  final String description;

  const Bookmark(this.title,this.description);
  /*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 30,),textAlign: TextAlign.left,),
          Text(description,textAlign: TextAlign.right),
        ],
      ),
    );
  }
  */

}