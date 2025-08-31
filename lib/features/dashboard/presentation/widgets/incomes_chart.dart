import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class IncomesChart extends StatelessWidget {
  const IncomesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.r),
      width: double.infinity,
      height: 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0165DD).withValues(alpha: 0.89),
            Color(0xFF013677).withValues(alpha: 0.93),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Incomes',
                style: TextStyle(
                  color: AppColors.lightGreen,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Rs. 20,000',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Column(
            children: [
              TransparentCard(),
              SizedBox(height: 15.h),
              TransparentCard(),
              SizedBox(height: 15.h),
              TransparentCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class TransparentCard extends StatelessWidget {
  const TransparentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      width: 125.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF).withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Salary',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              Text(
                '50%',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
