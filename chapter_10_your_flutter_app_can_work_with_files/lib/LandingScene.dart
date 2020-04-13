import 'package:flutter/material.dart';
import 'LayoutDrawer.dart';

class LandingScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _greetingWidget,
    );
  }

  Widget get _greetingWidget {
    return Text("Worked!");
  }
}