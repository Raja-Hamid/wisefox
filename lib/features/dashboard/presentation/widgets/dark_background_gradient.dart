import 'dart:ui';
import 'package:flutter/material.dart';

class DarkBackgroundGradient extends StatelessWidget {
  final Widget child;
  const DarkBackgroundGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1.25),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF7441FF).withAlpha((0.4 * 255).round()),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-2, 0.65),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF7441FF).withAlpha((0.4 * 255).round()),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.25),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF7441FF).withAlpha((0.4 * 255).round()),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(2, -0.65),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF7441FF).withAlpha((0.4 * 255).round()),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
          ),
        ),
        child,
      ],
    );
  }
}
