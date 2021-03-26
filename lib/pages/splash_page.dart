import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/pages/home_page.dart';
import 'package:my_flutter_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplasPage extends StatefulWidget {
  @override
  _SplasPageState createState() => _SplasPageState();
}

class _SplasPageState extends State<SplasPage> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CupertinoActivityIndicator(
        radius: 15,
      )),
    );
  }

  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool wasLogin = prefs.getBool("wasLogin");
    if (wasLogin == null || wasLogin == false) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) {
      this._checkLogin();
    });
  }
}
