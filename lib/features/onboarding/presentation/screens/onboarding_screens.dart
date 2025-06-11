import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_in_screen.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < titles.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  void skipToLast() {
    _pageController.animateToPage(
      titles.length - 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  List<String> titles = [
    'Easily track your daily\nincome and expenses.',
    'Your data is protected with\nbank-level security standards.',
    'Visualize your spending habits\nand make smarter decisions.',
  ];
  List<String> images = [
    'assets/images/Wallet.png',
    'assets/images/Safebox.png',
    'assets/images/Money.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CustomColors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: titles.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          images[index],
                          width: 500,
                          height: 500,
                        ),
                      ),
                      Text(
                        titles[index],
                        style: TextStyle(
                          color: CustomColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                titles.length,
                    (index) => AnimatedContainer(
                  padding: EdgeInsets.zero,
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 12 : 8,
                  height: currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color:
                    currentPage == index
                        ? CustomColors.purple
                        : CustomColors.lightPurple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    skipToLast();
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: CustomColors.purple, fontSize: 16),
                  ),
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: CustomColors.blue,
                    child: SvgPicture.asset(
                      'assets/icons/Arrow-Right.svg',
                      colorFilter: ColorFilter.mode(
                        CustomColors.offWhite,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  onTap: () {
                    nextPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
