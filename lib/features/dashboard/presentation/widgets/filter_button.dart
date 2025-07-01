import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isShowAll = label == 'Show all';
    final Color selectedBgColor =
        isShowAll ? AppColors.purple : AppColors.lightGreen;
    final Color selectedBorderColor =
        isShowAll
            ? AppColors.purple.withValues(alpha: 0.10)
            : AppColors.green.withValues(alpha: 0.10);
    final Color unselectedBorderColor =
        isShowAll ? AppColors.purple : AppColors.green;
    final Color unselectedTextColor =
        isShowAll ? AppColors.purple : AppColors.green;

    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        color: isSelected ? selectedBgColor : Colors.transparent,
        border: Border.all(
          color:
              isSelected
                  ? selectedBorderColor
                  : unselectedBorderColor.withValues(alpha: 0.8),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        color: Colors.transparent,
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: isSelected ? AppColors.lightBlack : unselectedTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
