import 'package:flutter/cupertino.dart';
import 'package:wisefox/core/utilities/colors.dart';

class RoundedGradientButton extends StatelessWidget {
  final void Function()? onPressed;
  const RoundedGradientButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(colors: CustomColors.roundedButtonGradient),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            'Log In',
            style: TextStyle(color: CustomColors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
