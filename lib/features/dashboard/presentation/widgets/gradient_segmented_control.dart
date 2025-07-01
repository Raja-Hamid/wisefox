import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class GradientSegmentedControl extends StatelessWidget {
  final String selectedSegment;
  final ValueChanged<String?> onValueChanged;

  const GradientSegmentedControl({
    super.key,
    required this.selectedSegment,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff01306A), Color(0xff015FD0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: CupertinoSlidingSegmentedControl(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        thumbColor: Color(0xffFFFBFC),
        backgroundColor: Colors.transparent,
        groupValue: selectedSegment,
        onValueChanged: onValueChanged,
        children: <String, Widget>{
          'Income': Text(
            'Income',
            style: TextStyle(
              color:
                  selectedSegment == 'Income'
                      ? AppColors.darkBlue
                      : AppColors.white,
              fontSize: 15,
            ),
          ),
          'Spendings': Text(
            'Spendings',
            style: TextStyle(
              color:
                  selectedSegment == 'Spendings'
                      ? AppColors.darkBlue
                      : AppColors.white,
              fontSize: 15,
            ),
          ),
        },
      ),
    );
  }
}
