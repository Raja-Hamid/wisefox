import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisefox/core/utilities/colors.dart';

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
        isShowAll ? CustomColors.purple : CustomColors.lightGreen;
    final Color selectedBorderColor =
        isShowAll
            ? CustomColors.purple.withAlpha((0.10 * 255).round())
            : CustomColors.green.withAlpha((0.10 * 255).round());
    final Color unselectedBorderColor =
        isShowAll ? CustomColors.purple : CustomColors.green;
    final Color unselectedTextColor =
        isShowAll ? CustomColors.purple : CustomColors.green;

    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? selectedBgColor : Colors.transparent,
        border: Border.all(
          color:
              isSelected
                  ? selectedBorderColor
                  : unselectedBorderColor.withAlpha((0.8 * 255).round()),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        color: Colors.transparent,
        minSize: 0,
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? CustomColors.lightBlack : unselectedTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
