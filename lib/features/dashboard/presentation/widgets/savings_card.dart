import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class SavingsCard extends StatelessWidget {
  final String title;
  final String icon;
  final double totalAmount;
  final double savedAmount;
  final String duration;
  final double height;
  const SavingsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.totalAmount,
    required this.savedAmount,
    required this.duration,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0165DD).withValues(alpha: 0.89),
            Color(0xFF013677).withValues(alpha: 0.93),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    duration,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40.h,
                width: 40.w,
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
                    icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.lightGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. $savedAmount',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Rs. $totalAmount',
                style: TextStyle(
                  color: AppColors.lightGreen,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: LinearProgressIndicator(
              minHeight: 10.h,
              stopIndicatorRadius: 20.r,
              borderRadius: BorderRadius.circular(20.r),
              value: (totalAmount / (savedAmount + totalAmount)),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFA855F7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
