import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/screens/home_screen.dart';
import 'package:wisefox/features/dashboard/presentation/screens/main_transactions_screen.dart';
import 'package:wisefox/features/dashboard/presentation/screens/savings_screen.dart';
import 'package:wisefox/features/dashboard/presentation/screens/statistics_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  Widget _buildIcon(String assetPath, int index) {
    final bool isActive = _currentIndex == index;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration:
          isActive
              ? BoxDecoration(
                color: AppColors.darkBlue,
                shape: BoxShape.circle,
              )
              : null,
      child: SvgPicture.asset(
        assetPath,
        width: 25.w,
        height: 25.h,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.white : AppColors.darkBlue,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: kToolbarHeight,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        border: Border.all(color: Colors.transparent),
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(icon: _buildIcon('assets/icons/Home.svg', 0)),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/Empty-Wallet.svg', 1),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/Chart-Square.svg', 2),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/Dollar-Circle.svg', 3),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomeScreen();
          case 1:
            return MainTransactionsScreen();
          case 2:
            return StatisticsScreen();
          case 3:
            return SavingsScreen();
          default:
            return HomeScreen();
        }
      },
    );
  }
}
