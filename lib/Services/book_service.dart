import 'dart:convert';
import 'package:book_library/Models/book_list_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class BookService {
  static Future<List<BookListModel>> getBooks() async {
    try {
      final bookJson =
          await rootBundle.rootBundle.loadString('assets/json/bookList.json');
      final list = json.decode(bookJson) as List<dynamic>;

      return list.map((e) => BookListModel.fromJson(e)).toList();
    } catch (e) {
      print('error: $e');
      return e;
    }
  }
}
