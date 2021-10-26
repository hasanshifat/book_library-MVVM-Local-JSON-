import 'package:book_library/Components/constants.dart';
import 'package:book_library/Components/custom_text.dart';
import 'package:book_library/Components/snackbar_msg.dart';
import 'package:book_library/Models/Provider/book_model_provider.dart';
import 'package:book_library/Models/borrow_list_model.dart';
import 'package:book_library/Pages/my_borrow_list.dart';
import 'package:book_library/Services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  const BookList({Key key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<BorrowListModel> demoBookList = [];
  @override
  void initState() {
    getBookList();
    super.initState();
  }

  //Getting the book json list
  getBookList() {
    final BookViewModel bookViewModel =
        Provider.of<BookViewModel>(context, listen: false);
    try {
      BookService.getBooks().then((value) {
        setState(() {
          bookViewModel.setBookListModel(value);
        });
      });
    } catch (e) {
      print('error: $e');
    }
  }

  //Checking borrow list
  checkMyList(int index) {
    final BookViewModel bookViewModel =
        Provider.of<BookViewModel>(context, listen: false);
    try {
      if (bookViewModel.bookBorrowListModel.length < 1) {
        bookAddToMyList(bookViewModel, index);
      } else {
        Iterable<BorrowListModel> containsBook = bookViewModel
            .bookBorrowListModel
            .where((element) => element.bookName
                .contains(bookViewModel.bookListModel[index].bookName));
        if (containsBook.length == 0) {
          bookAddToMyList(bookViewModel, index);
        } else {
          CustomFunctions.snackbar(context, 'You already added this book!');
        }
      }
    } catch (e) {
      print('error: $e');
    }
  }

  //Adding to borrow list
  bookAddToMyList(bookViewModel, index) {
    try {
      setState(() {
        bookViewModel.bookListModel[index].bookQty =
            bookViewModel.bookListModel[index].bookQty - 1;
        demoBookList.add(BorrowListModel(
          
            bookId: bookViewModel.bookListModel[index].bookid,
            bookName: bookViewModel.bookListModel[index].bookName,
            totalBookQty: 1));
        bookViewModel.setBookBorrowListModel(demoBookList);
      });
      CustomFunctions.snackbar(
          context, '${bookViewModel.bookListModel[index].bookName} added');
    } catch (e) {
      print('error: $e');
    }
  }

  //Navigate to borrow list page
  goToMyList() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => MyBookList()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final BookViewModel bookViewModel =
    //     Provider.of<BookViewModel>(context, listen: false);
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Consumer<BookViewModel>(builder: (context, bookViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: CustomText(
              text: 'Book Library',
              fontWeight: FontWeight.bold,
              color: black87,
            ),
            backgroundColor: white,
          ),
          body: Container(
              width: size.width * 1,
              height: size.height * 1,
              color: Colors.white,
              child: _ui(bookViewModel)),
          floatingActionButton: ElevatedButton(
            onPressed: () => bookViewModel.bookBorrowListModel.length == 0
                ? CustomFunctions.snackbar(
                    context, 'You do not have any books!')
                : goToMyList(),
            child: CustomText(
              text: 'My Books',
              color: white,
              fontsize: 15,
            ),
          ),
        );
      }),
    );
  }

  _ui(bookViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: bookViewModel.bookListModel.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: bookViewModel.bookListModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: CustomText(
                          text:
                              '${bookViewModel.bookListModel[index].bookName.substring(0, 1)}',
                        ),
                      ),
                    ),
                    title: CustomText(
                      text: '${bookViewModel.bookListModel[index].bookName}',
                      fontsize: 18,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              'Available pcs: ${bookViewModel.bookListModel[index].bookQty}',
                          color: Colors.pink,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          if (bookViewModel.bookListModel[index].bookQty == 1) {
                            CustomFunctions.snackbar(
                                context, 'You can not borrow this book!');
                          } else if (bookViewModel.bookBorrowListModel.length ==
                              2) {
                            CustomFunctions.snackbar(
                                context, 'You have reached your limit');
                          } else {
                            checkMyList(index);
                          }
                        }),
                  ),
                );
              },
            ),
    );
  }
}
