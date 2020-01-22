import 'package:flutter/material.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatefulWidget {

  final double progressPercent;
  final String day;
  bool isSelected = false;

  RadialProgress({ this.progressPercent, this.day, this.isSelected });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              height: 40,
              width: 40,
              child: Center(
                child: Text(
                  widget.day,
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.isSelected ? pinkColor : Colors.grey.shade500,
                  ),
                ),
              ),
            ),
            painter: RadialPainter(progressPercent: widget.progressPercent),
          ),
        ],
      ),
    );
  }
}

class RadialPainter extends CustomPainter {

  double progressPercent;

  RadialPainter({ this.progressPercent });


  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint circlePaint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawCircle(center, size.width / 2, circlePaint);

    Paint fillPaint = Paint()
      ..shader = pinkToBlueGradient
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(360 * progressPercent),
        false,
        fillPaint,
    );
  }

  @override
  bool shouldRepaint(RadialPainter oldDelegate) {
    return oldDelegate.progressPercent != progressPercent;
  }

}
