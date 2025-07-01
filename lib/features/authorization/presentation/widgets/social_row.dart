import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

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
            color: AppColors.lightGreen.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Google.svg',
            colorFilter: ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            height: 25.h,
            width: 25.w,
          ),
        ),
        Container(
          height: 65.h,
          width: 65.w,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: AppColors.lightGreen.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Microsoft.svg',
            colorFilter: ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            height: 25.h,
            width: 25.w,
          ),
        ),
        Container(
          height: 65.h,
          width: 65.w,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.lightGreen.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/Apple.svg',
            colorFilter: ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            height: 25.h,
            width: 25.w,
          ),
        ),
      ],
    );
  }
}
