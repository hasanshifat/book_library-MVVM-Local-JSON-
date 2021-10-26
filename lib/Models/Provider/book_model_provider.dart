import 'package:book_library/Models/book_list_model.dart';
import 'package:book_library/Models/borrow_list_model.dart';
import 'package:book_library/Services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BookViewModel extends ChangeNotifier {
  List<BookListModel> _bookList = [];
  List<BookListModel> get bookListModel => _bookList;
  List<BorrowListModel> _borrowList = [];
  List<BorrowListModel> get bookBorrowListModel => _borrowList;

  setBookListModel(List<BookListModel> bookList) {
    _bookList = bookList;
    notifyListeners();
  }

  getBooksData() async {
    var booksData = await BookService.getBooks();
    print('booksData:$booksData');
    setBookListModel(booksData);
  }

  setBookBorrowListModel(List<BorrowListModel> bookBorrowList) {
    _borrowList = bookBorrowList;
    notifyListeners();
  }

  updateBookList(List<BookListModel> bookList) {
    _bookList = bookList;
    notifyListeners();
  }
}
