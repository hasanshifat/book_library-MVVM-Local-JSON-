import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginUIPage extends StatelessWidget {
  String hintText;
  IconData icon;
  dynamic Function(String) validator;
  Function onSaved;
  Function onFieldSubmitted;
  FocusNode focusNode;
  TextInputAction textInputAction;
  ValueChanged<String> onChanged;
  TextEditingController usrcntrolerText, passcontrolerText;
  Color color, fillColor;
  Color prefixiconcolor;
  double prefixiconsize;
  bool obscureText = false;
  bool passobscureText = false;
  Widget suffixIcon, prefixIcon;
  String errorText;
  String titletext;
  double ttfontsize;
  Color ttcolor;
  FontWeight ttfontWeight;
  TextAlign tttextAlign;
  TextOverflow ttoverflow;
  bool centerTitle, autofocus;
  String btntext;
  Function press;
  Color btncolor, btntextColor;
  Gradient btngradients;
  double btnfontSize;
  double btnheight, btnwidth;
  FontWeight btnfontWeight;
  LoginUIPage(
      {Key key,
      this.hintText,
      this.validator,
      this.onSaved,
      this.errorText,
      this.textInputAction,
      this.onFieldSubmitted,
      this.focusNode,
      this.fillColor,
      this.suffixIcon,
      this.prefixIcon,
      this.icon,
      this.autofocus,
      this.onChanged,
      this.usrcntrolerText,
      this.passcontrolerText,
      this.prefixiconcolor,
      this.prefixiconsize,
      this.color,
      this.obscureText,
      this.titletext,
      this.ttcolor,
      this.ttfontWeight,
      this.ttfontsize,
      this.ttoverflow,
      this.tttextAlign,
      this.centerTitle,
      this.btncolor,
      this.btnfontSize,
      this.btngradients,
      this.btntext,
      this.btntextColor,
      this.press,
      this.btnheight,
      this.btnwidth,
      this.passobscureText,
      this.btnfontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  // height: size.height * 0.08,
                  // width: size.width * .85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    autofocus: autofocus,
                    validator: validator,
                    keyboardType: TextInputType.name,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    onFieldSubmitted: onFieldSubmitted,
                    controller: usrcntrolerText,
                    obscureText: obscureText ?? false,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,

                      labelText: 'Username',
                      filled: false,
                      fillColor: fillColor,
                      hintText: hintText,
                      //  border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: new BorderSide(
                              // color: color3,
                              )),
                      errorText: errorText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  // height: size.height * 0.08,
                  // width: size.width * .85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    //autofocus: false,
                    validator: validator,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    onFieldSubmitted: onFieldSubmitted,
                    controller: passcontrolerText,
                    obscureText: passobscureText,
                    focusNode: focusNode,
                    textInputAction: textInputAction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,

                      labelText: 'Password',
                      filled: false,
                      fillColor: fillColor,
                      hintText: hintText,
                      //  border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: new BorderSide(
                              // color: color3,
                              )),
                      errorText: errorText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: btngradients,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
            width: btnwidth ?? 300,
            height: btnheight ?? 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    btncolor ?? Colors.black87),
              ),
              onPressed: press,
              child: Text(btntext ?? 'Button Text',
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                        color: btntextColor ?? Colors.white,
                        fontSize: btnfontSize ?? 15,
                        letterSpacing: 1,
                        fontWeight: btnfontWeight ?? FontWeight.w500,
                        decoration: TextDecoration.none),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
