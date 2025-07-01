import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class RoundedGradientButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const RoundedGradientButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          gradient: LinearGradient(colors: AppColors.roundedButtonGradient),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: AppColors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
