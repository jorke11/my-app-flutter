import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/images_page.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/pages/login_page.dart';
import 'package:my_flutter_app/pages/post_page.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus =  FocusScope.of(context);
        if(!focus.hasPrimaryFocus){
          focus.unfocus();
        }
      },
        child: MaterialApp(
      home: SplasPage(),
      routes: {
        ImagesPage.routeName: (BuildContext context) => ImagesPage(),
        HomePage.routeName: (_) => HomePage(),
        PostPage.routeName: (_) => PostPage(),
        LoginPage.routeName: (_) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    ));
  }
}
