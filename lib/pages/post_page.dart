import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/my_appbar.dart';
import '../utils/fake_list.dart';

class PostPage extends StatefulWidget {
  static final routeName = "posts";

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            MyAppbar(
              rightIcon: "https://image.flaticon.com/icons/svg/685/685655.svg",
              leftIcon: "https://image.flaticon.com/icons/svg/685/685655.svg",
              onLeftClick: () => Navigator.pop(context),
              onRightClick: (){
                setState(() {
                  _data.add("Item ${_data.length}");
                  //_data.insert(_data.length-1,"Item ${_data.length}");
                });

                //_data.insert(_data.length-1,"Item ${_data.length}");
                
              },
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (content, int position) {
                final String item = _data[position];
                return ListTile(
                  title: Text(item),
                  subtitle: Text("Subtitle"),
                  leading: Icon(Icons.watch),
                  onTap: () {},
                  onLongPress: () {
                    setState(() {
                      _data.removeAt(position);
                    });
                  },
                );
              },
              itemCount: _data.length,
            ))
          ],
        ),
      )),
    );
  }
}
