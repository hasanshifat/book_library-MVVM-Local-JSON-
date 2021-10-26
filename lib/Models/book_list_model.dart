

import 'dart:convert';

List<BookListModel> bookListModelFromJson(String str) => List<BookListModel>.from(json.decode(str).map((x) => BookListModel.fromJson(x)));

String bookListModelToJson(List<BookListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookListModel {
    BookListModel({
        this.bookid,
        this.bookName,
        this.bookQty,
    });

    int bookid;
    String bookName;
    int bookQty;

    factory BookListModel.fromJson(Map<String, dynamic> json) => BookListModel(
        bookid: json["BOOKID"],
        bookName: json["BOOK_NAME"],
        bookQty: json["BOOK_QTY"],
    );

    Map<String, dynamic> toJson() => {
        "BOOKID": bookid,
        "BOOK_NAME": bookName,
        "BOOK_QTY": bookQty,
    };
}