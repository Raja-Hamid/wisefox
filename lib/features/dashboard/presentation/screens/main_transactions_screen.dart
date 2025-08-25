import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_segmented_control.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/income_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/spendings_card.dart';

class MainTransactionsScreen extends StatefulWidget {
  const MainTransactionsScreen({super.key});

  @override
  State<MainTransactionsScreen> createState() => _MainTransactionsScreenState();
}

class _MainTransactionsScreenState extends State<MainTransactionsScreen> {
  String _selectedSegment = 'Income';
  final List<Map<String, String>> spendings = [
    {
      'title': 'Food',
      'subtitle': 'Coffee',
      'icon': 'assets/icons/food.svg',
      'amount': '-10,00',
      'time': '2 days ago',
    },
    {
      'title': 'Transportation',
      'subtitle': 'Uber',
      'icon': 'assets/icons/car.svg',
      'amount': '-8,00',
      'time': '3 days ago',
    },
    {
      'title': 'Shopping',
      'subtitle': 'Channel',
      'icon': 'assets/icons/shopping.svg',
      'amount': '-40,00',
      'time': '4 days ago',
    },
    {
      'title': 'Entertainment',
      'subtitle': 'Netflix',
      'icon': 'assets/icons/tv.svg',
      'amount': '-25,00',
      'time': '3 days ago',
    },
  ];
  final List<Map<String, String>> incomes = [
    {
      'title': 'Salary',
      'icon': 'assets/icons/food.svg',
      'amount': '-10,00',
      'time': '2 days ago',
    },
    {
      'title': 'Business',
      'subtitle': 'Uber',
      'icon': 'assets/icons/car.svg',
      'amount': '-8,00',
      'time': '3 days ago',
    },
    {
      'title': 'Freelance',
      'subtitle': 'Channel',
      'icon': 'assets/icons/shopping.svg',
      'amount': '-40,00',
      'time': '4 days ago',
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
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    _selectedSegment == 'Spendings'
                        ? spendings.length
                        : incomes.length,
                itemBuilder: (context, index) {
                  if (_selectedSegment == 'Spendings') {
                    final spending = spendings[index];
                    return SpendingsCard(
                      title: spending['title']!,
                      subtitle: spending['subtitle']!,
                      icon: spending['icon']!,
                      amount: spending['amount']!,
                      time: spending['time']!,
                      height: 165.h,
                      width: 165.w,
                    );
                  } else {
                    final income = incomes[index];
                    return IncomeCard(
                      title: income['title']!,
                      icon: income['icon']!,
                      amount: income['amount']!,
                      time: income['time']!,
                      height: 165.h,
                      width: 165.w,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
