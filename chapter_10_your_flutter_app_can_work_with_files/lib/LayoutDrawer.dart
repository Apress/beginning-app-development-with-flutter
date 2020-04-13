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
          DrawerHeader(child: Text("Your Flutter app can work with files")),
          ListTile(
            title: const Text('Read an asset file'),
            onTap: () {
              Navigator.pushNamed(context, '/readAssetsFile');
            },
          ),
          ListTile(
            title: const Text('Write a new file'),
            onTap: () {
              Navigator.pushNamed(context, '/writeNewFile');
            },
          ),
          ListTile(
            title: const Text('Read an existing file'),
            onTap: () {
              Navigator.pushNamed(context, '/readAFile');
            },
          ),
          ListTile(
            title: const Text('Write to a new file'),
            onTap: () {
              Navigator.pushNamed(context, '/writeNewFile');
            },
          ),
          ListTile(
            title: const Text('Read and write JSON data'),
            onTap: () {
              Navigator.pushNamed(context, '/jsonReadingAndWriting');
            },
          ),
          ListTile(
            title: const Text('Changing user preferences'),
            onTap: () {
              Navigator.pushNamed(context, '/changingUserPreferences');
            },
          ),
        ],
      ),
    );
  }
}
