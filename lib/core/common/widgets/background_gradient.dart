import 'package:flutter/cupertino.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget? child;
  const BackgroundGradient({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [CupertinoColors.transparent, Color(0xFF0666D5)],
        ),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [CupertinoColors.transparent, Color(0xFFB87CD2)],
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [CupertinoColors.transparent, Color(0xFF0C0835)],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
