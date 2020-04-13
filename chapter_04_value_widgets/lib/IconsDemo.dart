import 'dart:math';
import 'package:flutter/material.dart';

class IconsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 5,
        children: _iconList
            .map<Icon>((IconData id) => Icon(
                  id,
                  size: 75,
                  color: getRandomColor(),
                ))
            .toList(),
      ),
    );
  }

  final List<IconData> _iconList = <IconData>[
    Icons.phone_android,
    Icons.phone_iphone,
    Icons.local_see,
    Icons.local_pizza,
    Icons.location_city,
    Icons.lock,
    Icons.loupe,
    Icons.memory,
    Icons.mic,
    Icons.map,
    Icons.monetization_on,
    Icons.mood,
    Icons.mood_bad,
    Icons.movie,
    Icons.message,
    Icons.motorcycle,
    Icons.note,
    Icons.palette,
    Icons.perm_device_information,
    Icons.pie_chart,
    Icons.pool,
    Icons.power,
    Icons.print,
    Icons.public,
    Icons.radio,
    Icons.shopping_cart,
    Icons.spa,
    Icons.speaker,
    Icons.store,
    Icons.thumb_up,
    Icons.timer,
    Icons.watch,
  ];
  Color getRandomColor() {
    final Random rnd = Random();
    return Color.fromRGBO(
        rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1.0);
  }
}
