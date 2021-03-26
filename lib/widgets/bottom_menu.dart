import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenuItem {
  final String iconPath, label;
  final Widget content;

  BottomMenuItem({@required this.iconPath, @required this.label, @required this.content});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;
  final int currentPage;
  final void Function(int) onChange;

  BottomMenu({@required this.items, @required this.currentPage, this.onChange})
      : assert(items != null && items.length > 0),
        assert(currentPage >= 0 && currentPage != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final bool isActive = index == currentPage;
            final BottomMenuItem item = items[index];

            return Expanded(
                child: Container(
                    child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => onChange(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    item.iconPath,
                    width: 35,
                    color: isActive ? Colors.blue : Colors.black,
                  ),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12,
                      color: isActive ? Colors.blue : Colors.black,
                    ),
                  )
                ],
              ),
            )));
          }),
        )));
  }
}
