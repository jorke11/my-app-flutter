import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/chat_page.dart';
import 'package:my_flutter_app/pages/images_page.dart';
import 'package:my_flutter_app/pages/home_page_tabs/history_tab.dart';
import 'package:my_flutter_app/pages/home_page_tabs/home_tab.dart';
import 'package:my_flutter_app/pages/home_page_tabs/more_tab.dart';
import 'package:my_flutter_app/pages/home_page_tabs/oferts_tab.dart';
import 'package:my_flutter_app/widgets/my_appbar.dart';
import 'package:my_flutter_app/widgets/my_page_view.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  static final routeName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;


  final _menu = [
            BottomMenuItem(
                iconPath: 'assets/icons/menu.svg',
                label: "Menu",
                content: HomeTab()),
            BottomMenuItem(
                iconPath: 'assets/icons/menu.svg',
                label: "Historial",
                content: HistoryTab()),
            BottomMenuItem(
                iconPath: 'assets/icons/menu.svg',
                label: "Ofertas",
                content: OfertsTab()),
            BottomMenuItem(
                iconPath: 'assets/icons/menu.svg',
                label: "Perfil",
                content: MoreTabs()),
          ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomMenu(
          currentPage: _currentPage,
          onChange: (int newCurrentPage) {
             setState(() {
               _currentPage = newCurrentPage;
             });
            //_pageViewController.jumpToPage(newCurrentPage);
          },
          items: _menu,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                //myAppbar
                MyAppbar(
                  rightIcon:
                      "https://image.flaticon.com/icons/svg/685/685655.svg",
                  leftIcon:
                      "https://image.flaticon.com/icons/svg/685/685655.svg",
                  onRightClick: () {
                    final route = MaterialPageRoute(
                        builder: (BuildContext _) => ChatPage(
                              username: "Jorge",
                            ));
                    Navigator.push(context, route);
                  },
                  onLeftClick: () {
                    Navigator.pushNamed(context, ImagesPage.routeName,
                        arguments:
                            ImagesPageArgs(username: 'JORGE', isActive: true));
                  },
                ),

                Expanded(
                    child: MypageView(
                      children: _menu.map<Widget>((item)=>item.content).toList(),
                      currentPage: _currentPage,
                    )
                )
              ],
            ),
          ),
        ));
  }
}
