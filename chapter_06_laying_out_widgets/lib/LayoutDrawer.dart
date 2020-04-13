import 'package:flutter/material.dart';

class LayoutAppBar extends StatelessWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text("My Cool App"),
    );
  }

  PreferredSizeWidget toPreferredSizeWidget(BuildContext context) {
    return build(context);
  }
}

class LayoutDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text("Layout")),
          ListTile(
            title: const Text('SnackBar'),
            onTap: () {
              Navigator.pushNamed(context, '/snackBar');
            },
          ),
          ListTile(
            title: const Text('Infinite Height'),
            onTap: () {
              Navigator.pushNamed(context, '/infiniteHeight');
            },
          ),
          ListTile(
            title: const Text('FittedBox'),
            onTap: () {
              Navigator.pushNamed(context, '/fittedBox');
            },
          ),
          ListTile(
            title: const Text('Rows and Columns'),
            onTap: () {
              Navigator.pushNamed(context, '/rowsAndColumns');
            },
          ),
          ListTile(
            title: const Text('MainAxisAlignment'),
            onTap: () {
              Navigator.pushNamed(context, '/mainAxisAlignment');
            },
          ),
          ListTile(
            title: const Text('IntrinsicWidth'),
            onTap: () {
              Navigator.pushNamed(context, '/intrinsicWidth');
            },
          ),
          ListTile(
            title: const Text('Spacers and Expandeds'),
            onTap: () {
              Navigator.pushNamed(context, '/spacersAndExpandeds');
            },
          ),
          ListTile(
            title: const Text('Flex and Flexible'),
            onTap: () {
              Navigator.pushNamed(context, '/flexAndFlexible');
            },
          ),
          ListTile(
            title: const Text('ListView'),
            onTap: () {
              Navigator.pushNamed(context, '/listView');
            },
          ),
          ListTile(
            title: const Text('The Box Model'),
            onTap: () {
              Navigator.pushNamed(context, '/boxModel');
            },
          ),
          ListTile(
            title: const Text('Container'),
            onTap: () {
              Navigator.pushNamed(context, '/container');
            },
          ),
          ListTile(
            title: const Text('ListView with ListTile'),
            onTap: () {
              Navigator.pushNamed(context, '/listViewWithListTile');
            },
          ),
          ListTile(
            title: const Text('GridView - Extent'),
            onTap: () {
              Navigator.pushNamed(context, '/gridViewExtent');
            },
          ),
          ListTile(
            title: const Text('GridView - Count'),
            onTap: () {
              Navigator.pushNamed(context, '/gridViewCount');
            },
          ),
          ListTile(
            title: const Text('Tables'),
            onTap: () {
              Navigator.pushNamed(context, '/tables');
            },
          ),
        ],
      ),
    );
  }
}
