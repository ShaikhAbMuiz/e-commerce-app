import 'package:flutter/material.dart';

class UCustomRoundedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    /// Top To Buttom Line
    path.lineTo(0, size.height - 40);

    /// First Curve
    Offset firstPointCurve1 = Offset(40, size.height);
    Offset secondPointCurve1 = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
      firstPointCurve1.dx,
      firstPointCurve1.dy,
      secondPointCurve1.dx,
      secondPointCurve1.dy,
    );

    /// Second Curve
    Offset firstPointCurve2 = Offset(size.width - 40, size.height);
    Offset secondPointCurve2 = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstPointCurve2.dx,
      firstPointCurve2.dy,
      secondPointCurve2.dx,
      secondPointCurve2.dy,
    );

    /// Buttom to Top  Line
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
