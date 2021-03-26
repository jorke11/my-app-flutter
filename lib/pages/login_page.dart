import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/api/account_api.dart';
import 'package:my_flutter_app/main.dart';
import 'package:my_flutter_app/pages/home_page.dart';
import 'package:my_flutter_app/utils/dialogs.dart';
import 'package:my_flutter_app/widgets/my_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static final routeName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNodePassword = FocusNode();

  AccountAPI api = AccountAPI();

  String _email = "", _password = "";
  bool _isFetching = false;

  GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  _submit() async {
    final bool isValid = _formkey.currentState.validate();
    if (isValid) {
      setState(() {
        _isFetching = true;
      });

      bool isOk = await api.login(_email, _password);

      if (isOk) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("wasLogin", true);
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        setState(() {
          _isFetching = false;
        });

        await Dialogs.alert(context,title:"ERROR",body: "Emain y/o contraseña incorrectos");
      }
    }
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains("@")) {
      _email = email;
      return null;
    }

    return "Invalid Email";
  }

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 4) {
      _password = password;
      return null;
    }

    return "Invalid Password";
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Container(
                height: size.height - padding.top - padding.bottom,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 60, bottom: 10),
                        child: Image.network(
                          "https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo1.png",
                          width: 280,
                          color: Color(0xff304ffe),
                        ),
                      ),
                      Text("Test UI",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ]),
                    ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 330, minWidth: 200),
                        child: Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "example@example.com",
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      prefixIcon: Icon(Icons.email)),
                                  keyboardType: TextInputType.emailAddress,
                                  keyboardAppearance: Brightness.light,
                                  textInputAction: TextInputAction.next,
                                  validator: _validateEmail,
                                  onFieldSubmitted: (String text) {
                                    _focusNodePassword.nextFocus();
                                  },
                                  initialValue: "eve.holt@reqres.in",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "********",
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      prefixIcon: Icon(Icons.lock)),
                                  obscureText: true,
                                  keyboardAppearance: Brightness.light,
                                  focusNode: _focusNodePassword,
                                  textInputAction: TextInputAction.send,
                                  validator: _validatePassword,
                                  onFieldSubmitted: (String text) {
                                    _submit();
                                  },
                                  initialValue: "cityslicka",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text("Olvide mi contraseña",
                                              style: TextStyle(
                                                  color: Color(0xff304ffe))),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color:
                                                          Color(0xff304ffe)))),
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MyBtn(
                                    label: "INGRESA",
                                    fullWidth: true,
                                    onPressed: _submit,
                                    backgroundColor: Color(0xff304ffe),
                                    textColor: Colors.white),
                                SizedBox(
                                  height: 35,
                                ),
                                Text("o inicia con:"),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: MyBtn(
                                          label: "FACEBOOK",
                                          fullWidth: true,
                                          onPressed: () {},
                                          backgroundColor: Color(0xff0d47a1),
                                          textColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 18)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: MyBtn(
                                          label: "GOOGLE",
                                          fullWidth: true,
                                          onPressed: () {},
                                          backgroundColor: Color(0xfff50057),
                                          textColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 18)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          ),
          if (_isFetching)
            Positioned.fill(
                child: Container(
              color: Colors.white70,
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: 15,
                ),
              ),
            ))
        ],
      )),
    );
  }
}
