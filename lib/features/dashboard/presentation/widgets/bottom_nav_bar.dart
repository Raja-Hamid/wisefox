import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';
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
      padding: const EdgeInsets.all(10),
      decoration:
          isActive
              ? BoxDecoration(
                color: CustomColors.darkBlue,
                shape: BoxShape.circle,
              )
              : null,
      child: SvgPicture.asset(
        assetPath,
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          isActive ? CustomColors.white : CustomColors.darkBlue,
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
        backgroundColor: CustomColors.white,
        items: [
          BottomNavigationBarItem(icon: _buildIcon('assets/icons/home.svg', 0)),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/empty-wallet.svg', 1),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/chart-square.svg', 2),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/dollar-circle.svg', 3),
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
