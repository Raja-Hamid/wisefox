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
  final List<Map<String, String>> expenses = [
    {
      'title': 'Highest Expense',
      'icon': 'assets/icons/Arrow-Up-Icon.svg',
      'amount': '40000',
      'last amount': '58700',
    },
    {
      'title': 'Lowest Expense',
      'icon': 'assets/icons/Arrow-Down-Icon.svg',
      'amount': '2500',
      'last amount': '1200',
    },
  ];

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
                SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: MonthlyRateCard(
                          title: expenses[index]['title']!,
                          amount: double.parse(expenses[index]['amount']!),
                          lastAmount: double.parse(
                            expenses[index]['last amount']!,
                          ),
                          icon: expenses[index]['icon']!,
                          height: 140.h,
                          width: 275.w,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
