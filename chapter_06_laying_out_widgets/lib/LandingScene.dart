import 'package:flutter/material.dart';
import 'LayoutDrawer.dart';

class LandingSceneDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
    );
  }
}

