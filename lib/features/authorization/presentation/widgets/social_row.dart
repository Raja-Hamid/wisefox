import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 65,
          width: 65,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: CustomColors.lightGreen.withAlpha(
              (0.25 * 255).round(),
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Google.svg',
            colorFilter: ColorFilter.mode(
              CustomColors.white,
              BlendMode.srcIn,
            ),
            height: 25,
            width: 25,
          ),
        ),
        Container(
          height: 65,
          width: 65,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: CustomColors.lightGreen.withAlpha(
              (0.25 * 255).round(),
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Microsoft.svg',
            colorFilter: ColorFilter.mode(
              CustomColors.white,
              BlendMode.srcIn,
            ),
            height: 25,
            width: 25,
          ),
        ),
        Container(
          height: 65,
          width: 65,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: CustomColors.lightGreen.withAlpha(
              (0.25 * 255).round(),
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Apple.svg',
            colorFilter: ColorFilter.mode(
              CustomColors.white,
              BlendMode.srcIn,
            ),
            height: 25,
            width: 25,
          ),
        ),
      ],
    );
  }
}
