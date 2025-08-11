import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';

class GradientCard extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry padding;
  final Widget child;
  const GradientCard({
    super.key,
    required this.height,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: BackgroundGradient(
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
