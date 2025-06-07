import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final String? icon;
  const RoundedTextField({super.key, required this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: CustomColors.lightGreen.withAlpha((0.15 * 255).round()),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: CustomColors.lightGreen, width: 1),
      ),
      placeholder: hintText,
      placeholderStyle: TextStyle(color: CupertinoColors.white, fontSize: 14),
      prefix:
          icon != null
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
                  icon!,
                  colorFilter: ColorFilter.mode(
                    CustomColors.offWhite,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                  width: 20,
                ),
              )
              : null,
    );
  }
}
