import 'package:book_library/Components/constants.dart';
import 'package:book_library/Components/custom_text.dart';
import 'package:book_library/Models/Provider/book_model_provider.dart';
import 'package:book_library/Models/book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookList extends StatefulWidget {
  const MyBookList({Key key}) : super(key: key);

  @override
  _MyBookListState createState() => _MyBookListState();
}

class _MyBookListState extends State<MyBookList> {
  List<BookListModel> demoBookList = [];
  //checking the book is available in borrow list or not
  updateBookQty(index, bookName) {
    final BookViewModel bookViewModel =
        Provider.of<BookViewModel>(context, listen: false);

    try {
      Iterable<BookListModel> containsBook = bookViewModel.bookListModel
          .where((element) => element.bookName.contains(bookName));

      if (containsBook.length != 0) {
        containsBook.forEach((element) {
          setState(() {
            element.bookQty += 1;
            bookViewModel.bookBorrowListModel.removeAt(index);
            demoBookList = bookViewModel.bookListModel;
            bookViewModel.updateBookList(demoBookList);
          });
        });
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final BookViewModel bookViewModel =
        Provider.of<BookViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: white,
        title: CustomText(
          text: 'My Books',
          fontWeight: FontWeight.bold,
          color: black87,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: bookViewModel.bookBorrowListModel.length < 1
                ? Center(
                    child: CustomText(
                      text: 'No Books!',
                    ),
                  )
                : ListView.builder(
                    itemCount: bookViewModel.bookBorrowListModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Center(
                            child: CustomText(
                              text:
                                  '${bookViewModel.bookBorrowListModel[index].bookName.toString().substring(0, 1)}',
                            ),
                          ),
                        ),
                        title: CustomText(
                          text:
                              '${bookViewModel.bookBorrowListModel[index].bookName}',
                        ),
                        trailing: Container(
                          width: 70,
                          height: 40,
                          color: white,
                          child: TextButton(
                              child: Center(
                                child: CustomText(
                                  text: 'Return',
                                  color: black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  String bookName = bookViewModel
                                      .bookBorrowListModel[index].bookName;
                                  updateBookQty(index, bookName);
                                });
                              }),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
