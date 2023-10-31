import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  final Color color;
  RPSCustomPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1934400, size.height * 0.0107400);
    path_0.lineTo(size.width * 0.8069200, size.height * 0.0095200);
    path_0.quadraticBezierTo(size.width * 0.8834400, size.height * 0.0142600,
        size.width * 0.8967200, size.height * 0.0966000);
    path_0.cubicTo(
        size.width * 0.9123200,
        size.height * 0.2377000,
        size.width * 0.9938000,
        size.height * 0.8016400,
        size.width * 0.9879800,
        size.height * 0.8927200);
    path_0.quadraticBezierTo(size.width * 0.9925400, size.height * 0.9961000,
        size.width * 0.8991600, size.height * 0.9849200);
    path_0.lineTo(size.width * 0.1005200, size.height * 0.9866400);
    path_0.quadraticBezierTo(size.width * 0.0058000, size.height * 0.9966200,
        size.width * 0.0138000, size.height * 0.8970000);
    path_0.cubicTo(
        size.width * 0.0036800,
        size.height * 0.8084600,
        size.width * 0.0813400,
        size.height * 0.2473600,
        size.width * 0.1009800,
        size.height * 0.0988200);
    path_0.quadraticBezierTo(size.width * 0.1148800, size.height * 0.0225200,
        size.width * 0.1934400, size.height * 0.0107400);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 3
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

////////
class RCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9976500, size.height * -0.0805500);
    path_0.lineTo(size.width * 0.9952500, size.height * 1.0984000);
    path_0.quadraticBezierTo(size.width * 0.8341500, size.height * 0.8257000,
        size.width * 0.6270000, size.height * 0.7855500);
    path_0.cubicTo(
        size.width * 0.5157500,
        size.height * 0.7590000,
        size.width * 0.3973500,
        size.height * 0.6401000,
        size.width * 0.4002500,
        size.height * 0.4969500);
    path_0.cubicTo(
        size.width * 0.4047500,
        size.height * 0.3587000,
        size.width * 0.5435000,
        size.height * 0.2643500,
        size.width * 0.6266000,
        size.height * 0.2503000);
    path_0.quadraticBezierTo(size.width * 0.8656000, size.height * 0.2075000,
        size.width * 0.9976500, size.height * -0.0805500);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// child: CustomPaint(
//   size: Size(WIDTH,(WIDTH*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//   painter: RPSCustomPainter(),
// ),

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 243, 169, 33)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4839250, size.height * 0.0333500);
    path_1.cubicTo(
        size.width * 0.5885250,
        size.height * 0.0321500,
        size.width * 0.8251500,
        size.height * 0.0061750,
        size.width * 0.8273750,
        size.height * 0.2030750);
    path_1.cubicTo(
        size.width * 0.8286500,
        size.height * 0.3124000,
        size.width * 0.6808500,
        size.height * 0.3972750,
        size.width * 0.4836500,
        size.height * 0.4108000);
    path_1.cubicTo(
        size.width * 0.3514000,
        size.height * 0.4110000,
        size.width * 0.1576000,
        size.height * 0.3779250,
        size.width * 0.1554000,
        size.height * 0.1865250);
    path_1.cubicTo(
        size.width * 0.1541250,
        size.height * 0.0771250,
        size.width * 0.3010000,
        size.height * 0.0355000,
        size.width * 0.4839250,
        size.height * 0.0333500);
    path_1.close();

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    random.nextInt(255), // Alpha (opacity) set to 255 for full opacity
    random.nextInt(230), // Red value between 0 and 255
    random.nextInt(236), // Green value between 0 and 255
    random.nextInt(236), // Blue value between 0 and 255
  );
}
