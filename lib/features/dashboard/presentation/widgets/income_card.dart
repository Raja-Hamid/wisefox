import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String icon;
  final String amount;
  final String time;
  final double height;
  final double width;
  const IncomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.amount,
    required this.time,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            offset: const Offset(0, 7),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffA5EA75), Color(0xffEFEFEF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 0.7],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.w,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: Color(0xffA5EA75).withValues(alpha: 0.50),
                        border: Border.all(
                          color: Color(0xff4EA016).withValues(alpha: 0.20),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        icon,
                        colorFilter: ColorFilter.mode(
                          Color(0xff4EA016),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  'Rs. $amount',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  time,
                  style: TextStyle(
                    color: Color(0xff767676),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
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
