import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintedText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final void Function()? onTap;
  final void Function()? onIconTap;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintedText,
    this.keyboardType,
    this.icon,
    this.onTap,
    this.onIconTap,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            CupertinoTextField(
              controller: controller,
              placeholder: hintedText,
              keyboardType: keyboardType,
              obscureText: obscureText,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: (value) => state.didChange(value),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.darkGrey.withValues(alpha: 0.3),
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              suffix:
                  icon != null
                      ? Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: GestureDetector(
                          onTap: onIconTap,
                          child: Icon(
                            icon,
                            size: 20,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      )
                      : null,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: 6.h, left: 12.w),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: CupertinoColors.systemRed,
                    fontSize: 12.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
