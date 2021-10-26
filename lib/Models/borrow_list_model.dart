// To parse this JSON data, do
//
//     final borrowListModel = borrowListModelFromJson(jsonString);

import 'dart:convert';

List<BorrowListModel> borrowListModelFromJson(String str) => List<BorrowListModel>.from(json.decode(str).map((x) => BorrowListModel.fromJson(x)));

String borrowListModelToJson(List<BorrowListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BorrowListModel {
    BorrowListModel({
       
        this.bookId,
        this.bookName,
        this.totalBookQty,
    });

   
    int bookId;
    String bookName;
    int totalBookQty;

    factory BorrowListModel.fromJson(Map<String, dynamic> json) => BorrowListModel(
        
        bookId: json["BOOK_ID"],
        bookName: json["BOOK_NAME"],
        totalBookQty: json["TOTAL_BOOK_QTY"],
    );

    Map<String, dynamic> toJson() => {
        
        "BOOK_ID": bookId,
        "BOOK_NAME": bookName,
        "TOTAL_BOOK_QTY": totalBookQty,
    };
}
