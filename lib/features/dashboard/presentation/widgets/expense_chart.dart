import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0165DD).withValues(alpha: 0.89),
            Color(0xFF013677).withValues(alpha: 0.93),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rs. 3,280.00',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoButton(
                  color: Color(0xff5A78D3).withValues(alpha: 0.49),
                  borderRadius: BorderRadius.circular(30.r),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Year',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        CupertinoIcons.arrowtriangle_down_fill,
                        color: CupertinoColors.white,
                        size: 15.sp,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Container(
                          height: 1,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Container(
                          height: 1,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Container(
                          height: 1,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(10, (index) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 10.w,
                              height: 80.h,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'F',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
