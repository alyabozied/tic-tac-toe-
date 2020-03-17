import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';

class O extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.blue;
    final redPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    // canvas.drawRect(Rect.fromLTWH(0, 0, 50, 50), paint);
    canvas.drawCircle(Offset(10, 10), 30, paint);
  }

  @override
  bool shouldRepaint(O oldDelgate) => false;
}

class X extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.blue;
    final redPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.rotate(45 * 3.14 / 180);
    canvas.drawRect(Rect.fromLTWH(0, -40, 10, 100), redPaint);
    canvas.drawRect(Rect.fromLTWH(-40, 0, 100, 10), redPaint);
    // canvas.drawCircle(Offset(10, 10), 30, paint);
  }

  @override
  bool shouldRepaint(X oldDelgate) => false;
}

class X_animated extends StatefulWidget {
  final int type;
  const X_animated({key: Key, this.type});
  _X_animated createState() => _X_animated();
}

class _X_animated extends State<X_animated>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animController)
      ..addListener(() {
        setState(() {});
      });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.type == 0) {
      image = "assets/X.png";
    } else
      image = 'assets/O.png';
    return Transform.scale(
      scale: animation.value,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Image(image: AssetImage(image)),
        // CustomPaint(painter: X()),
      ),
    );
    ;
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/X.png');
}
