import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/savings_bottom_sheet.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/savings_card.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  final List<Map<String, String>> savings = [
    {
      'title': 'Buy a new Luxury House',
      'total amount': '1000000',
      'saved amount': '700000',
      'deadline': '2 months left',
    },
    {
      'title': 'Buy a new Car',
      'total amount': '600000',
      'saved amount': '200000',
      'deadline': '1 months left',
    },
    {
      'title': 'Buy a new Luxury House',
      'total amount': '1000000',
      'saved amount': '700000',
      'deadline': '2 months left',
    },
    {
      'title': 'Buy a new Car',
      'total amount': '600000',
      'saved amount': '200000',
      'deadline': '1 months left',
    },
  ];

  void addSaving(Map<String, String> saving) => setState(() {
    savings.insert(0, saving);
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.eggWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: (kToolbarHeight * 0.75).h),
            GradientCard(
              height: 300.h,
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Savings',
                    style: TextStyle(
                      color: AppColors.offWhite,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen.withValues(alpha: 0.19),
                      border: Border.all(
                        color: AppColors.lightGreen.withValues(alpha: 0.25),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: SvgPicture.asset(
                        'assets/icons/Savings-Icon.svg',
                        colorFilter: ColorFilter.mode(
                          AppColors.lightGreen,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Rs.2,000,000',
                    style: TextStyle(
                      color: AppColors.lightGreyish,
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Active Savings',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    '+ Add New',
                    style: TextStyle(color: AppColors.purple, fontSize: 12.sp),
                  ),
                  onPressed: () async {
                    final result =
                        await showCupertinoModalPopup<Map<String, String>>(
                          context: context,
                          builder:
                              (context) => CupertinoPopupSurface(
                                isSurfacePainted: true,
                                child: SavingsBottomSheet(),
                              ),
                        );
                    if (result != null) {
                      addSaving(result);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: savings.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SavingsCard(
                      title: savings[index]['title']!,
                      icon: 'assets/icons/Property-Icon.svg',
                      savedAmount: double.parse(
                        savings[index]['saved amount']!,
                      ),
                      totalAmount: double.parse(
                        savings[index]['total amount']!,
                      ),
                      duration: savings[index]['deadline']!,
                      height: 175.h,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
