import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';

class SavingsCard extends StatelessWidget {
  final SavingsCategory category;
  final String description;
  final double totalAmount;
  final double savedAmount;
  final DateTime duration;
  final double height;
  const SavingsCard({
    super.key,
    required this.description,
    required this.category,
    required this.totalAmount,
    required this.savedAmount,
    required this.duration,
    required this.height,
  });

  String _getCategoryIcon(SavingsCategory category) {
    switch (category) {
      case SavingsCategory.vehicle:
        return "assets/icons/vehicle.svg";
      case SavingsCategory.property:
        return "assets/icons/property.svg";
      case SavingsCategory.education:
        return "assets/icons/education.svg";
      case SavingsCategory.electronicGadget:
        return "assets/icons/gadget.svg";
      case SavingsCategory.other:
        return "assets/icons/other.svg";
    }
  }

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
                    description,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '$duration',
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
                    _getCategoryIcon(category),
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
              value: savedAmount / totalAmount,
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
