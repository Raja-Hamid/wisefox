import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final String? icon;
  final TextEditingController controller;
  final bool obscureText;
  const RoundedTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      obscureText: obscureText,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreen.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.lightGreen, width: 1.w),
      ),
      placeholder: hintText,
      placeholderStyle: TextStyle(color: CupertinoColors.white, fontSize: 14.sp),
      prefix:
          icon != null
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SvgPicture.asset(
                  icon!,
                  colorFilter: ColorFilter.mode(
                    AppColors.offWhite,
                    BlendMode.srcIn,
                  ),
                  height: 20.h,
                  width: 20.w,
                ),
              )
              : null,
    );
  }
}
