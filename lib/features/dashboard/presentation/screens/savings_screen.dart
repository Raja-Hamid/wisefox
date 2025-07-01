import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.eggWhite,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              GradientCard(
                height: 330.h,
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  (kToolbarHeight * 1.25).h,
                  20.w,
                  20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          'assets/icons/Savings.svg',
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
                      style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
