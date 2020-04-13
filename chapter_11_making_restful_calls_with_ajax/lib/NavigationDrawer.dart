import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'lib/assets/images/BrandLogo.jpg',
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'My Brand',
                      style: Theme.of(context).textTheme.display1,
                    )),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_right),
            title: const Text('Simple Get'),
            onTap: () {
              Navigator.pushNamed(context, '/simpleGet');
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Pexels Photo Search'),
            onTap: () {
              Navigator.pushNamed(context, '/pexelsPhotos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('People Maintenance'),
            onTap: () {
              Navigator.pushNamed(context, '/peopleList');
            },
          ),
        ],
      ),
    );
  }
}
