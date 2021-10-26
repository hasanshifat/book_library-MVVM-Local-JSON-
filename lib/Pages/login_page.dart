import 'package:book_library/Components/constants.dart';
import 'package:book_library/Components/custom_login_ui.dart';
import 'package:book_library/Components/custom_text.dart';
import 'package:book_library/Components/snackbar_msg.dart';
import 'package:book_library/Pages/book_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    saveData();
    super.initState();
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String uname, pass;

  //Saving credential
  Future saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString('uname', defaultUsername);
      sharedPreferences.setString('pass', defaultPassword);
      uname = sharedPreferences.getString('uname');
      pass = sharedPreferences.getString('pass');
    });
  }

  //Checking validation
  checkUserPass() {
    if (usernameController.text != uname) {
      CustomFunctions.snackbar(context, 'Invalid Username!');
    } else if (passwordController.text != pass) {
      CustomFunctions.snackbar(context, 'Invalid Password!');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => BookList()));
      usernameController.clear();
      passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: white,
        title: CustomText(
          text: 'Login Page',
          fontWeight: FontWeight.bold,
          color: black87,
        ),
      ),
      body: SafeArea(
          child: Container(
        child: LoginUIPage(
          btntext: 'Log In',
          btnfontSize: 20,
          autofocus: true,
          usrcntrolerText: usernameController,
          passcontrolerText: passwordController,
          passobscureText: true,
          press: () => checkUserPass(),
        ),
      )),
    );
  }
}
