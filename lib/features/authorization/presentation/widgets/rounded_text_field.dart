import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final String? icon;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  const RoundedTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: widget.controller,
              obscureText: _isObscure,
              onChanged: (value) => state.didChange(value),
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: AppColors.lightGreen, width: 1.w),
              ),
              placeholder: widget.hintText,
              placeholderStyle: TextStyle(
                color: CupertinoColors.white,
                fontSize: 14.sp,
              ),
              prefix:
                  widget.icon != null
                      ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SvgPicture.asset(
                          widget.icon!,
                          colorFilter: ColorFilter.mode(
                            AppColors.offWhite,
                            BlendMode.srcIn,
                          ),
                          height: 20.h,
                          width: 20.w,
                        ),
                      )
                      : null,
              suffix:
                  widget.obscureText == true
                      ? Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: GestureDetector(
                          onTap:
                              () => setState(() {
                                _isObscure = !_isObscure;
                              }),
                          child: Icon(
                            _isObscure
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            size: 20.sp,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      )
                      : null,
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
