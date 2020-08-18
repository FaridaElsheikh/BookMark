import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bookmark.dart';
import 'BookmarkContentScreen.dart';
import 'Bookmark_API.dart';

class BookmarkListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookmarkListPageState();
}

class BookmarkListPageState extends State<BookmarkListPage> {

  List<Bookmark> bookmarks = List<Bookmark>();
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    BookmarkAPI().fetchBookmarks().then((value) {
      setState(() {
        bookmarks.addAll(value);
        dataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return CircularProgressIndicator();
    } else {
      print("building");
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: bookmarks == null ? 0 : bookmarks.length,
          itemBuilder: (context, int bookmarkIndex) {
            return _buildListView(bookmarkIndex);
          });
    }
  }
  Widget _buildListView(int bookmarkIndex){
    return Container(
      height: 200,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookMarkScreen(
                    bookmark: bookmarks[bookmarkIndex],
                  ),
                ));
          },
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(child: _buildTitleDescription(bookmarkIndex)),
                _buildImage(bookmarkIndex)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTitleDescription(int bookmarkIndex) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              bookmarks[bookmarkIndex].title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              bookmarks[bookmarkIndex].description,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ]),
    );
  }

  Widget _buildImage(int bookmarkIndex) {
    return Container(
      padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          bookmarks[bookmarkIndex].urlToImage,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
