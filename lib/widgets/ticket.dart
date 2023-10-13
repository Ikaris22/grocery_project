import 'package:flutter/cupertino.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper(this.radiusTopRight, this.radiusTopLeft, this.radiusBottomRight,
      this.radiusBottomLeft);
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomRight;
  final double radiusBottomLeft;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(radiusTopLeft, 0.0);
    path.arcToPoint(Offset(0.0, radiusTopLeft),
        clockwise: true, radius: Radius.circular(radiusTopLeft));
    path.lineTo(0.0, size.height - radiusBottomLeft);
    path.arcToPoint(Offset(radiusBottomLeft, size.height),
        clockwise: true, radius: Radius.circular(radiusBottomLeft));
    path.lineTo(size.width - radiusTopRight, size.height);
    path.arcToPoint(Offset(size.width, size.height - radiusTopRight),
        clockwise: true, radius: Radius.circular(radiusTopRight));
    path.lineTo(size.width, radiusBottomRight);
    path.arcToPoint(Offset(size.width - radiusBottomRight, 0.0),
        clockwise: true, radius: Radius.circular(radiusBottomRight));

    /*..addOval(Rect.fromCircle(center: Offset.zero, radius: radius))
      ..addOval(
          Rect.fromCircle(center: Offset(size.width, 0.0), radius: radius))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width, size.height), radius: radius))
      ..addOval(
          Rect.fromCircle(center: Offset(0.0, size.height), radius: radius))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;*/
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ClipShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final List<ClipShadow> clipShadows;

  ClipShadowPainter(this.clipper, this.clipShadows);

  @override
  void paint(Canvas canvas, Size size) {
    clipShadows.forEach((ClipShadow shadow) {
      canvas.drawShadow(
          clipper.getClip(size), shadow.color, shadow.elevation, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow {
  final Color color;
  final double elevation;

  ClipShadow({required this.color, this.elevation = 5});
}

class Ticket extends StatelessWidget {
  const Ticket({
    Key? key,
    required this.radiusBottomLeft,
    required this.radiusTopRight,
    required this.radiusBottomRight,
    required this.radiusTopLeft,
    required this.child,
    this.clipShadows = const [],
  }) : super(key: key);
  final double radiusTopLeft;
  final Widget child;
  final double radiusTopRight;
  final double radiusBottomRight;
  final double radiusBottomLeft;
  final List<ClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    var clipper = TicketClipper(
        radiusBottomRight, radiusTopLeft, radiusTopRight, radiusBottomLeft);
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
