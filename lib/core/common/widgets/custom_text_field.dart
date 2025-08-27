import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintedText;
  final TextInputType? keyboardType;
  final String? icon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintedText,
    this.keyboardType,
    this.icon,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            CupertinoTextField(
              controller: widget.controller,
              placeholder: widget.hintedText,
              keyboardType: widget.keyboardType,
              obscureText: _isObscure,
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
                  widget.obscureText == true
                      ? Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: GestureDetector(
                          onTap:
                              () => setState(() {
                                _isObscure = !_isObscure;
                              }),
                          child: Icon(
                            _isObscure
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
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
