import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_segmented_control.dart';

class MainTransactionsScreen extends StatefulWidget {
  const MainTransactionsScreen({super.key});

  @override
  State<MainTransactionsScreen> createState() => _MainTransactionsScreenState();
}

class _MainTransactionsScreenState extends State<MainTransactionsScreen> {
  String _selectedSegment = 'Income';
  String _selectedFilter = 'Show all';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.eggWhite,
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        bottom: null,
        middle: Text(
          'Main Transactions',
          style: TextStyle(
            color: AppColors.lightBlack,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              GradientSegmentedControl(
                selectedSegment: _selectedSegment,
                onValueChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  FilterButton(
                    label: 'Show all',
                    isSelected: _selectedFilter == 'Show all',
                    onPressed: () {
                      setState(() {
                        _selectedFilter = 'Show all';
                      });
                    },
                  ),
                  SizedBox(width: 10.w),
                  FilterButton(
                    label: 'Recents',
                    isSelected: _selectedFilter == 'Recents',
                    onPressed: () {
                      setState(() {
                        _selectedFilter = 'Recents';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
