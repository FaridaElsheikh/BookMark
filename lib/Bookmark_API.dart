import 'dart:convert';
import 'Bookmark.dart';
import 'package:http/http.dart' as http;

class BookmarkAPI {

  Future<List<Bookmark>> fetchBookmarks() async {
    final String url = 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a6fa28ece8a24448bf2f618fc20bdf18';
    final response = await http.get(url);
    List<Bookmark> bookmarks = List();

    if (response.statusCode == 200) {
      final jsonBookmarks = json.decode(response.body)['articles'];
      for (var jsonBookmark in jsonBookmarks) {
        bookmarks.add(Bookmark.fromJson(jsonBookmark));
      }
    } else {
      throw Exception('Failed to load bookmark');
    }
    return bookmarks;
  }
}
