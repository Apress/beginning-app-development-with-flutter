import 'package:flutter/material.dart';
import 'LayoutDrawer.dart';

class MainAxisAlignmentSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.tealAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SubWidget(),
          Spacer(),
          Expanded(flex: 1, child: SubWidget()),
          Spacer(flex: 2),
          Expanded(flex: 3, child: SubWidget()),
          Expanded(flex: 2, child: SubWidget()),
          SubWidget(),
          SizedBox(
            width: 10,
          ),
          SubWidget(),
        ],
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  final double height;
  final double width;
  SubWidget({this.height = 25.0, this.width = 25.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.teal),
      width: width,
      height: height,
      //margin: EdgeInsets.all(10),
      child: FittedBox(child: Icon(Icons.public)),
    );
  }
}

class MainAxisAlignmentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: MainAxisAlignmentSetting(),
    );
  }
}
