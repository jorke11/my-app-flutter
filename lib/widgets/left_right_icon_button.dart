import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftRightIconButton extends StatelessWidget {
  final String leftIcon, rightIcon, label;
  final VoidCallback onPressed;

  LeftRightIconButton(
      {Key key, this.leftIcon, this.rightIcon, this.label = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                if (leftIcon != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      leftIcon,
                      width: 30,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                )
              ],
            )),
            if (rightIcon != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  rightIcon,
                  width: 25,
                ),
              )
          ],
        ),
      ),
    );
  }
}
