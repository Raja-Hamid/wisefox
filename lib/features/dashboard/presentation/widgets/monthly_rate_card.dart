import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class MonthlyRateCard extends StatelessWidget {
  const MonthlyRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      height: 150.h,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
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
                    '',
                    colorFilter: ColorFilter.mode(
                      AppColors.lightGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Highest Expense',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'Rs. 400,00',
            style: TextStyle(
              color: Color(0xffA5EA75),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Last month you expended  Rs. 587,00 ',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
