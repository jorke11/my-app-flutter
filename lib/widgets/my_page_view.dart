import 'package:flutter/material.dart';

class MypageView extends StatefulWidget {
  final int currentPage;
  final List<Widget> children;

  const MypageView(
      {Key key, @required this.currentPage, @required this.children})
      : assert(currentPage != null && currentPage >= 0),
        assert(children != null && children.length >= 0),
        super(key: key);

  @override
  _MypageViewState createState() => _MypageViewState();
}

class _MypageViewState extends State<MypageView> {
  List<int> _renderdPages = [0];


  @override
  void didUpdateWidget(MypageView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Change ${widget.currentPage}");
    if(!_renderdPages.contains(widget.currentPage)){
      setState(() {
        _renderdPages.add(widget.currentPage);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: List.generate(widget.children.length, (index){
        return _renderdPages.contains(index)?widget.children[index]:Container();
      }),
      index: widget.currentPage,
    );
  }
}
