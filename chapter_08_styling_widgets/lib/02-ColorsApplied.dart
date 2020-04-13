import 'package:flutter/material.dart';
import 'dart:math';

class ColorsApplied extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Ch 8 - Colors')),
          body: Container(

          child: Stack(
        children: <Widget>[
          ColorBlocks(),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Text(
                'Colors!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 5,
                  )),
            ),
          ),
        ],
      ),
    ),);
  }
}

class ColorBlocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200.0,
      children: _randomColors(24),
    );
  }

  List<Widget> _randomColors(int numBlocks) {
    Random rnd = Random();
    return List.generate(
        numBlocks,
        (int i) => Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(
                    rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1.0),
              ),
              // child: CustomPaint(
              //   size: Size(200, 200),
              //   painter: SupermanShieldPainter(),
              // ),
            ));
  }
}

class SupermanShield extends StatelessWidget {
  const SupermanShield({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: SupermanShieldPainter(),
    );
  }
}

class SupermanShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        Path()
          ..moveTo(25, 0)
          ..lineTo(125, 0)
          ..lineTo(150, 25)
          ..lineTo(75, 125)
          ..lineTo(0, 25)
          ..lineTo(25, 0),
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red);
  }

  @override
  bool shouldRepaint(SupermanShieldPainter oldDelegate) => false;
}
