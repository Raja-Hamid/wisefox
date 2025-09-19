import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/transactions_bottom_sheet.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_segmented_control.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/income_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/spendings_card.dart';

class MainTransactionsScreen extends StatefulWidget {
  const MainTransactionsScreen({super.key});

  @override
  State<MainTransactionsScreen> createState() => _MainTransactionsScreenState();
}

class _MainTransactionsScreenState extends State<MainTransactionsScreen> {
  final TextEditingController category = TextEditingController();
  final TextEditingController subtitle = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController time = TextEditingController();

  String _selectedSegment = 'Income';
  final List<Map<String, String>> spendings = [
    {
      'title': 'Food',
      'subtitle': 'Coffee',
      'icon': 'assets/icons/Food-Icon.svg',
      'amount': '-10,00',
      'time': '2 days ago',
    },
    {
      'title': 'Transportation',
      'subtitle': 'Uber',
      'icon': 'assets/icons/Transport-Icon.svg',
      'amount': '-8,00',
      'time': '3 days ago',
    },
    {
      'title': 'Shopping',
      'subtitle': 'Channel',
      'icon': 'assets/icons/Shopping-Icon.svg',
      'amount': '-40,00',
      'time': '4 days ago',
    },
    {
      'title': 'Entertainment',
      'subtitle': 'Netflix',
      'icon': 'assets/icons/Entertainment-Icon.svg',
      'amount': '-25,00',
      'time': '3 days ago',
    },
  ];
  final List<Map<String, String>> incomes = [
    {
      'title': 'Salary',
      'icon': 'assets/icons/Salary-Icon.svg',
      'amount': '10,000',
      'time': '2 days ago',
    },
    {
      'title': 'Business',
      'icon': 'assets/icons/Business-Icon.svg',
      'amount': '8,000',
      'time': '2 days ago',
    },
    {
      'title': 'Freelance',
      'icon': 'assets/icons/Freelance-Icon.svg',
      'amount': '2,000',
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
        child: Stack(
          children: [
            Padding(
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
                      childAspectRatio: 1.sp,
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
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
            Positioned(
              right: 20.w,
              bottom: 30.h,
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color:
                        _selectedSegment == 'Spendings'
                            ? Color(0xffB87CD2).withValues(alpha: 0.45)
                            : Color(0xff367C2D).withValues(alpha: 0.15),
                  ),
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  sizeStyle: CupertinoButtonSize.large,
                  color:
                      _selectedSegment == 'Spendings'
                          ? Color(0xffB87CD2).withValues(alpha: 0.40)
                          : Color(0xffA5EA75),
                  borderRadius: BorderRadius.circular(30.r),
                  onPressed:
                      () => showCupertinoModalPopup(
                        context: context,
                        builder:
                            (context) => CupertinoPopupSurface(
                              isSurfacePainted: true,
                              child: TransactionsBottomSheet(
                                selectedSegment: _selectedSegment,
                                onPressed: () async {},
                              ),
                            ),
                      ),
                  child: Icon(
                    CupertinoIcons.add,
                    color:
                        _selectedSegment == 'Spendings'
                            ? Color(0xffB87CD2)
                            : Color(0xff4EA016),
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
