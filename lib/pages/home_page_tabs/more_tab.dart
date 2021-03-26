import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/login_page.dart';
import 'package:my_flutter_app/utils/dialogs.dart';
import 'package:my_flutter_app/widgets/avatar.dart';
import 'package:my_flutter_app/widgets/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTabs extends StatefulWidget {
  @override
  _MoreTabsState createState() => _MoreTabsState();
}

class _MoreTabsState extends State<MoreTabs> {
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  _confirm() async {
    final isOk = await Dialogs.confirm(context,
    title: "Accion requerida",
        body: "Estas seguro de que deseas de su cuenta?");

        if(isOk){
          _logOut();
        }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xfff8f8f8),
                padding: EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Avatar(
                      size: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Bienvenido"),
                    Text("Jorge Pinedo g",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              LeftRightIconButton(
                leftIcon: "assets/icons/menu.svg",
                rightIcon: "assets/icons/menu.svg",
                label: "Cerrar Sesion",
                onPressed: _confirm,
              )
            ],
          ),
        ));
  }
}
