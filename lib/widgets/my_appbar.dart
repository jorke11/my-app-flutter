import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppbar extends StatelessWidget {
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;

  const MyAppbar(
      {Key key,
      @required this.leftIcon,
      @required this.rightIcon,
      this.onLeftClick,
      this.onRightClick})
      : super(key: key);

//https://image.flaticon.com/icons/svg/685/685655.svg

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
              padding: EdgeInsets.all(10),
              child: SvgPicture.network(
                leftIcon,
                width: 50,
              ),
              onPressed: onLeftClick),
          Text(
            "LOGO",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.network(
                      rightIcon,
                      width: 50,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
              onPressed: onRightClick),
        ],
      ),
    );
  }
}
