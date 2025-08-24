import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/expense_chart.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/incomes_chart.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/monthly_rate_card.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.eggWhite,
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        bottom: null,
        middle: Text(
          'Statistics',
          style: TextStyle(
            color: AppColors.lightBlack,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expenses',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                ExpenseChart(),
                SizedBox(height: 20.h),
                Text(
                  'Incomes',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                IncomesChart(),
                SizedBox(height: 20.h),
                Text(
                  'Monthly Rate',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                MonthlyRateCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
